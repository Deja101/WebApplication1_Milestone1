<%@ Page Title="Error Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="WebApplication1_Milestone1.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align: center; padding: 50px;">
        <h1 style="color: darkgreen;">Oops! Something went wrong.</h1>
        <p>We're sorry, but the page you were looking for doesn't exist or an unexpected error has occurred.</p>
        <p><a href="Default.aspx" style="color: #007bff; text-decoration: none;">Return to Home Page</a></p>
    </div>
</asp:Content>
