using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1_Milestone1
{
    public partial class AddProduct : System.Web.UI.Page
    {
      
            private readonly string connectionString = @"Data Source=LAPTOP-8RR0FQBP\SQLEXPRESS;Initial Catalog=Bingy2;Integrated Security=True;";

            protected void Page_Load(object sender, EventArgs e)
            {
                // Check if the user is logged in and their role
                if (Session["Role"] != null && Session["Role"].ToString() == "Admin")
                {
                    btnAddProduct.Visible = true;  // Show button for Admin
                }
                else
                {
                    btnAddProduct.Visible = false; // Hide button for non-Admin users
                }
            }

            protected void btnAddProduct_Click(object sender, EventArgs e)
            {
                // Get values from the TextBoxes
                string productid = txtProductID.Text; // Assuming you have a TextBox for ProductID
                decimal price;
                string category = txtCategory.Text; // Assuming you have a TextBox for Category
                string size = txtSize.Text; // Assuming you have a TextBox for Size
                string availabilityStatus = "In Stock"; // Set default or get from another TextBox
                DateTime dateAdded = DateTime.Now; // Sets the current date

                // Validate input
                if (string.IsNullOrEmpty(productid) || string.IsNullOrEmpty(category) || string.IsNullOrEmpty(size) ||
                    !decimal.TryParse(txtPrice.Text, out price))
                {
                    lblMessage.Text = "Please fill in all fields with valid data.";
                    lblMessage.CssClass = "text-danger";
                    return;
                }

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Adjusted the SQL query to exclude ProductID if it's an identity column
                    string query = "INSERT INTO Products (Price, Category, Size, AvailabilityStatus, DateAdded) " +
                                   "VALUES (@Price, @Category, @Size, @AvailabilityStatus, @DateAdded)";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters excluding ProductID
                        command.Parameters.AddWithValue("@Price", price);
                        command.Parameters.AddWithValue("@Category", category);
                        command.Parameters.AddWithValue("@Size", size);
                        command.Parameters.AddWithValue("@AvailabilityStatus", availabilityStatus);
                        command.Parameters.AddWithValue("@DateAdded", dateAdded);

                        try
                        {
                            connection.Open();
                            command.ExecuteNonQuery();
                            lblMessage.Text = "Product added successfully!";
                            lblMessage.CssClass = "text-success";
                        }
                        catch (SqlException sqlEx)
                        {
                            lblMessage.Text = "Database error: " + sqlEx.Message;
                            lblMessage.CssClass = "text-danger";
                        }
                        catch (Exception ex)
                        {
                            lblMessage.Text = "Error: " + ex.Message;
                            lblMessage.CssClass = "text-danger";
                        }
                    }
                }
            }
        }
    }