<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="Header.jsp"/>
<title>Login</title>
<jsp:include page="Header.jsp"/>
</head>
<body id="login-body">
    <div class="container">
        <div class="login-form">
            <p class="login-heading">Register</p>
            <form action="" method="POST">
            	<div class="login-username">
                    <input type="text" id="email" name="email" placeholder="Email..."/>
                    <i class="fa fa-envelope fa-lg fa-fw user-icon" aria-hidden="true"></i>
                </div>
                <div class="login-username">
                    <input type="text" id="fullname" name="fullname" placeholder="Fullname..."/>
                    <i class="fa fa-file-signature fa-lg fa-fw user-icon" aria-hidden="true"></i>
                </div>
                <div class="login-username">
                    <input type="text" id="address" name="address" placeholder="Address..."/>
                    <i class="fa fa-map-marker fa-lg fa-fw user-icon" aria-hidden="true"></i>
                </div>
                <div class="login-username">
                    <input type="text" id="phonenumber" name="phonenumber" placeholder="Phonenumber..."/>
                    <i class="fa fa-phone fa-lg fa-fw user-icon" aria-hidden="true"></i>
                </div>
                <div class="login-username">
                    <input type="text" id="username" name="username" placeholder="Username..."/>
                    <i class="fa fa-user fa-lg fa-fw user-icon" aria-hidden="true"></i>
                </div>
               <div class="login-password">
                    <input type="password" id="password" name="password" placeholder="Password..."/>
                    <i class="fa fa-lock fa-lg fa-fw lock-icon" aria-hidden="true"></i>
               </div>
            	<button class="login-button" id="btn-login">Submit</button>       
            </form>
                     
            <div>
            </div>
            <div style="text-align: center; margin-top: 30px;">
            	<p>Have an account? <a href="../login/">Sign in now</a></p>
            </div>
        </div>
    </div>
    <jsp:include page="Footer.jsp"/>
</body>
</html>