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
            <p class="login-heading">Login</p>
            <div class="login-status alert wow bounce login-username" role="alert">
			  <p id="login-text">Email and/or password is wrong</p>
			</div>
            <form>
                <div class="login-username">
                    <input type="text" id="username" name="username" placeholder="Username..."/>
                    <i class="fa fa-user fa-lg fa-fw user-icon" aria-hidden="true"></i>
                </div>
               <div class="login-password">
                    <input type="password" id="password" name="password" placeholder="Password..."/>
                    <i class="fa fa-lock fa-lg fa-fw lock-icon" aria-hidden="true"></i>
               </div>
            
            </form>
            <button class="login-button" id="btn-login">Login</button>                
            <div class="login-alternative">
                <p><a href="../admin/login/">Or login with Admin Account</a></p>
                <a href="" class="facebook-link">
                    <i class="fa fa-facebook" aria-hidden="true"></i>
                    Facebook
                </a>
                <a href="" class="google-link">
                    <i class="fa fa-google" aria-hidden="true"></i>
                    Google
                </a>
            </div>
            <div style="text-align: center">
            	<p>Dont have an account? <a href="../register/">Sign up now</a></p>
            </div>
        </div>
<%--         <h1>${ username }</h1>--%>
    </div>
    <jsp:include page="Footer.jsp"/>
</body>
</html>