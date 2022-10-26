<%-- 
    Document   : userPage
    Created on : May 31, 2022, 11:29:57 AM
    Author     : Truong Giang
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>   
        <jsp:include page="menu.jsp"/>
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'US'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <h1>Your Information: </h1>
        ${sessionScope.LOGIN_USER.userID}
        ${sessionScope.LOGIN_USER.fullName}
        ${sessionScope.LOGIN_USER.phone}
        ${sessionScope.LOGIN_USER.address}
        ${sessionScope.LOGIN_USER.email}
        ${sessionScope.LOGIN_USER.roleID}
        ${sessionScope.LOGIN_USER.password}
        <jsp:include page="footer.jsp"/>
    </body>
</html>
