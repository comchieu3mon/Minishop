$(document).ready(function () {
  $(".login-status").css("display", "none");
  $(".login-status").addClass("wow bounce");

  $("#btn-login").click(function () {
    $.ajax({
      type: "GET",
      url: "http://localhost:8080/Hibernate/api/checkLogin/",
      data: {
        username: $("#username").val(),
        password: $("#password").val(),
      },
      success: function (value) {
        if ("true" === value) {
          $(".login-status").addClass("alert-success");
          $("#login-text").text("Login success");

          $(".login-status").css("display", "block");
        } else {
          $(".login-status").removeClass("alert-success");
          $(".login-status").addClass("alert-danger");
          $("#login-text").text("Login Failed");
          $(".login-status").css("display", "block");
        }
      },
    });
  });

  $(".btn-add-to-cart").click(function () {
    let size_name = $(this).parent().parent().find(".size").text().trim();
    let color_name = $(this).parent().parent().find(".color").text().trim();
    let quantity = 1;
    let size_id = $(this)
      .parent()
      .parent()
      .find(".size")
      .attr("data-size-id")
      .trim();
    let color_id = $(this)
      .parent()
      .parent()
      .find(".color")
      .attr("data-color-id")
      .trim();
    let product_price = $(".pro-price").attr("data-product-price");
    let product_id = $(".pro-d-title").attr("data-product-id").trim();
    let product_name = $(".pro-d-title").text().trim();
    let product_image_url = $(".pro-img-details")
      .attr("data-product-image-url")
      .trim();
    let product_detail_id = $(this)
      .parent()
      .parent()
      .find(".product-detail-id")
      .attr("data-product-detail-id")
      .trim();

    $.ajax({
      type: "GET",
      url: "http://localhost:8080/Hibernate/api/addToCart/",
      data: {
        product_id: product_id,
        product_name: product_name,
        product_price: product_price,
        color_id: color_id,
        color_name: color_name,
        size_id: size_id,
        size_name: size_name,
        quantity: quantity,
        product_image_url: product_image_url,
        product_detail_id: product_detail_id,
      },
    }).done(function () {
      $.ajax({
        type: "GET",
        url: "http://localhost:8080/Hibernate/api/getCartQuantity/",
        success: function (value) {
          $("#cart-icon").addClass("cart-icon");
          $(".cart-icon").html("<span>" + value + "</span>");
        },
      });
    });
  });

  $(".plus").click(function () {
    let quantity = parseInt($(this).closest("div").find("#quantity").val());
    quantity = quantity + 1;
    $(this).closest("div").find("#quantity").val(quantity).change();
  });

  $(".minus").click(function () {
    let quantity = parseInt($(this).closest("div").find("#quantity").val());
    if (quantity != 1) {
      quantity = quantity - 1;
      $(this).closest("div").find("#quantity").val(quantity).change();
    }
  });

  $(".quantity").change(function () {
    let product_price = parseInt(
      $(this)
        .parent()
        .parent()
        .parent()
        .parent()
        .find(".current-price")
        .find("#summary")
        .attr("data-product-price")
    );
    let quantity = parseInt($(this).val());
    let total = product_price * quantity;

    let product_id = $(this)
      .parent()
      .parent()
      .parent()
      .find(".product-id")
      .attr("data-product-id");
    let color_id = $(this)
      .parent()
      .parent()
      .parent()
      .find(".product-color")
      .attr("data-color-id");
    let size_id = $(this)
      .parent()
      .parent()
      .parent()
      .find(".product-size")
      .attr("data-size-id");

    $.ajax({
      type: "GET",
      url: "http://localhost:8080/Hibernate/api/updateCart/",
      data: {
        product_id: product_id,
        color_id: color_id,
        size_id: size_id,
        quantity: quantity,
      },
    });

    $(this)
      .parent()
      .parent()
      .parent()
      .parent()
      .find(".current-price")
      .find(".summary")
      .text("$" + total)
      .change(calculateTotal());
  });

  $(".remove-button").click(function () {
    let self = $(this);
    let product_id = $(this)
      .parent()
      .parent()
      .parent()
      .find(".product-id")
      .attr("data-product-id");
    let color_id = $(this)
      .parent()
      .parent()
      .parent()
      .find(".product-color")
      .attr("data-color-id");
    let size_id = $(this)
      .parent()
      .parent()
      .parent()
      .find(".product-size")
      .attr("data-size-id");

    $.ajax({
      type: "GET",
      url: "http://localhost:8080/Hibernate/api/removeItem/",
      data: {
        product_id: product_id,
        color_id: color_id,
        size_id: size_id,
      },
      success: function () {
        self.parent().parent().parent().parent().parent().remove();
        calculateTotal();
      },
    });
  });

  calculateTotal();

  function calculateTotal() {
    let total = 0;
    $(".summary").each(function () {
      total = total + parseInt($(this).text().substr(1));
    });
    $("#temporary-amount").text("$" + total);
  }

  $("#checkout-button").click(function () {
    let firstName = $("#firstName").val();
    let lastName = $("#lastName").val();
    let address = $("#address").val();
    let phone_number = $("#phone_number").val();

    $.ajax({
      type: "POST",
      url: "http://localhost:8080/Hibernate/api/checkout/",
      data: {
        firstName: firstName,
        lastName: lastName,
        address: address,
        phone_number: phone_number,
      },
      success: function () {
        $("#noti")
          .css({ opacity: 1.0, visibility: "visible" })
          .animate({ opacity: 0 }, 2000);
      },
    });
  });
});
