<%@ Page Title="Sign Up" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="WebApplication1_Milestone1.Signup" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="signup-page">
        <section class="row signup-section" aria-labelledby="signupTitle">
            <div class="col-md-8">
                <h1 id="signupTitle" class="signup-title">Sign Up for Bingy's Collection</h1>
                <p class="lead">Join us for exclusive deals and updates on our body oils!</p>
                <p>By signing up, you’ll gain access to members-only discounts, new product releases, and much more. Fill in the form below to get started:</p>
                
                <!-- Signup Form -->
                <form id="signupForm" runat="server">
                    <div class="form-group">
                        <label for="name">Full Name</label>
                        <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control" placeholder="Enter your full name"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter your email"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <asp:TextBox ID="PasswordTextBox" runat="server" CssClass="form-control" TextMode="Password" placeholder="Create a password"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password</label>
                        <asp:TextBox ID="ConfirmPasswordTextBox" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm your password"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="SignupButton" runat="server" CssClass="btn btn-primary" Text="Sign Up" />
                    </div>
                </form>
            </div>
        </section>
    </main>
</asp:Content>
