<%-- 
    Document   : adminPage
    Created on : May 31, 2022, 11:30:31 AM
    Author     : Truong Giang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Management Page</title>    
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">      
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>         
        <jsp:include page="menu.jsp"/>
        <!--Phân quyền-->
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>  
        <!--Menu product management-->
        <form action="MainController" class="adjform">
            Search product<input type="text" name="searchpro" value="${param.searchpro}"/>         
            <input type="submit" name="action" value="SearchPro"/>
        </form> 
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Product <b>Management</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="addProduct.jsp"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>      						
                        </div>
                    </div>
                </div>
                <c:if test="${requestScope.LIST_PRODUCT != null}">
                    <c:if test="${not empty requestScope.LIST_PRODUCT}">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>                                   
                                    <th>No</th>
                                    <th>Product Id</th>
                                    <th>Product name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Images</th>
                                    <th>Category Id</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="product" varStatus="counter" items="${requestScope.LIST_PRODUCT}">    
                                <form action="MainController">
                                    <tr>
                                        <td>${counter.count}</td>
                                        <td>
                                            <input type="text" name="productID" value="${product.productID}" readonly=""/>
                                        </td>
                                        <td>
                                            <input type="text" name="proName" value="${product.proName}" required=""/>
                                        </td>
                                        <td>
                                            <input type="text" name="price" value="${product.price}" required=""/>
                                        </td>
                                        <td>
                                            <input type="text" name="quantity" size="50" value="${product.quantity}" required=""/>
                                        </td>
                                        <td>
                                            <input type="text" name="images" value="${product.images}" required=""/>
                                        </td>
                                        <td>
                                            <input type="text" name="categoryID" size="1" value="${product.categoryID}"required=""/>
                                        </td>
                                        <td>
                                            <input type="hidden" name="searchpro" value="${param.searchpro}"/>
                                            <input type="submit" name="action" value="UpdatePro"/>
                                        </td>
                                        <td>
                                            <c:url var="deleteLink" value="MainController">
                                                <c:param name="action" value="Delete"></c:param>
                                                <c:param name="searchpro" value="${param.searchpro}"></c:param>
                                                <c:param name="productID" value="${product.productID}"></c:param>
                                            </c:url>          
                                            <a href="${deleteLink}" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE5C9;</i></a>
                                        </td>
                                    </tr>
                                </form>
                            </c:forEach>
                            </tbody>
                        </table> 
                    </c:if>
                </c:if>
            </div>
        </div>
    </body>
</html>
