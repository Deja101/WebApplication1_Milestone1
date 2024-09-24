<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="WebApplication1_Milestone1.Product" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background-color: #d9f9d9; /* Light green background */
            font-family: 'Poppins', sans-serif; /* Clean and modern font */
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
        .text-center img {
            text-align: center; /* Center alignment for images */
        }
    </style>

    <main aria-labelledby="title" class="product-page container" style="font-family: 'Montserrat', sans-serif;">
        <div class="row">
            <div class="col-12 text-center">
                <h2 id="title" class="product-title" style="font-size: 2.5rem; margin-top: 20px;">Our Products</h2>
            </div>
        </div>

        <!-- Product List Section -->
        <section class="product-list row mt-4">
            <!-- Product 1 -->
            <div class="col-md-4 product-item">
                <div class="card h-100 shadow">
                    <div class="card-body">
                        <h4 class="card-title">Bingy's Body Oil</h4>
                        <div class="text-center">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/App_Start/nl26pqpj.png" CssClass="img-fluid" Height="216px" Width="203px" />
                            <br />
                        </div>
                        <div class="text-left">
                            <br />
                            Indulge your skin with our luxurious Bingy’s Body Oil. Formulated with a unique blend of the finest essential oils,
                            this product penetrates deeply to provide intense hydration and nourishment. Experience the transformative effects that leave your skin
                            feeling soft, smooth, and radiant. Perfect for daily use, it will quickly become your go-to skincare essential!
                        </div>
                        <ul class="list-unstyled">
                            <li><strong>ID #:</strong> 110</li>
                            <li><strong>Price:</strong> $3000.00</li>
                            <li><strong>Category:</strong> Skin Care</li>
                            <li><strong>Size:</strong> 120ml</li> 
                            <li><strong>Availability:</strong> In stock</li> 
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Product 2 -->
            <div class="col-md-4 product-item">
                <div class="card h-100 shadow">
                    <div class="card-body">
                        <h4 class="card-title">Sleek Pro</h4>
                        <div class="text-center">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/App_Start/e1ksadam.png" CssClass="img-fluid" Height="227px" />
                        </div>
                        <div class="card-text">
                            Unleash the natural beauty of your hair with our Sleek Pro. Enriched with nourishing coconut
                            extracts, this collection is designed to enhance your hair's natural shine and smoothness. Say goodbye to frizz and hello to 
                            healthy, vibrant hair. Ideal for all hair types, our products will transform your hair care routine into a luxurious experience!
                        </div>
                        <ul class="list-unstyled">
                            <li><strong>ID #:</strong> 120</li>
                            <li><strong>Price:</strong> $2500.00</li>
                            <li><strong>Category:</strong> Hair Care</li>
                            <li><strong>Size:</strong> 118.29ml</li> 
                            <li><strong>Availability:</strong> Limited stock</li> 
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Product 3 -->
            <div class="col-md-4 product-item">
                <div class="card h-100 shadow">
                    <div class="card-body">
                        <h4 class="card-title">Organic Butter Milk Candle</h4>
                        <div class="text-center">
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/App_Start/Candle.png" CssClass="img-fluid" Height="228px" />
                        </div>
                        <div class="card-text">
                            Create a serene atmosphere with our Organic Butter Milk Candle. Infused with calming lavender and 
                            soothing chamomile, this candle not only brightens your space but also promotes relaxation and tranquility. Perfect for
                            unwinding after a long day, it offers a delightful sensory experience that transforms your home into a peaceful oasis.
                        </div>
                        <ul class="list-unstyled">
                            <li><strong>ID #:</strong> 130</li>
                            <li><strong>Price:</strong> $1000.00</li>
                            <li><strong>Category:</strong> Aromatherapy and Wellness</li>
                            <li><strong>Burn Time:</strong> 40 hours</li> 
                            <li><strong>Availability:</strong> In stock</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
    </main>
</asp:Content>
