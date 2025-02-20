<%-- 
    Document   : aboutus
    Created on : Oct 27, 2024, 9:10:42 AM
    Author     : 2dhuy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>About Us</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link href="css/home.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
        <style>
            body {
                font-family: Arial, sans-serif;
                color: #333;
                background-color: #f9f9f9;
            }
            
            .container {
                max-width: 900px;
                margin: 30px auto;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }

            h2 {
                font-family: 'Lobster', cursive;
                font-size: 36px;
                color: #333;
                text-align: center;
                margin-bottom: 20px;
            }

            .content p {
                font-size: 16px;
                line-height: 1.8;
                color: #555;
                text-align: justify;
            }

            .contact-info {
                margin-top: 40px;
                padding-top: 20px;
                border-top: 1px solid #ddd;
            }

            .contact-info h2 {
                font-size: 28px;
                color: #333;
                margin-bottom: 15px;
            }

            .contact-info p {
                font-size: 16px;
                color: #777;
            }

            .contact-info ul {
                list-style: none;
                padding: 0;
            }

            .contact-info li {
                font-size: 16px;
                color: #555;
                margin-bottom: 10px;
            }

            .contact-info a {
                color: #007bff;
                text-decoration: none;
            }

            .contact-info a:hover {
                text-decoration: underline;
            }

            /* Styling for the user image */
            .user-image {
                display: block;
                max-width: 150px;
                margin: 20px auto;
                border-radius: 50%;
                border: 4px solid #007bff;
            }

            /* Footer styling */
            .footer {
                background-color: #333;
                color: #fff;
                text-align: center;
                padding: 15px 0;
                margin-top: 30px;
            }

            .footer a {
                color: #fff;
                text-decoration: none;
                margin: 0 10px;
            }

            .footer a:hover {
                color: #007bff;
            }
        </style>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>

        <div class="container">
            <div class="content text-center">
                <h2>Welcome to Our Website</h2>
                <p>We ship domestically and internationally. All orders are shipped via USPS, FedEx or DHL. Standard shipping within the U.S. for orders over $49.99 is free. For International shipping, we offer free standard shipping on orders over a certain amount. The threshold for free shipping may vary based on promotions and your location. Please reference the free shipping calculator in the shopping cart and on the top of the website for the specific shipping threshold for your country.</p>
                <p>All content contained on this website, including but not limited to logos, images, graphics, and text is the sole property of ShopScam and is protected by U.S. and international copyright law. Copy and print of pages of this website may be for personal, non-commercial use only. Use of our website, including reproduction and direct links, is strictly prohibited without prior written consent by owner.</p>
                
                <img src="./img/anh doi truong.jpg" class="user-image" alt="User Image">
            </div>
            
            <div class="contact-info">
                <h2>Contact Us</h2>
                <p>Feel free to contact us with any questions or inquiries:</p>
                <ul>                
                    <li><a href="mailto:5thangxoamail@gmail.com"><i class="fa fa-envelope"></i> Email: 5thangxoamail@gmail.com</a></li>
                    <li><i class="fa fa-phone"></i> Phone: 1900100k0</li>
                    <li><i class="fa fa-map-marker"></i> Address: FPT University, Hoa Lac, Thach That, Ha Noi</li>
                </ul>
            </div>
        </div>
        
        <div class="footer">
            <p>Thank you for your interest in our products</p>
            <p>If you want to experience the product directly, please contact with us!!!</p>
            <p>Address: FPT UNIVERSITY | Phone: 1900100k0</p>
            <p>SHOP SCAM SỐ 1 VIỆT NAM</p>
            <a href="#"><i class="fa fa-instagram"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-google"></i></a>
        </div>
        
        
    </body>
</html>
