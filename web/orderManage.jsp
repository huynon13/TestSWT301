<%-- 
    Document   : menu
    Created on : Oct 10, 2024, 2:49:50 AM
    Author     : 2dhuy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>order manage</title>
        <link rel="stylesheet" href="css/order.css"/>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

        <style>
            * {
                box-sizing: border-box;
            }

            .row {
                margin-top: 10px;
                justify-content: center;
                text-align: center;

                margin-left:-5px;
                margin-right:-5px;
            }

            .column {
                float: left;
                width: 90%;
                padding: 5px;
            }

            /* Clearfix (clear floats) */
            .row::after {
                content: "";
                clear: both;
                display: table;
            }

            table {
                border-collapse: collapse;
                border-spacing: 0;
                width: 100%;
                border: 1px solid #ddd;
            }

            th, td {
                text-align: left;
                padding: 16px;
            }
            .row{
                display: flex;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            /* Thanh tìm kiếm */
            .search-bar {
                margin-left: 100px;
                margin-top: 70px;
                position: relative;
                display: inline-block;
                margin-bottom: 10px;
            }

            .search-input {
                padding: 8px;
                width: 160px;
                height: 41px;
                border: 1px solid #ccc;
                border-radius: 4px;
                outline: none;
            }

            .search-button {
                padding: 7px;
                background-color: #000;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            /* Thanh drop-down list */
            .dropdown {
                margin-left: 186px;
                position: relative;
                display: inline-block;
            }

            .dropdown-select {
                padding: 8px;
                background-color: #fff;
                color: #000;
                border: 1px solid #ccc;
                border-radius: 4px;
                cursor: pointer;
            }

            .dropdown-options {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
                border-radius: 4px;
                z-index: 1;
            }

            .dropdown-options option {
                color: #000;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                width: 100%;
                border: none;
                background: none;
            }

            .dropdown-options option:hover {
                background-color: #ddd;
            }

            .dropdown:hover .dropdown-options {
                display: block;
            }
        </style>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="navbar_menu" id="myNavbar"> 
                <a href="addproduct">Add Product</a>
                <a href="usermanage">User</a>
                <a href="orderManager">Order</a>
                <a href="monthlyRevenue" class="revenue-button">View Revenue</a>
            </div>
            <label> ${mess} </label>

        <h2 style="text-align: center; margin-top: 30px">History order</h2>

        <!-- Thanh tìm kiếm -->
        <div class="search-bar">
            <input type="text" class="search-input" placeholder="Search...">
            <button class="search-button">Search</button>
        </div>

        <!-- Thanh drop-down list -->
       <div class="dropdown">
    <form action="orderManager" method="get">
        <select class="dropdown-select" name="filterBy" onchange="this.form.submit()">
            <option value="" disabled selected>Search by...</option>
            <option value="orderId">Order ID</option>
            <option value="productId">Product ID</option>
            <option value="productName">Product Name</option>
            <option value="price">Price</option>
            <option value="userName">User Name</option>
            <option value="userPhone">User Phone</option>
            <option value="userAddress">User Address</option>
            <option value="quantity">Quantity</option>
        </select>
    </form>
</div>
        <div class="row">
            <div class="column">
                <table>
                    <tr>
                        <th>Order ID</th>
                        <th>Order Date</th>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Price of ProDuct</th>
                        <th>User Name</th>
                        <th>User Address</th>
                        <th>User Phone</th>
                        <th>Total Money of Order ID</th>


                    </tr>
                    <c:forEach items="${listOrder}" var="o">
                        <tr>
                            <td>${o.orId}</td>
                            <td>${o.ordate}</td>
                            <td>${o.proId}</td>
                            <td>${o.proName}</td>
                            <td>${o.quantity}</td>
                            <td>${o.proPrice} $</td>
                            <td>${o.name}</td>
                            <td>${o.address}</td>
                            <td>${o.phone}</td>
                            <td>${o.totalMoney} $</td>

                        </tr>
                    </c:forEach>
                </table>
            </div>
    </body>
</html>

