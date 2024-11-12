<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="WebApplication1_Milestone1.Cart" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background-color: #d9f9d9; /* Light green background */
            font-family: 'Poppins', sans-serif; 
            color: #333;
            line-height: 1.6; 
        }
        .product-page {
            padding: 20px;
        }
        .product-item {
            margin-bottom: 20px;
        }
        .card-body {
            text-align: left; 
        }
        .card-title {
            margin-bottom: 15px;
            width: 312px;
        }
        .card-text {
            margin-top: 15px;
        }
        .card-body ul {
            margin-top: 15px;
        }
        .cart-page {
            padding: 20px;
            background-color: #f9f9f9;
            font-family: 'Poppins', sans-serif;
        }
        .cart-header, .cart-item {
            display: flex;
            justify-content: space-between;
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }
        .cart-header {
            font-weight: bold;
            font-size: 1.2rem;
        }
        .cart-total {
            font-weight: bold;
            font-size: 1.5rem;
            margin-top: 20px;
        }
    </style>

    <main class="container">
        <h2>Your Shopping Cart</h2>
        <table id="cartTable" class="table table-striped">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Subtotal</th>
                    <th>Action</th> 
                </tr>
            </thead>
            <tbody>
            
            </tbody>
        </table>
        <div id="totalAmount"></div>
    <asp:Button ID="LogoutButton" runat="server" Text="Logout" OnClick="LogoutButton_Click" />


        <!-- Checkout Button -->
        <asp:Button ID="CheckoutButton" runat="server" Text="Checkout" OnClick="CheckoutButton_Click" />

    </main>

    <script>
        // Function to load cart items from session storage
        function loadCart() {
            var cart = JSON.parse(sessionStorage.getItem('cart')) || [];
            var cartTableBody = document.querySelector('#cartTable tbody');
            var totalAmount = 0;

            // Clear existing rows
            cartTableBody.innerHTML = '';

            cart.forEach(function (item) {
                var row = document.createElement('tr');
                row.innerHTML = `
            <td>${item.name}</td>
            <td>${item.quantity}</td>
            <td>$${item.price.toFixed(2)}</td>
            <td>$${item.subtotal.toFixed(2)}</td>
            <td><button onclick="removeFromCart('${item.name}')">Remove</button></td>
        `;
                cartTableBody.appendChild(row);
                totalAmount += item.subtotal;
            });

            document.getElementById('totalAmount').innerHTML = `<strong>Total: $${totalAmount.toFixed(2)}</strong>`;
        }

        // Clear client-side sessionStorage cart and reload UI
        function clearClientCart() {
            sessionStorage.removeItem('cart');
            loadCart(); // Refresh cart UI to reflect cleared state
        }

        function removeFromCart(productName) {
            var cart = JSON.parse(sessionStorage.getItem('cart')) || [];

            cart = cart.filter(function (item) {
                return item.name !== productName;
            });
            sessionStorage.setItem('cart', JSON.stringify(cart));

            loadCart();
        }

        window.onload = loadCart;

    </script>
</asp:Content>
