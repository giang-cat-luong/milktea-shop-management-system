<%-- 
    Document   : createUser
    Created on : Jun 16, 2022, 9:10:41 AM
    Author     : Truong Giang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Page</title>          
        <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900'
              rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/css.css">
        <!--Specify app's client ID--> 
        <meta name="google-signin-client_id" content="596399165641-0h1186gbo71cv00tl1c9388dtg71kdic.apps.googleusercontent.com">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <!--Google Platform library-->
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <!--Google Recaptcha-->
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <div class="container">
            <div class="login-box animated fadeInUp" id="signup">
                <div class="box-header">
                    <h2>Sign up</h2>
                </div>
                <form action="MainController" method="POST">
                    <label for="userID">User name</label>
                    <input type="text" name="userID" required=""/></br>           
                    ${requestScope.USER_ERROR.userID}
                    <br />
                    <label for="userID">Full Name</label>
                    <input type="text" name="fullName" required=""/></br>
                    ${requestScope.USER_ERROR.fullName}
                    <br />
                    <label for="userID">Phone</label>
                    <input type="text" name="phone" required=""/></br>
                    ${requestScope.USER_ERROR.fullName}
                    <br />
                    <label for="userID">Address</label>
                    <input type="text" name="address" required=""/></br>
                    ${requestScope.USER_ERROR.fullName}
                    <br />
                    <label for="userID">Email</label>
                    <input type="email" name="email" required=""/></br>
                    ${requestScope.USER_ERROR.fullName}
                    <br />
                    <label for="userID">Role ID</label>
                    <input type="text" name="roleID" value="US" readonly=""/></br>
                    <br />
                    <label for="userID">Password</label>
                    <input type="password" name="password" required="" /></br>
                    <br />
                    <label for="userID">Confirm</label>
                    <input type="password" name="confirm" required="" /></br>
                    ${requestScope.USER_ERROR.confirm}
                    <br />
                    <input type="submit" name="action" value="Create"/>
                    <input type="reset" value="Reset"/></br>
                </form>		
                <div class="small">
                    <p>Already have an account? <a href="login.jsp">Sign in</a></p>

                </div>
                <br/>             
                <!--Sign in google button-->             
                <div id="my-signin2" data-onsuccess="onSignIn"></div>              
            </div>		
        </div>
        ${requestScope.USER_ERROR.error}
        <jsp:include page="footer.jsp"/>
    </body>
</html>
