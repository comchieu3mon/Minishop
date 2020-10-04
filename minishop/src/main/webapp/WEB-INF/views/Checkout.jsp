<%@page import="java.util.ArrayList"%>
<%@page import="com.minhduc.dto.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Checkout</title>
    <jsp:include page="Header.jsp" />
</head>

<body>
    <header>
        <div class="header-top">
            <div class="container flex-box">
                <a class="logo-brand" href="../"> <img src='<c:url value="/resources/Images/site-logo2.png"/>'
                        width="150px" height="55px" />
                </a>
                <form class="form-inline">
                    <i class="fas fa-search" aria-hidden="true"></i> <input class="form-control form-control-sm w-100"
                        type="text" placeholder="Search" aria-label="Search">
                </form>
                <div class="login-register-container">
                    <c:choose>
                        <c:when test="${ username != null}">
                            <p>${ username }</p>
                        </c:when>
                        <c:otherwise>
                            <a href="../login/">Login</a>
                            <p>Or</p>
                            <a href="../register/">Register</a>
                            <a style="position: relative;" href="../cart/">
                                <i class="fas fa-shopping-cart"></i>
                                <c:if test="${ cartsSize > 0 }">
                                    <p class="cart-icon">${ cartsSize }</p>
                                </c:if>
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav">
                        <li class="nav-item active"><a class="nav-link" href="../">Home
                                <span class="sr-only">(current)</span>
                            </a></li>
                        <li class="nav-item drop-menu">
                            <div class="dropdown">
                                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">Category</a>
                                <div class="dropdown-menu">
                                    <c:forEach items="${ listCategory }" var="category">
                                        <a class="dropdown-item" href="../category/${ category.getCategory_name() }">${
                                            category.getCategory_name() }</a>
                                    </c:forEach>
                                </div>
                            </div>
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

    <div class="container">

        <div class="row mt-5">
            <div class="col-md-4 order-md-2 mb-4">
                <h4 class="d-flex justify-content-between align-items-center mb-3">
                    <span class="text-muted">Your cart</span>
                    <span class="badge badge-secondary badge-pill">${ cartList.size() }</span>
                </h4>
                <ul class="list-group mb-3">
                    <c:forEach items="${ listCart }" var="product">
                        <li class="list-group-item d-flex justify-content-between lh-condensed">
                            <div>
                                <h6 class="my-0">${ product.getProduct_name() }</h6>
                                <small class="text-muted">Quantity: ${ product.getQuantity() }</small>
                            </div>
                            <span class="text-muted">${ product.getQuantity() * product.getProduct_price() }</span>
                        </li>
                    </c:forEach>
                    <li class="list-group-item d-flex justify-content-between bg-light">
                        <div class="text-success">
                            <h6 class="my-0">Promo code</h6>
                            <small>EXAMPLECODE</small>
                        </div>
                        <span class="text-success">-$5</span>
                    </li>
                    <%
                    	int sum = 0;
                    	ArrayList listCart = (ArrayList) request.getAttribute("listCart");
						for (Cart cart : (List<Cart>) listCart) {
							sum += cart.getQuantity() * cart.getProduct_price();
						}
                    %>
                    <li class="list-group-item d-flex justify-content-between">
                        <span>Total (USD)</span>
                        <strong>$<%= sum %></strong>
                    </li>
                </ul>

                <form class="card p-2">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Promo code">
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-secondary">Redeem</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-8 order-md-1">
                <h4 class="mb-3">Billing address</h4>
                <form class="needs-validation" novalidate="" method="POST">
                    <div class="row">
                        <div class="col-md-6 mb-3 pl-0">
                            <label for="firstName">First name</label>
                            <input type="text" class="form-control" id="firstName" placeholder="" value="" required="">
                            <div class="invalid-feedback">
                                Valid first name is required.
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="lastName">Last name</label>
                            <input type="text" class="form-control" id="lastName" placeholder="" value="" required="">
                            <div class="invalid-feedback">
                                Valid last name is required.
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="address">Address</label>
                        <input type="text" class="form-control" id="address" placeholder="1234 Main St" required="">
                        <div class="invalid-feedback">
                            Please enter your shipping address.
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="phone-number">Phone number</label>
                        <input type="text" class="form-control" id="phone_number" placeholder="Phone number"
                            required="">
                        <div class="invalid-feedback">
                            Please enter your phone number.
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-5 mb-3 pl-0">
                            <label for="country">Country</label>
                            <select class="custom-select d-block w-100" id="country" required="">
                                <option value="">Choose...</option>
                                <option>United States</option>
                            </select>
                            <div class="invalid-feedback">
                                Please select a valid country.
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="state">State</label>
                            <select class="custom-select d-block w-100" id="state" required="">
                                <option value="">Choose...</option>
                                <option>California</option>
                            </select>
                            <div class="invalid-feedback">
                                Please provide a valid state.
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label for="zip">Zip</label>
                            <input type="text" class="form-control" id="zip" placeholder="" required="">
                            <div class="invalid-feedback">
                                Zip code required.
                            </div>
                        </div>
                    </div>
                    <hr class="mb-4">
                    <button id="checkout-button" class="btn btn-primary btn-lg btn-block" type="button">Check
                        out</button>
                </form>
            </div>
        </div>

        <footer class="my-5 pt-5 text-muted text-center text-small">

        </footer>
    </div>

    <footer class="page-footer font-small unique-color-dark">

        <div style="background-color: #6351ce;">
            <div class="container-fluid">

                <div class="row py-4 d-flex align-items-center">

                    <div class="col-md-6 col-lg-5 text-center text-md-left mb-4 mb-md-0">
                        <h6 class="mb-0 text-white" style="margin-left: 40px">Get
                            connected with us on social networks!</h6>
                    </div>

                    <div class="col-md-6 col-lg-7 text-center text-md-right">

                        <a class="fb-ic"> <i class="fab fa-facebook-f white-text mr-4">
                            </i>
                        </a> <a class="tw-ic"> <i class="fab fa-twitter white-text mr-4">
                            </i>
                        </a> <a class="gplus-ic"> <i class="fab fa-google-plus-g white-text mr-4"> </i>
                        </a> <a class="li-ic"> <i class="fab fa-linkedin-in white-text mr-4"> </i>
                        </a> <a class="ins-ic"> <i class="fab fa-instagram white-text">
                            </i>
                        </a>

                    </div>

                </div>

            </div>
        </div>

        <div class="container-fluid text-center text-md-left bg-dark text-white">

            <div class="row" style="padding-top: 12px">

                <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">

                    <h6 class="text-uppercase font-weight-bold">Company name</h6>
                    <hr class="accent-2 mb-4 mt-0 d-inline-block mx-auto hr-red" style="width: 60px;">
                    <p>Here you can use rows and columns to organize your footer
                        content. Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>

                </div>

                <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">

                    <h6 class="text-uppercase font-weight-bold">Products</h6>
                    <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto hr-red" style="width: 60px;">
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
                    <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto hr-red" style="width: 60px;">
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
                    <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto hr-red" style="width: 60px;">
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