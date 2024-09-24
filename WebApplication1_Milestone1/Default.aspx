<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1_Milestone1._Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background-color: #d9f9d9; /* Light green background */
            font-family: 'Poppins', sans-serif; /* Clean and modern font */
            color: #333; 
            line-height: 1.6; 
        }
        .featured-product, .key-benefits {
            margin-bottom: 40px;
        }
        .featured-product p.lead {
            font-family: 'Lato', sans-serif;
            font-weight: 700;
        }
        .featured-product p {
            font-family: 'Lato', sans-serif;
            margin-bottom: 20px;
        }
        .featured-product img {
            margin-bottom: 15px;
        }
    </style>

    <main class="home-page container" style="font-family: 'Montserrat', sans-serif;">
        <!-- Featured Product Section -->
        <section class="row featured-product align-items-center" aria-labelledby="bodyOilTitle">
            <div class="col-md-8">
                <p class="lead">&nbsp;</p>
                <p class="lead">&nbsp;</p>
                <p class="lead">&nbsp;</p>
                <p class="lead">Welcome to Bingy's Essentials! "The secret lies within"</p>
                <p>We're thrilled that you're here! At Bingy's, we work hard to supply you with the highest quality products available. Sign up with us to get access to exclusive coupons, new arrivals, and more. For any assistance, visit our feedback section—we're always happy to help!</p>
            </div>

            <div class="col-md-4 text-center">
                <!-- Featured Body Oil Images -->
                <asp:Image ID="Image2" runat="server" BorderStyle="Double" Height="202px" ImageUrl="~/App_Start/Bracelet.jpg" Width="205px" />
                <asp:Image ID="Image1" runat="server" BorderStyle="Double" Height="201px" ImageUrl="~/App_Start/WhatsApp Image 2024-09-21 at 16.19.58_449aa0e1.jpg" Width="209px" />
                <asp:Image ID="Image3" runat="server" BorderStyle="Double" Height="198px" ImageUrl="~/App_Start/WhatsApp Image 2024-09-21 at 16.19.58_60ec90e4.jpg" Width="210px" />
            </div>
        </section>

        <!-- Key Benefits Section -->
        <section class="row key-benefits">
            <div class="col-md-4">
            </div>
            <div class="col-md-4">
            </div>
        </section>
    </main>
</asp:Content>
