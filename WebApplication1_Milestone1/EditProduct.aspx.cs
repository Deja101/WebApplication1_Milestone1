using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace WebApplication1_Milestone1
{
    public partial class EditProduct : Page
    {
        // Connection string from Web.config
        string connectionString = WebConfigurationManager.ConnectionStrings["BingyConnectionString1"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Get ProductID from Query String
                string productId = Request.QueryString["ProductID"];
                if (!string.IsNullOrEmpty(productId))
                {
                    LoadProductDetails(productId);
                }
            }
        }

        private void LoadProductDetails(string productId)
        {
            // Load product details from the database
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT [ProductID], [Price], [Category], [Size] FROM [Bingy2].[dbo].[Products] WHERE [ProductID] = @ProductID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ProductID", productId);
                    conn.Open();

                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        txtProductId.Text = reader["ProductID"].ToString();
                        txtPrice.Text = reader["Price"].ToString();
                        txtCategory.Text = reader["Category"].ToString();
                        txtSize.Text = reader["Size"].ToString();
                    }
                }
            }
        }

        protected void btnUpdateProduct_Click(object sender, EventArgs e)
        {
            // Update product details in the database
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string updateQuery = "UPDATE [Bingy2].[dbo].[Products] SET [Price] = @Price, [Category] = @Category, [Size] = @Size WHERE [ProductID] = @ProductID";

                using (SqlCommand cmd = new SqlCommand(updateQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@ProductID", txtProductId.Text);
                    cmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(txtPrice.Text));
                    cmd.Parameters.AddWithValue("@Category", txtCategory.Text);
                    cmd.Parameters.AddWithValue("@Size", txtSize.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            // Optionally, redirect to another page or show a success message
            Response.Redirect("Product.aspx"); // Redirect to the product list page after updating
        }
    }
}
