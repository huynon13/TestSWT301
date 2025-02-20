<%-- 
    Document   : menu
    Created on : Oct 10, 2024, 2:49:50 AM
    Author     : 2dhuy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Load an icon library -->

<div class="wel">
    <c:if test="${sessionScope.account.role ==0}">
        <a href="manage" style="color: white"><strong>Manage</strong> your shop</a>
    </c:if>
    <c:if test="${sessionScope.account.role ==1 || sessionScope.account== null}">
        <h6 href=""><strong>Welcome</strong> to our shop</h6>
    </c:if>

</div>
<!-- Top navigation -->
<div class="topnav">
    <!-- Centered link -->
    <div class="topnav-centered">
        <a href="home" 
           style="color: black; font-size: 45px; font-family: 'Lobster', cursive;"><strong>ShopScam</strong></a>
    </div>

    <!-- Left-aligned links (default) -->
    <a href="home" style="font-size: 24px">Home</a>
    <a href="shopall" style="font-size: 24px">Shop All</a>
    <a href="collection?coId=1" style="font-size: 24px">Collection</a>
    <a href="aboutus" style="font-size: 24px">About us</a>
    <a href="contactus" style="font-size: 24px">Contact us</a>

    <!-- Right-aligned links -->



    <div class="topnav-right" style="display: flex">
        <c:set var="sizeOfCart" value="${sessionScope.sizeOfCart}"/> 
        <div> <a style="font-size: 24px" href="cart.jsp"> <i class="fa fa-shopping-cart" style="font-size:24px"></i> ${sizeOfCart}</a></div>

        <c:if test="${sessionScope.account != null}">
            <div>  <a style="font-size: 24px" href ="userInfo?accId=${sessionScope.account.accId}">Hello ${sessionScope.account.name}</a></div>
            <div> <a style="font-size: 24px" href="logout">Logout</a></div>
        </c:if>
        <c:if test="${sessionScope.account == null}">
            <div> <a style="font-size: 24px" href="login.jsp">Login</a></div>
        </c:if>

        <c:if test="${sessionScope.account.role ==1 ||sessionScope.account== null}">
            <form action="search" method="get"class="example" style="float: left">
                <input type="hidden" name="index3" placeholder="Search.." style="width: 100px" value="1">    
                <input type="text" name="searchtxt" placeholder="Search.." style="width: 100px">              
                <button type="submit" ><i class="fa fa-search" style="color: rgb(0 , 0, 0); float: left"></i></button>
            </form>
        </c:if>



    </div>
</div>
