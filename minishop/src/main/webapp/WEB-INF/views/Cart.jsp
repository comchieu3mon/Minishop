<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Cart</title>
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
                            <div style="position: relative;">
                                <i class="fas fa-shopping-cart" style="padding-top: 20px; padding-left: 10px"></i>
                                <c:if test="${ cartsSize > 0 }">
                                    <p class="cart-icon">${ cartsSize }</p>
                                </c:if>
                            </div>
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
        <section>
            <div class="row">
                <div class="col-lg-8">
                    <div class="mb-3">
                        <div class="pt-4 wish-list">
                            <h5 class="mb-4">Cart (<span>${ listCart.size() }</span> items)</h5>
                            <c:forEach begin="0" end="${ listCart.size() }" var="product" items="${ listCart }">
                                <div class="row mb-4">
                                    <div class="col-md-5 col-lg-3 col-xl-3">
                                        <div class="view zoom overlay z-depth-1 rounded mb-3 mb-md-0">
                                            <img class="img-fluid w-100" src="${ product.getProduct_image_url() }"
                                                alt="Sample">
                                        </div>
                                    </div>
                                    <div class="col-md-7 col-lg-9 col-xl-9">
                                        <div>
                                            <div class="d-flex justify-content-between">
                                                <div>
                                                    <input type="hidden" class="product-id"
                                                        data-product-id="${ product.getProduct_id() }" />
                                                    <h5>${ product.getProduct_name() }</h5>
                                                    <p class="mb-2 text-muted text-uppercase small product-color"
                                                        data-color-id="${ product.getColor_id() }">Color: ${
                                                        product.getColor_name() }</p>
                                                    <p class="mb-3 text-muted text-uppercase small product-size"
                                                        data-size-id="${ product.getSize_id() }">Size: ${
                                                        product.getSize_name() }</p>
                                                </div>
                                                <div>
                                                    <div class="def-number-input number-input safari_only mb-0 w-100">
                                                        <button class="btn border minus"><i class="fa fa-minus"
                                                                aria-hidden="true"></i></button>
                                                        <input id="quantity" class="quantity" min="0" name="quantity"
                                                            value="${ product.getQuantity() }" type="number">
                                                        <button class="btn border plus"><i class="fa fa-plus"
                                                                aria-hidden="true"></i></button>
                                                    </div>
                                                    <small id="passwordHelpBlock"
                                                        class="form-text text-muted text-center">
                                                        (Note, 1 piece)
                                                    </small>
                                                </div>
                                            </div>
                                            <div
                                                class="current-price d-flex justify-content-between align-items-center">
                                                <div>
                                                    <a href="#!" type="button"
                                                        class="card-link-secondary small text-uppercase mr-3"><i
                                                            class="fas fa-trash-alt mr-1"></i> Remove item </a>

                                                </div>
                                                <p class="mb-0"><span><strong
                                                            data-product-price="${ product.getProduct_price() }"
                                                            id="summary" class="summary">$${
                                                            product.getProduct_price() * product.getQuantity()
                                                            }</strong></span></p class="mb-0">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr class="mb-4">
                            </c:forEach>

                            <p class="text-primary mb-0"><i class="fas fa-info-circle mr-1"></i> Do not delay the
                                purchase,
                                adding
                                items to your cart does not mean booking them.</p>

                        </div>
                    </div>
                </div>

                <div class="col-lg-4">

                    <div class="mb-3">
                        <div class="pt-4">

                            <h5 class="mb-3">The total amount of</h5>

                            <ul class="list-group list-group-flush">
                                <li
                                    class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                                    Temporary amount
                                    <span id="temporary-amount">$25.98</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                    Shipping
                                    <span>Gratis</span>
                                </li>
                                <li
                                    class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                    <div>
                                        <strong>The total amount of</strong>
                                        <strong>
                                            <p class="mb-0">(including VAT)</p>
                                        </strong>
                                    </div>
                                    <span><strong>$53.98</strong></span>
                                </li>
                            </ul>

                            <button type="button" class="btn btn-primary btn-block">go to checkout</button>

                        </div>
                    </div>

                    <div class="mb-3">
                        <div class="pt-4">

                            <a class="dark-grey-text d-flex justify-content-between" data-toggle="collapse"
                                href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                Add a discount code (optional)
                                <span><i class="fas fa-chevron-down pt-1"></i></span>
                            </a>

                            <div class="collapse" id="collapseExample">
                                <div class="mt-3">
                                    <div class="md-form md-outline mb-0">
                                        <input type="text" id="discount-code" class="form-control font-weight-light"
                                            placeholder="Enter discount code">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </section>
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
    <jsp:include page="Footer.jsp"></jsp:include>
</body>

</html>