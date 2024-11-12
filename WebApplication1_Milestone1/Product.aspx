 <%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="WebApplication1_Milestone1.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background-color: #f5f5f5;
            font-family: 'Poppins', sans-serif;
            color: #333;
            margin: 0;
            padding: 0;
            line-height: 1.6;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .product-page {
            padding: 20px;
        }
        .product-title {
            color: #4a4a4a;
            font-weight: 600;
            margin-bottom: 30px;
        }
        .product-list {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .product-item {
            flex: 1 1 calc(33.333% - 20px);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
            background-color: #fff;
            transition: transform 0.3s;
        }
        .product-item:hover {
            transform: translateY(-5px);
        }
        .card {
            border: none;
        }
        .card-title {
            font-size: 1.2rem;
            color: #007bff;
            margin: 16px;
        }
        .text-center img {
            max-width: 100%;
            height: auto;
            border-bottom: 1px solid #ddd;
            padding: 16px;
        }
        .card-text {
            padding: 0 16px;
            color: #555;
            font-size: 0.95rem;
        }
        .list-unstyled {
            padding: 16px;
            font-size: 0.9rem;
            color: #777;
        }
        .quantity-box-wrapper {
            display: flex;
            align-items: center;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
        }
        .quantity-box {
            width: 50px;
            text-align: center;
            border: none;
            font-size: 14px;
            background-color: #f9f9f9;
            padding: 5px;
        }
        .quantity-btn {
            width: 35px;
            height: 35px;
            background-color: #f1f1f1;
            border: none;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .quantity-btn:hover {
            background-color: #e0e0e0;
        }
        .add-to-cart-btn {
            font-size: 14px;
            padding: 8px 16px;
            border-radius: 4px;
            background-color: #007bff;
            color: #fff;
            border: none;
            transition: background-color 0.3s;
        }
        .add-to-cart-btn:hover {
            background-color: #0056b3;
        }
        .delete-btn {
            font-size: 12px;
            padding: 4px 8px;
            background-color: #dc3545;
            color: #fff;
            border: none;
            border-radius: 4px;
        }
        .subtotal {
            font-size: 0.95rem;
            color: #333;
        }
        /* Responsive Design */
        @media (max-width: 768px) {
            .product-item {
                flex: 1 1 calc(50% - 10px);
            }
        }
        @media (max-width: 480px) {
            .product-item {
                flex: 1 1 100%;
            }
        }
    </style>

   <main aria-labelledby="title" class="product-page container" style="font-family: 'Montserrat', sans-serif;">
        <div class="row">
            <div class="col-12 text-center">
                <h2 id="title" class="product-title" style="font-size: 2.5rem; margin-top: 20px;">Our Products</h2>
            </div>
        </div>


        <section class="product-list row mt-4">
          <!-- Product 1 -->
<div class="col-md-4 product-item" id="product1" data-productid="110">
    <div class="card h-100 shadow">
        <h4 class="card-title">Bingy's Body Oil</h4>
        <div class="text-center">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/App_Start/nl26pqpj.png" CssClass="img-fluid" Height="216px" Width="203px" />
            <br />
        </div>
        <div class="text-left">
            <p>Indulge your skin with our luxurious Bingy’s Body Oil. Formulated with a unique blend of the finest essential oils,
                this product penetrates deeply to provide intense hydration and nourishment.
            </p>
        </div>
        <ul class="list-unstyled">
            <li><strong>ID #:</strong> 110</li>
            <li><strong>Price:</strong> <span id="price1">3000.00</span></li>
            <li><strong>Category:</strong> Skin Care</li>
            <li><strong>Size:</strong> 120ml</li>
            <li><strong>Availability:</strong> In stock</li>
        </ul>
        
        <!-- Quantity and Add to Cart Button -->
        <div class="d-flex justify-content-between align-items-center mt-3">
            <div class="quantity-box-wrapper">
                <button class="quantity-btn" type="button" onclick="decreaseQuantity('txtQuantity1', 'price1', 'subtotal1')">-</button>
                <input id="txtQuantity1" type="text" class="quantity-box" value="1" onchange="updateSubtotal('txtQuantity1', 'price1', 'subtotal1')" />
                <button class="quantity-btn" type="button" onclick="increaseQuantity('txtQuantity1', 'price1', 'subtotal1')">+</button>
            </div>
            <asp:Button ID="btnAddToCart1" runat="server" CssClass="btn btn-primary add-to-cart-btn" Text="Add to Cart" 
                OnClientClick="addToCart('txtQuantity1', 'subtotal1', 'Bingy\'s Body Oil', '3000.00'); return false;" />
        </div>
        
        <!-- Delete Button and Subtotal -->
        <div class="d-flex justify-content-between align-items-center mt-3">
            <button type="button" class="btn btn-danger btn-sm delete-btn" onclick="deleteProduct('110')">Delete Product</button>
            <div class="subtotal">
                <strong>Subtotal:</strong> $<span id="subtotal1">3000.00</span>
            </div>
        </div>
    </div>
</div>

            
          <!-- Product 2 -->
<div class="col-md-4 product-item" id="product2" data-productid="120">
    <div class="card h-100 shadow">
        <h4 class="card-title">Sleek Pro</h4>
        <div class="text-center">
            <asp:Image ID="Image2" runat="server" ImageUrl="~/App_Start/e1ksadam.png" CssClass="img-fluid" Height="227px" />
        </div>
        <div class="card-text">
            <p>Unleash the natural beauty of your hair with our Sleek Pro.</p>
        </div>
        <ul class="list-unstyled">
            <li><strong>ID #:</strong> 120</li>
            <li><strong>Price:</strong> <span id="price2">2500.00</span></li>
            <li><strong>Category:</strong> Hair Care</li>
            <li><strong>Size:</strong> 118.29ml</li>
            <li><strong>Availability:</strong> Limited stock</li>
        </ul>
        
        <div class="d-flex justify-content-between align-items-center mt-3">
            <div class="quantity-box-wrapper">
                <button class="quantity-btn" type="button" onclick="decreaseQuantity('txtQuantity2', 'price2', 'subtotal2')">-</button>
                <input id="txtQuantity2" type="text" class="quantity-box" value="1" onchange="updateSubtotal('txtQuantity2', 'price2', 'subtotal2')" />
                <button class="quantity-btn" type="button" onclick="increaseQuantity('txtQuantity2', 'price2', 'subtotal2')">+</button>
            </div>
            <asp:Button ID="btnAddToCart2" runat="server" CssClass="btn btn-primary add-to-cart-btn" Text="Add to Cart" 
                OnClientClick="addToCart('txtQuantity2', 'subtotal2', 'Sleek Pro', '2500.00'); return false;" />
        </div>
        
        <div class="d-flex justify-content-between align-items-center mt-3">
              
            <button type="button" class="btn btn-danger btn-sm delete-btn" onclick="deleteProduct('120')">Delete Product</button>
            <div class="subtotal">
                <strong>Subtotal:</strong> $<span id="subtotal2">2500.00</span>
            </div>
        </div>
    </div>
</div>


          <!-- Product 3 -->
<div class="col-md-4 product-item" id="product3" data-productid="130">
    <div class="card h-100 shadow">
        <h4 class="card-title">Organic Butter Milk Candle</h4>
        <div class="text-center">
            <asp:Image ID="Image3" runat="server" ImageUrl="~/App_Start/Candle.png" CssClass="img-fluid" Height="228px" />
        </div>
        <div class="card-text">
            <p>Create a serene atmosphere with our Organic Butter Milk Candle. Infused with calming lavender and soothing chamomile.</p>
        </div>
        <ul class="list-unstyled">
            <li><strong>ID #:</strong> 130</li>
            <li><strong>Price:</strong> <span id="price3">1000.00</span></li>
            <li><strong>Category:</strong> Aromatherapy and Wellness</li>
            <li><strong>Burn Time:</strong> 40 hours</li>
            <li><strong>Availability:</strong> In stock</li>
        </ul>
        
        <div class="d-flex justify-content-between align-items-center mt-3">
            <div class="quantity-box-wrapper">
                <button class="quantity-btn" type="button" onclick="decreaseQuantity('txtQuantity3', 'price3', 'subtotal3')">-</button>
                <input id="txtQuantity3" type="text" class="quantity-box" value="1" onchange="updateSubtotal('txtQuantity3', 'price3', 'subtotal3')" />
                <button class="quantity-btn" type="button" onclick="increaseQuantity('txtQuantity3', 'price3', 'subtotal3')">+</button>
            </div>
            <asp:Button ID="btnAddToCart3" runat="server" CssClass="btn btn-primary add-to-cart-btn" Text="Add to Cart" 
                OnClientClick="addToCart('txtQuantity3', 'subtotal3', 'Organic Butter Milk Candle', '1000.00'); return false;" />
        </div>
        
        <div class="d-flex justify-content-between align-items-center mt-3">
        
      <button type="button" class="btn btn-danger btn-sm delete-btn" onclick="deleteProduct('130')">Delete Product</button>
      <div class="subtotal">
          <strong>Subtotal:</strong> $<span id="subtotal3">2500.00</span>
      </div>
        </div>

    </div>
</div>

        </section>

    </main>
       <a href="UpdateProduct.aspx" class="btn btn-secondary">Update Product</a>
        <a href="AddProduct.aspx" class="btn btn-primary">Add Product</a>

    <script>
        // subtotal based on quantity and price
        function updateSubtotal(quantityId, priceId, subtotalId) {
            var quantityElement = document.getElementById(quantityId);
            var priceElement = document.getElementById(priceId);
            var subtotalElement = document.getElementById(subtotalId);

            var quantity = parseInt(quantityElement.value);
            var price = parseFloat(priceElement.innerText);

            var subtotal = (quantity * price).toFixed(2);
            subtotalElement.innerText = subtotal;
        }

        // Increase quantity
        function increaseQuantity(quantityId, priceId, subtotalId) {
            var quantityBox = document.getElementById(quantityId);
            var currentValue = parseInt(quantityBox.value);
            if (!isNaN(currentValue)) {
                quantityBox.value = currentValue + 1;
                updateSubtotal(quantityId, priceId, subtotalId);
            }
        }
        function editProduct(productId) {
            // Redirect to an edit page with productId as a query string parameter
            window.location.href = 'EditProduct.aspx?productId=' + productId;
        }


        // Decrease quantity
        function decreaseQuantity(quantityId, priceId, subtotalId) {
            var quantityBox = document.getElementById(quantityId);
            var currentValue = parseInt(quantityBox.value);
            if (!isNaN(currentValue) && currentValue > 1) {
                quantityBox.value = currentValue - 1;
                updateSubtotal(quantityId, priceId, subtotalId);
            }
        }
        function addToCart(quantityId, subtotalId, productName, productPrice) {
            var quantity = document.getElementById(quantityId).value;
            var subtotal = document.getElementById(subtotalId).innerText;
            // Save the cart to session on page navigation
            sessionStorage.setItem('cart', JSON.stringify(cart));

            // Create a cart item
            var cartItem = {
                name: productName,
                price: parseFloat(productPrice),
                quantity: parseInt(quantity),
                subtotal: parseFloat(subtotal)
            };

            // Check if there is already a cart in session storage
            var cart = JSON.parse(sessionStorage.getItem('cart')) || [];

            // Add the new item to the cart
            cart.push(cartItem);

            // Save back to session storage
            sessionStorage.setItem('cart', JSON.stringify(cart));

            alert(productName + " has been added to your cart!");
        }
        function addToCart(quantityId, subtotalId, productName, productPrice) {
            var quantity = parseInt(document.getElementById(quantityId).value);

            // Check if quantity is 0
            if (quantity === 0) {
                alert("OOOPS!! Quantity cannot be 0. Please select at least one item.");
                return;
            }

            var subtotal = document.getElementById(subtotalId).innerText;

            // Create a cart item
            var cartItem = {
                name: productName,
                price: parseFloat(productPrice),
                quantity: quantity,
                subtotal: parseFloat(subtotal)
            };

            // Check if there is already a cart in session storage
            var cart = JSON.parse(sessionStorage.getItem('cart')) || [];

            // Add the new item to the cart
            cart.push(cartItem);

            // Save back to session storage
            sessionStorage.setItem('cart', JSON.stringify(cart));

            alert(productName + " has been added to your cart!");
        }
        function deleteProduct(productId) {
            // Attempt to find the product element using the given productId
            var productElement = document.querySelector(`[data-productid="${productId}"]`);
            if (productElement) {
                productElement.style.display = 'none';
                alert("Product has been removed from the website.");
            } else {
                alert("Product not found.");
            }
        }

        function addToCart(quantityId, subtotalId, productName, productPrice) {
            var quantity = parseInt(document.getElementById(quantityId).value);
            var subtotal = document.getElementById(subtotalId).innerText;

            // Check if quantity is 0
            if (quantity <= 0) {
                alert("OOOPS!! Quantity cannot be 0. Please select at least one item.");
                return;
            }

            // Create a cart item
            var cartItem = {
                name: productName,
                price: parseFloat(productPrice),
                quantity: quantity,
                subtotal: parseFloat(subtotal)
            };

            // Check if there is already a cart in session storage
            var cart = JSON.parse(sessionStorage.getItem('cart')) || [];

            // Add the new item to the cart
            cart.push(cartItem);

            // Save back to session storage
            sessionStorage.setItem('cart', JSON.stringify(cart));

            alert(productName + " has been added to your cart!");
        }


    </script>
</asp:Content>



