<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication1_Milestone1.Contact" %> 

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background-color: #d9f9d9; /* Light green background */
            font-family: 'Poppins', sans-serif; /* font */
            color: #333;
            line-height: 1.6;
        }
    </style>
    <main aria-labelledby="title" class="contact-page">
        <div class="row">
            <div class="col-12 text-center">
                <h2 id="title" class="contact In-title"><%: Title %></h2>
                <h4 class="subtitle" style="color: #000066;">We'd love to hear from you!</h4>
            </div>
        </div>

        <!-- Address, Get in Touch, and Opening Hours in Columns -->
        <section class="contact-info">
            <div class="row">
                <!-- Address Column -->
                <div class="col-md-4 text-center">
                    <address>
                        <strong>Our Address</strong><br />
                        56 Waterloo Rd, Kingston 13<br />
                        <abbr title="Phone">Phone:</abbr> <a href="tel:+18765967660">876-596-7660</a>
                    </address>
                    <h3>Directions</h3>
                    <iframe 
                        src="https://maps.google.com/maps?q=56%20Waterloo%20Rd,%20Kingston%2013&t=&z=13&ie=UTF8&iwloc=&output=embed" 
                        style="border-style: none; border-color: inherit; border-width: 0; height: 190px; width: 300%; margin-left: 0px; margin-bottom: 0px;" 
                        allowfullscreen loading="lazy"></iframe>
                </div>

                <!-- Get in Touch Column -->
                <div class="col-md-4 text-center">
                    <h6><strong>Get in Touch:</strong></h6>
                    <p>
                        <i class="fa fa-instagram"></i> Instagram: <a href="https://www.instagram.com/yourcompany">@Bingy_Essential</a><br />
                        <i class="fa fa-twitter"></i> Twitter: <a href="https://www.twitter.com/yourcompany">@Bingy_Essential</a><br />
                        <i class="fa fa-envelope"></i> Email: <a href="mailto:support@example.com">BingyEssential@gmail.com</a>
                    </p>
                </div>

                <!-- Opening Hours Column -->
                <div class="col-md-4 text-center">
                    <h6><strong>Our Opening Hours:</strong></h6>
                    <p>
                        <strong>Mon - Fri:</strong> 8:00 AM - 6:00 PM<br />
                        <strong>Saturday:</strong> 9:00 AM - 7:30 PM<br />
                        <strong>Sunday:</strong> Closed
                    </p>
                </div>
            </div>
        </section>

      
            </div>
        </section>
    </main>
</asp:Content>
