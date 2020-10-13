<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Admin Error</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="Header.jsp"></jsp:include>

</head>

<body>
	<div class="container">
		<div class="alert alert-danger" role="alert">
			<h4 class="alert-heading">Warning!</h4>
			<p>You dont have the authorization to login as admin.</p>
			<hr>
		</div>
	</div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>

</html>