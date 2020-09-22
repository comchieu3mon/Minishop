<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail</title>

<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed"
	rel="stylesheet">
<link rel="stylesheet"
	href='<c:url value="/resources/Styles/custom.css"></c:url>'>
<jsp:include page="Header.jsp" />
</head>
<body>
	<header>
		<div class="header-top">
			<div class="container flex-box">
				<a class="logo-brand" href="#"> <img
					src='<c:url value="/resources/Images/site-logo2.png"/>'
					width="150px" height="55px" />
				</a>
				<form class="form-inline">
					<i class="fas fa-search" aria-hidden="true"></i> <input
						class="form-control form-control-sm w-100" type="text"
						placeholder="Search" aria-label="Search">
				</form>
				<div class="login-register-container">
					<c:choose>
						<c:when test="${ username != null}">
							<p>${ username }</p>
						</c:when>
						<c:otherwise>
							<a href="login/">Login</a>
							<p>Or</p>
							<a href="register/">Register</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container">
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav">
						<li class="nav-item active"><a class="nav-link" href="#">Home
								<span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Products</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#">Services</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#">Contact</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<div class="container-fluid">
		<div class="col-lg-8 border main-section bg-white">
			<div class="row hedding m-0 pl-3 pt-0 pb-3">Product Detail
				Design Using Bootstrap 4.0</div>
			<div class="row m-0">
				<div class="col-lg-4 left-side-product-box pb-3">
					<img src="http://nicesnippets.com/demo/pd-image1.jpg"
						class="border p-3"> <span class="sub-img"> <img
						src="http://nicesnippets.com/demo/pd-image2.jpg"
						class="border p-2"> <img
						src="http://nicesnippets.com/demo/pd-image3.jpg"
						class="border p-2"> <img
						src="http://nicesnippets.com/demo/pd-image4.jpg"
						class="border p-2">
					</span>
				</div>
				<div class="col-lg-8">
					<div class="right-side-pro-detail border p-3 m-0">
						<div class="row">
							<div class="col-lg-12">
								<span>Who What Wear</span>
								<p class="m-0 p-0">Women's Velvet Dress</p>
							</div>
							<div class="col-lg-12">
								<p class="m-0 p-0 price-pro">$30</p>
								<hr class="p-0 m-0">
							</div>
							<div class="col-lg-12 pt-2">
								<h5>Product Detail</h5>
								<span>Lorem ipsum dolor sit amet, consectetur adipisicing
									elit, sed do eiusmod tempor incididunt ut labore et dolore
									magna aliqua. Ut enim ad minim veniam, quis nostrud
									exercitation ullamco laboris.</span>
								<hr class="m-0 pt-2 mt-2">
							</div>
							<div class="col-lg-12">
								<p class="tag-section">
									<strong>Tag : </strong><a href="">Woman</a><a href="">,Man</a>
								</p>
							</div>
							<div class="col-lg-12">
								<h6>Quantity :</h6>
								<input type="number" class="form-control text-center w-100"
									value="1">
							</div>
							<div class="col-lg-12 mt-3">
								<div class="row">
									<div class="col-lg-6 pb-2">
										<a href="#" class="btn btn-danger w-100">Add To Cart</a>
									</div>
									<div class="col-lg-6">
										<a href="#" class="btn btn-success w-100">Shop Now</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-3 p-0 text-center pro-box-section">
				<div class="col-lg-3 pb-2">
					<div class="pro-box border p-0 m-0">
						<img src="http://nicesnippets.com/demo/pd-b-image1.jpg">
					</div>
				</div>
				<div class="col-lg-3 pb-2">
					<div class="pro-box border p-0 m-0">
						<img src="http://nicesnippets.com/demo/pd-b-images2.jpg">
					</div>
				</div>
				<div class="col-lg-3 pb-2">
					<div class="pro-box border p-0 m-0">
						<img src="http://nicesnippets.com/demo/pd-b-images3.jpg">
					</div>
				</div>
				<div class="col-lg-3 pb-2">
					<div class="pro-box border p-0 m-0">
						<img src="http://nicesnippets.com/demo/pd-b-images4.jpg">
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="page-footer font-small unique-color-dark">

		<div style="background-color: #6351ce;">
			<div class="container-fluid">

				<div class="row py-4 d-flex align-items-center">

					<div
						class="col-md-6 col-lg-5 text-center text-md-left mb-4 mb-md-0">
						<h6 class="mb-0 text-white" style="margin-left: 40px">Get
							connected with us on social networks!</h6>
					</div>

					<div class="col-md-6 col-lg-7 text-center text-md-right">

						<a class="fb-ic"> <i class="fab fa-facebook-f white-text mr-4">
						</i>
						</a> <a class="tw-ic"> <i class="fab fa-twitter white-text mr-4">
						</i>
						</a> <a class="gplus-ic"> <i
							class="fab fa-google-plus-g white-text mr-4"> </i>
						</a> <a class="li-ic"> <i
							class="fab fa-linkedin-in white-text mr-4"> </i>
						</a> <a class="ins-ic"> <i class="fab fa-instagram white-text">
						</i>
						</a>

					</div>

				</div>

			</div>
		</div>

		<div
			class="container-fluid text-center text-md-left bg-dark text-white">

			<div class="row" style="padding-top: 12px">

				<div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">

					<h6 class="text-uppercase font-weight-bold">Company name</h6>
					<hr class="accent-2 mb-4 mt-0 d-inline-block mx-auto hr-red"
						style="width: 60px;">
					<p>Here you can use rows and columns to organize your footer
						content. Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>

				</div>

				<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">

					<h6 class="text-uppercase font-weight-bold">Products</h6>
					<hr
						class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto hr-red"
						style="width: 60px;">
					<p>
						<a href="#!">MDBootstrap</a>
					</p>
					<p>
						<a href="#!">MDWordPress</a>
					</p>
					<p>
						<a href="#!">BrandFlow</a>
					</p>
					<p>
						<a href="#!">Bootstrap Angular</a>
					</p>

				</div>

				<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">

					<h6 class="text-uppercase font-weight-bold">Useful links</h6>
					<hr
						class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto hr-red"
						style="width: 60px;">
					<p>
						<a href="#!">Your Account</a>
					</p>
					<p>
						<a href="#!">Become an Affiliate</a>
					</p>
					<p>
						<a href="#!">Shipping Rates</a>
					</p>
					<p>
						<a href="#!">Help</a>
					</p>

				</div>

				<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">

					<h6 class="text-uppercase font-weight-bold">Contact</h6>
					<hr
						class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto hr-red"
						style="width: 60px;">
					<p>
						<i class="fas fa-home mr-3"></i> New York, NY 10012, US
					</p>
					<p>
						<i class="fas fa-envelope mr-3"></i> info@example.com
					</p>
					<p>
						<i class="fas fa-phone mr-3"></i> + 01 234 567 88
					</p>
					<p>
						<i class="fas fa-print mr-3"></i> + 01 234 567 89
					</p>
				</div>

			</div>

		</div>


	</footer>
	<jsp:include page="Footer.jsp" />
</body>
</html>