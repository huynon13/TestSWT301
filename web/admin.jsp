<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css" integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">
        <link rel="stylesheet" href="css/admin.css">
        <style>
            body {
                font-family: 'Eczar', serif;
            }
            * {
                box-sizing: border-box;
            }

            /* Thanh điều hướng và các liên kết */
            .navbar_menu a {
                color: black;
                font-weight: bold;
                text-decoration: none;
                padding: 8px 16px;
            }

            .navbar_menu a:hover {
                background-color: #ddd;
                border-radius: 5px;
            }

            /* Nút "View Monthly Revenue" */
            .navbar_menu .revenue-button {
                background-color: white;
                color: black;
                font-weight: bold;
                border: 1px solid #000;
                padding: 8px 16px;
                border-radius: 5px;
                text-decoration: none;
            }

            .navbar_menu .revenue-button:hover {
                background-color: #f0f0f0;
            }

            /* Thanh tìm kiếm và Dropdown */
            .search-container {
                display: flex;
                align-items: center;
                gap: 10px;
                margin-left: 186px;
                margin-bottom: 10px;
            }

            .search-input {
                padding: 8px;
                width: 200px;
                height: 37px;
                border: 1px solid #ccc;
                border-radius: 4px;
                outline: none;
            }

            .search-button {
                padding: 8px;
                background-color: #000;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .dropdown-select {
                padding: 8px;
                background-color: #fff;
                color: #000;
                border: 1px solid #ccc;
                border-radius: 4px;
                cursor: pointer;
            }

            /* Phân trang */
            .pagination a {
                color: black;
                float: left;
                padding: 8px 16px;
                text-decoration: none;
                transition: background-color .3s;
                border-radius: 10px;
            }
            .pagination a.active {
                background-color: black;
                color: white;
                border-radius: 10px;
                font-weight: bold;
            }
            .pagination a:hover:not(.active) {
                background-color: #b0b0b0;
                border-radius: 10px;
                font-weight: bolder;
            }

            .footer {
                background-color: black;
                color: white;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>   

        <!-- Thanh điều hướng -->
        <div class="navbar_menu" id="myNavbar"> 
            <a href="addproduct">Add Product</a>
            <a href="usermanage">User</a>
            <a href="orderManager">Order</a>
            <!-- Nút View Monthly Revenue -->
            <a href="monthlyRevenue" class="revenue-button">View Revenue</a>
        </div>
        <label> ${mess} </label>

        <!-- Thanh tìm kiếm và Dropdown chọn Category -->
        <div class="search-container">
            <!-- Thanh tìm kiếm -->
            <form action="search" method="get" style="display: flex; align-items: center;">
    <input type="hidden" name="page" value="admin"> <!-- Xác định rằng đây là tìm kiếm từ admin.jsp -->
    <input type="text" name="searchtxt" placeholder="Search.." class="search-input">              
    <button type="submit" class="search-button">SEARCH</button>
</form>

           <!-- Dropdown chọn Category -->
<form action="filterByCategoryServlet" method="get">
    <select class="dropdown-select" name="categoryId" onchange="this.form.submit()">
        <option value="" selected>Select Category</option>
        <c:forEach items="${listCategories}" var="o">
            <option value="${o.caId}" ${selectedCategoryId == o.caId ? 'selected' : ''}>${o.caName}</option>
        </c:forEach>
    </select>
</form>

        </div>

        <!-- Bảng sản phẩm -->
        <table border="1" style="justify-content: center; margin: auto; width: 80%">
            <thead>
                <tr border="1">
                    <th style="text-align: center;">ID</th>
                    <th>NAME</th>
                    <th style="text-align: center;">IMAGE</th>
                    <th style="text-align: center;">PRICE</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listProduct}" var="o">
                    <tr>
                        <td style="width: 3%; font-weight: bolder; text-align: center;">${o.proId}</td>
                        <td style="width: 10%; font-weight: bolder">${o.proName}</td>
                        <td style="width: 13%; text-align: center"><img src="${o.proImg}" style="width:100px "></td>
                        <td style="width: 10%; font-weight: bolder; text-align: center; font-size: larger">${o.proPrice}</td>
                        <td style="width: 17%">
                            <div style="display: flex; justify-content: space-around; background-color: white; border-radius:10px ">
                                <div style="margin: 5px ;">
                                    <a href="getproduct?proId=${o.proId}" style="color: black; font-weight: bolder; font-family: 'Eczar', serif;">Edit</a>
                                </div>
                                <div style="margin: 5px ;">
                                    <a href="delete?proId=${o.proId}" style="color: red; font-weight: bolder; font-family: 'Eczar', serif;">Delete</a>
                                </div> 
                            </div>  
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Phân trang -->
        <div class="check" style="display: ${none1}">
            <div class="pagination" style="margin: auto; justify-content: center; margin-top: 30px;">
                <a href="manage?index=${indexNow - 1}">&laquo;</a>
                <c:forEach begin="1" end="${endPage}" var="o">
                    <a class="${indexNow == o? "active" : ""}" href="manage?index=${o}">${o}</a>
                </c:forEach>
                <a href="manage?index=${indexNow + 1}">&raquo;</a>
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
