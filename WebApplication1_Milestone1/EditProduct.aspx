<%@ Page Title="Edit Product" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="WebApplication1_Milestone1.EditProduct" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background-color: #d9f9d9; /* Light green background */
            font-family: 'Poppins', sans-serif;
            color: #333;
            line-height: 1.6;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding-top: 30px;
        }
        .card {
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-title {
            font-size: 1.8rem;
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .form-control {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1rem;
        }
        .btn-signup {
            width: 100%;
            padding: 10px;
            font-size: 1.2rem;
            background-color: #28a745; /* Green background */
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn-signup:hover {
            background-color: #218838; /* Darker green for hover effect */
        }
        .success-message {
            display: block;
            font-size: 1rem;
            color: #28a745;
            margin-bottom: 15px;
            text-align: center;
        }
    </style>

    <h2 class="form-title">Edit Product</h2>

    <section class="container">
        <div class="card">
            <div class="form-group">
                <label for="txtProductId">Product ID:</label>
                <asp:TextBox ID="txtProductId" runat="server" CssClass="form-control" ReadOnly="true" />
            </div>

            <div class="form-group">
                <label for="txtPrice">Price:</label>
                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" Placeholder="Enter Price" />
            </div>

            <div class="form-group">
                <label for="txtCategory">Category:</label>
                <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control" Placeholder="Enter Category" />
            </div>

            <div class="form-group">
                <label for="txtSize">Size:</label>
                <asp:TextBox ID="txtSize" runat="server" CssClass="form-control" Placeholder="Enter Size" />
            </div>

            <div class="form-group">
                <asp:Button ID="btnUpdateProduct" runat="server" Text="Update Product" CssClass="btn-signup" OnClick="btnUpdateProduct_Click" />
            </div>
        </div>
    </section>
</asp:Content>
