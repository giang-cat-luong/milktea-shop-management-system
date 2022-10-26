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
        <title>Admin Page</title>    
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">   
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">   
        <link rel="stylesheet" href="css/adminpagecss.css">
    </head>
    <body>   
        <jsp:include page="menu.jsp"/>
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>                
        <form action="MainController" class="adjform">
            Search<input type="search" name="search" value="${param.search}"/>         
            <input type="submit" name="action" value="Search"/>
        </form> 
        <div class="table-responsive">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="userclass">                          
                        <h2>User <b>Management</b></h2>                                                    
                    </div>
                </div>
                <c:if test="${requestScope.LIST_USER != null}">
                    <c:if test="${not empty requestScope.LIST_USER}">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr class="firsttr">
                                    <th>No</th>
                                    <th>User Id</th>						                                       
                                    <th>Full Name</th>						                                       
                                    <th>Phone</th>
                                    <th>Address</th>
                                    <th>Email</th>
                                    <th>Role Id</th>
                                    <th>Pass word</th>                                     
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="user" varStatus="counter" items="${requestScope.LIST_USER}">                                   
                                <form action="MainController">
                                    <tr>
                                        <td>${counter.count}</td>
                                        <td>
                                            <input type="text" name="userID" value="${user.userID}" readonly=""/>
                                        </td>
                                        <td>
                                            <input type="text" name="fullName" value="${user.fullName}" required=""/>
                                        </td>
                                        <td>
                                            <input type="text" name="phone" value="${user.phone}" required=""/>
                                        </td>
                                        <td>
                                            <input type="text" name="address" size="50" value="${user.address}" required=""/>
                                        </td>
                                        <td>
                                            <input type="text" name="email" value="${user.email}" required=""/>
                                        </td>
                                        <td>
                                            <input type="text" name="roleID" size="1" value="${user.roleID}"required=""/>
                                        </td>
                                        <td>${user.password}</td>
                                        <td>
                                            <input type="hidden" name="search" value="${param.search}"/>
                                            <input type="submit" name="action" value="Update"/>
                                        </td>
                                        <td>
                                            <c:url var="deleteLink" value="MainController">
                                                <c:param name="action" value="Delete"></c:param>
                                                <c:param name="search" value="${param.search}"></c:param>
                                                <c:param name="userID" value="${user.userID}"></c:param>
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
                <h1>${requestScope.ERROR_MESSAGE}</h1>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
