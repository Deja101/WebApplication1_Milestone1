using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApplication1_Milestone1
{
    public partial class Cart : System.Web.UI.Page
    {
        private readonly string connectionString = @"Data Source=LAPTOP-8RR0FQBP\SQLEXPRESS;Initial Catalog=Bingy2;Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] == null)
                {
                    // If UserID is not in session, redirect to login
                    Response.Redirect("Login.aspx");
                    return;
                }

                LoadCart(); // Load the user's cart from the database
                UpdateCartTotalCookie();
            }
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            try
            {
                // Save cart details to the session
                StoreCartInSession();

                // Clear the session and redirect to the login page
                Session.Clear();
                Session.Abandon();
                Response.Redirect("Login.aspx");
            }
            catch (Exception ex)
            {
                // Log error or notify user
                Console.WriteLine("Error during logout: " + ex.Message);
            }
        }

        protected void CheckoutButton_Click(object sender, EventArgs e)
        {
            try
            {
                PlaceOrder();
                // Clear client-side cart data and update UI
                ClientScript.RegisterStartupScript(this.GetType(), "ClearCartScript", "clearClientCart();", true);
            }
            catch (Exception ex)
            {
                // Log error or notify user
                Console.WriteLine("Error during checkout: " + ex.Message);
            }
        }

        private void LoadCart()
        {
            if (Session["UserID"] == null) return;

            int userID = (int)Session["UserID"];
            var cart = new ShoppingCart();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = @"SELECT ProductID, Quantity, Price FROM ShoppingCart WHERE UserID = @UserID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserID", userID);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            var product = new Product
                            {
                                ProductID = reader.GetInt32(0),
                                Quantity = reader.GetInt32(1),
                                Price = reader.GetDouble(2)
                            };
                            cart.Products.Add(product);
                        }
                    }
                }
            }

            // Save the cart to the session
            Session["Cart"] = cart;
        }

        private void StoreCartInSession()
        {
            var cart = (ShoppingCart)Session["Cart"];
            if (cart == null || !cart.Products.Any()) return;

            // Save the cart to the session
            Session["Cart"] = cart;
        }

        private void UpdateCartTotalCookie()
        {
            var cart = (ShoppingCart)Session["Cart"];
            if (cart == null) return;

            HttpCookie cartTotalCookie = new HttpCookie("CartTotal")
            {
                Value = cart.GrandTotal.ToString("F2"),
                Expires = DateTime.Now.AddDays(7)
            };
            Response.Cookies.Add(cartTotalCookie);
        }

        public void PlaceOrder()
        {
            var cart = (ShoppingCart)Session["Cart"];
            if (cart == null || !cart.Products.Any()) return;

            // Order placement logic
            // Insert order details into an Orders table and handle payment if necessary

            // Clear cart in session after successful order placement
            cart.Products.Clear();
            Session["Cart"] = new ShoppingCart();
            UpdateCartTotalCookie();
        }

        // ShoppingCart class definition
        public partial class ShoppingCart
        {
            public List<Product> Products { get; set; } = new List<Product>();
            public double GrandTotal => Products.Sum(p => p.Subtotal);
        }

        // Product class definition
        public partial class Product
        {
            public string Name { get; set; }
            public int ProductID { get; set; }
            public double Price { get; set; }
            public int Quantity { get; set; }
            public double Subtotal => Price * Quantity;
        }
    }
}
