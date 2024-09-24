<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplication1_Milestone1.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background-color: #d9f9d9; /* Light green background */
            font-family: 'Poppins', sans-serif; /* Clean and modern font */
            color: #333; /* Default text color */
            line-height: 1.6; /* Improved readability */
        }
    </style>
    
    <main aria-labelledby="title" class="about-page" style="font-family: 'Montserrat', sans-serif;">
        <div class="row">
            <div class="col-12 text-center">
                <h2 id="title" class="about-title" style="font-size: 2.5rem; margin-top: 20px;">About Us</h2>
                <p class="about-subtitle" style="font-size: 1.2rem; color: #6c757d;">Learn more about Bingy's Essentials</p>
            </div>
        </div>

        <!-- About Section with Image -->
        <section class="about-content" style="padding: 40px 20px;">
            <div class="row">
                <!-- Our Journey Description -->
                <div class="col-md-6">
                    <h3 style="font-size: 1.8rem; margin-bottom: 15px; margin-left: 160px;">Our Journey</h3>
                    <p style="font-size: 1.1rem; line-height: 1.6;">
                        Bingy’s Essentials was created by Jamaicans for Jamaicans. I chose to start this company in 2013 when my younger sister was experiencing issues with her natural hair not growing and skin breakouts. I wanted to help others who are battling with their hair and skin after inventing these products and using them on her and seeing dramatic results in only one (1) year. We saw the need for natural products and their immense contribution that they bring. Each ingredient adds a unique property that makes our products a cut above the rest.
                    </p>
                </div>
                <!-- Image Section -->
                <div class="col-md-6">
                    &nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="~/App_Start/WhatsApp Image 2024-09-19 at 16.27.22_41792c42.jpg" Height="351px" Width="303px" />
                </div>
            </div>

            <!-- Mission and Vision -->
            <div class="row mt-5">
                <!-- Mission Statement -->
                <div class="col-md-6">
                    <h3 style="font-size: 1.8rem; margin-bottom: 15px; margin-left: 240px;">Our Mission</h3>
                    <p style="font-size: 1.1rem; line-height: 1.6;">
                        To supply our customers with feel-good items that boost their self-esteem and satisfaction. We seek to provide our consumers with healthier, better, and longer-lasting goods that give them the confidence and pleasure they need to get through their day.
                    </p>
                </div>
                <!-- Vision Statement -->
                <div class="col-md-6">
                    <h3 style="font-size: 1.8rem; margin-bottom: 15px; margin-left: 240px;">Our Vision</h3>
                    <p style="font-size: 1.1rem; line-height: 1.6;">
                        Continue to expand our business so that we are not just a locally black-owned company, but also a globally recognized brand that offers nothing but the best to our customers.
                    </p>
                </div>
            </div>
        </section>
    </main>
</asp:Content>
