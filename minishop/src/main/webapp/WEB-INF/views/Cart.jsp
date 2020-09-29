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
                                                    <h5>${ product.getProduct_name() }</h5>
                                                    <p class="mb-2 text-muted text-uppercase small">Color: ${
                                                        product.getColor_name() }</p>
                                                    <p class="mb-3 text-muted text-uppercase small">Size: ${
                                                        product.getSize_name() }</p>
                                                </div>
                                                <div>
                                                    <div class="def-number-input number-input safari_only mb-0 w-100">
                                                        <button class="btn border minus"><i class="fa fa-minus"
                                                                aria-hidden="true"></i></button>
                                                        <input id="quantity" class="quantity" min="0" name="quantity"
                                                            value="1" type="number">
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
                                                            product.getProduct_price() }</strong></span></p
                                                    class="mb-0">
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
    <jsp:include page="Footer.jsp"></jsp:include>
</body>

</html>