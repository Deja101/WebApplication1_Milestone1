<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1_Milestone1.Log_in" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Login & Sign Up</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #f5f5f5;
            font-family: 'Poppins', sans-serif;
            color: #333;
        }
        .container {
            max-width: 600px;
            margin: auto;
            padding: 40px 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-title {
            font-size: 2rem;
            color: #28a745;
            margin-bottom: 20px;
            text-align: center;
        }
        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 20px;
        }
        .success-message {
            color: green;
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .btn {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn-login {
            background-color: #007bff;
            color: white;
        }
        .btn-login:hover {
            background-color: #0056b3;
        }
        .btn-signup {
            background-color: #28a745;
            color: white;
        }
        .btn-signup:hover {
            background-color: #218838;
        }
        .toggle-link {
            display: block;
            text-align: center;
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
        }
        .toggle-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="navigation">
    <% 
        if (Session["Role"] != null) 
        {
            if (Session["Role"].ToString() == "Admin") { %>
                <a href="UpdateProduct.aspx" class="nav-link">Add New Products</a>
                <a href="EditProduct.aspx" class="nav-link">Update Existing Products</a>
            <% 
            } 
            else if (Session["Role"].ToString() == "Customer") { %>
                <a href="Cart.aspx" class="nav-link">View Shopping Cart</a>
            <% 
            }
        }
    %>
</div>

<style>
    .navigation {
        max-width: 300px;
        margin: 20px auto;
        padding: 20px;
        background-color: #f8f9fa; /* Light gray background */
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
    .nav-link {
        display: block;
        padding: 10px 0;
        margin: 5px 0;
        font-size: 1.2rem;
        color: #007bff;
        text-decoration: none;
        transition: color 0.3s ease, background-color 0.3s ease;
    }
    .nav-link:hover {
        color: #0056b3; /* Darker blue for hover */
        background-color: #e9ecef; /* Light gray background on hover */
        border-radius: 4px;
    }
</style>


  <form id="form1" runat="server">
        <div class="container">
            <div class="form-title">Login</div>
            <asp:Label ID="lblErrorMessage" runat="server" CssClass="error-message" Text=""></asp:Label>
            <asp:Label ID="lblSuccessMessage" runat="server" CssClass="success-message" Text=""></asp:Label>

            <div class="form-group">
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" Placeholder="Username"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-login" OnClick="btnLogin_Click" />
            </div>
            <a class="toggle-link" href="javascript:void(0);" onclick="toggleForms()">Don't have an account? Sign Up</a>

            <div id="signupForm" style="display:none;">
                <div class="form-title">Sign Up</div>
                <div class="form-group">
                    <asp:TextBox ID="txtSignUpUsername" runat="server" CssClass="form-control" Placeholder="Username"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtSignUpPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Password"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Confirm Password"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Email" />
                </div>

                <div class="form-group">
                    <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" CssClass="btn btn-signup" OnClick="btnSignUp_Click" />
                </div>
                <a class="toggle-link" href="javascript:void(0);" onclick="toggleForms()">Already have an account? Login</a>
            </div>
        </div>
    </form>
    <asp:Label ID="LogoutMessage" runat="server" Visible="false" ForeColor="Red"></asp:Label>

    <script>
        function toggleForms() {
            var loginForm = document.getElementById('form1').querySelector('.form-title');
            var signupForm = document.getElementById('signupForm');
            if (signupForm.style.display === 'none') {
                signupForm.style.display = 'block';
                loginForm.innerText = 'Sign Up';
            } else {
                signupForm.style.display = 'none';
                loginForm.innerText = 'Login';
            }
        }
    </script>
</body>
</html>
