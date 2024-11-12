using System;
using System.Security.Cryptography;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication1_Milestone1
{
    public partial class Log_in : System.Web.UI.Page
    {
        // Updated connection string
        private readonly string connectionString = @"Data Source=LAPTOP-8RR0FQBP\SQLEXPRESS;Initial Catalog=Bingy2;Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["loggedOut"] == "true")
            {
                // Make the logout message visible
                LogoutMessage.Visible = true;
                LogoutMessage.Text = "You have been logged out successfully.";
            }
        }

        private string HashPassword(string password)
        {
            using (var sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                var builder = new StringBuilder();
                foreach (var b in bytes)
                {
                    builder.Append(b.ToString("x2")); // Convert each byte to hex format
                }
                return builder.ToString();
            }
        }

        private bool VerifyPassword(string password, string storedHash)
        {
            string hashOfInput = HashPassword(password);
            return hashOfInput.Equals(storedHash, StringComparison.OrdinalIgnoreCase);
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            LoginUser();
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            RegisterUser();
        }

        private void LoginUser()
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlCommand sqlCmd = new SqlCommand("SELECT UserID, Password, Role FROM UserAccounts WHERE Username=@Username", sqlCon);
                sqlCmd.Parameters.AddWithValue("@Username", username);

                using (SqlDataReader reader = sqlCmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        string storedHashedPassword = reader["Password"].ToString();
                        if (VerifyPassword(password, storedHashedPassword))
                        {
                            int userId = Convert.ToInt32(reader["UserID"]);
                            string role = reader["Role"].ToString();

                            Session["UserID"] = userId;
                            Session["Role"] = role; // Store the role in session

                            Response.Redirect("product.aspx");
                        }
                        else
                        {
                            lblErrorMessage.Text = "Invalid username or password.";
                        }
                    }
                    else
                    {
                        lblErrorMessage.Text = "Invalid username or password.";
                    }
                }
            }
        }


        private bool IsPasswordStrong(string password)
        {
            // Check for minimum length, uppercase, lowercase, digit, and special character
            bool hasUpperCase = false, hasLowerCase = false, hasDigit = false, hasSpecialChar = false;

            if (password.Length >= 8)
            {
                foreach (char c in password)
                {
                    if (char.IsUpper(c)) hasUpperCase = true;
                    else if (char.IsLower(c)) hasLowerCase = true;
                    else if (char.IsDigit(c)) hasDigit = true;
                    else if (!char.IsLetterOrDigit(c)) hasSpecialChar = true;

                    // Break if all conditions are met
                    if (hasUpperCase && hasLowerCase && hasDigit && hasSpecialChar)
                        return true;
                }
            }
            return false;
        }

        private void RegisterUser()
        {
            string username = txtSignUpUsername.Text.Trim();
            string password = txtSignUpPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            // Clear any previous error message
            lblErrorMessage.Text = "";

            if (password != confirmPassword)
            {
                lblErrorMessage.Text = "Passwords do not match.";
                return;
            }

            if (!IsPasswordStrong(password))
            {
                lblErrorMessage.Text = "Password must be at least 8 characters long and contain an uppercase letter, a lowercase letter, a digit, and a special character.";
                return;
            }

            string hashedPassword = HashPassword(password);

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlCommand sqlCmd = new SqlCommand("INSERT INTO UserAccounts (Username, Password, Email, RegistrationDate) VALUES (@Username, @Password, @Email, @RegistrationDate)", sqlCon);

                sqlCmd.Parameters.AddWithValue("@Username", username);
                sqlCmd.Parameters.AddWithValue("@Password", hashedPassword);
                sqlCmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@RegistrationDate", DateTime.Now);

                int rowsAffected = sqlCmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    lblSuccessMessage.Text = "Registration successful! You can now log in.";
                }
                else
                {
                    lblErrorMessage.Text = "Registration failed. Please try again.";
                }
            }
        }


        public class User
        {
            public string Username { get; set; }
            public int UserID { get; set; }
        }
    }
}