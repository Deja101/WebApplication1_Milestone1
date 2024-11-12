using System;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApplication1_Milestone1
{
    public partial class Product : System.Web.UI.Page
    {
        private readonly string connectionString = @"Data Source=LAPTOP-8RR0FQBP\SQLEXPRESS;Initial Catalog=Bingy2;Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is logged in and their role
            if (Session["Role"] != null && Session["Role"].ToString() == "Admin")
            {
                // Additional admin-related visibility settings can go here if needed
            }
        }
    }
}
