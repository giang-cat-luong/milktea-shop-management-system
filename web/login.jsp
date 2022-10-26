<%-- 
    Document   : login
    Created on : May 31, 2022, 10:47:54 AM
    Author     : Truong Giang
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Login page</title>      
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
            <div class="login-box animated fadeInUp" id="login">
                <div class="box-header">
                    <h2>Log In</h2>
                </div>
                <form action="MainController" method="POST">
                    <label for="userID">Username</label>
                    <br />
                    <input type="text" name="userID">
                    <br />
                    <label for="password">Password</label>
                    <br />
                    <input type="password" name="password">
                    <br/>
                    <input type="submit" name="action" value="Login"/>
                    <input type="reset" value="Reset"/>
                </form>		
                <div class="small">
                    <p>Don’t you have an account? <a href="createUser.jsp">Sign up</a></p>

                </div>
                <br/>
                ${requestScope.ERROR}
                <!--Sign in google button-->             
                <div id="my-signin2" data-onsuccess="onSignIn"></div>  
                <!--Recaptcha-->
                <div class="g-recaptcha" data-sitekey="6Lfgcr4gAAAAACF-d6wRjCIvvYwqn8cwCLyNy9HP"></div> 
            </div>		
        </div>
        <!--Sign in google function-->
        <script>
            function onSuccess(googleUser) {
                console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
            }
            function onFailure(error) {
                console.log(error);
            }
            function renderButton() {
                gapi.signin2.render('my-signin2', {
                    'scope': 'profile email',
                    'width': 240,
                    'height': 50,
                    'longtitle': true,
                    'theme': 'dark',
                    'onsuccess': onSuccess,
                    'onfailure': onFailure
                });
            }
            function onSignIn(googleUser) {
                var profile = googleUser.getBasicProfile();
                console.log('ID: ' + profile.getId());
                console.log('Name: ' + profile.getName());
                console.log('Image URL: ' + profile.getImageUrl());
                console.log('Email: ' + profile.getEmail());
            }
        </script>
        <jsp:include page="footer.jsp"/>
        <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
    </body>
</html>