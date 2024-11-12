using System;
using System.Data.SqlClient;

namespace WebApplication1_Milestone1
{
    public partial class UpdateProduct : System.Web.UI.Page
    {
        private readonly string connectionString = @"Data Source=LAPTOP-8RR0FQBP\SQLEXPRESS;Initial Catalog=Bingy2;Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Only show the update button if the user is an admin
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                // Hide the update button for non-admin users
                btnUpdateProduct.Visible = false;
            }
            else
            {
                // Show the button only if user is an admin
                btnUpdateProduct.Visible = true;
            }
        }

        protected void btnUpdateProduct_Click(object sender, EventArgs e)
        {
            // Get values from the TextBoxes
            string productId = txtProductID.Text;
            decimal price;
            string category = txtCategory.Text;
            string size = txtSize.Text;

            // Validate input
            if (string.IsNullOrEmpty(productId) || string.IsNullOrEmpty(category) || string.IsNullOrEmpty(size) ||
                !decimal.TryParse(txtPrice.Text, out price))
            {
                lblMessage.Text = "Please fill in all fields with valid data.";
                lblMessage.CssClass = "text-danger";
                return;
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE Products SET Price = @Price, Category = @Category, Size = @Size WHERE ProductID = @ProductID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters
                    command.Parameters.AddWithValue("@ProductID", productId);
                    command.Parameters.AddWithValue("@Price", price);
                    command.Parameters.AddWithValue("@Category", category);
                    command.Parameters.AddWithValue("@Size", size);

                    try
                    {
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            lblMessage.Text = "Product updated successfully!";
                            lblMessage.CssClass = "text-success";
                        }
                        else
                        {
                            lblMessage.Text = "Product not found.";
                            lblMessage.CssClass = "text-warning";
                        }
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
