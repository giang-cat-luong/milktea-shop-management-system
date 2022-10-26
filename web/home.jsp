<%-- 
    Document   : allproduct
    Created on : Jul 7, 2022, 11:03:18 PM
    Author     : Truong Giang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>  
        <jsp:include page="menu.jsp"/>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                        <ul class="list-group category_block">
                            <c:forEach var="category" items="${requestScope.LIST_CATEGORY}"> 
                                <li class="list-group-item text-white"><a href="#">${category.name}</a></li>
                                </c:forEach>

                        </ul>
                    </div>                    
                </div>
                <div class="col-sm-9">
                    <div class="row">
                        <c:forEach var="product" items="${requestScope.LIST_PRODUCT}">      
                            <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                                <div class="card product-item border-0 mb-4">
                                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                        <img class="img-fluid w-100" src="${product.images}" alt="">
                                    </div>
                                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                        <h6 class="text-truncate mb-3">${product.proName}</h6>
                                        <div class="d-flex justify-content-center">
                                            <h6>$123.00</h6><h6 class="text-muted ml-2"><del>${product.price}</del></h6>
                                        </div>
                                    </div>                                                                     
                                </div>                                     
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
    </body>
</html>
