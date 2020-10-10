$(document).ready(function () {
  $(".login-status").css("display", "none");
  $(".login-status").addClass("wow bounce");

  $("#btn-login").click(function () {
    $.ajax({
      type: "GET",
      url: "http://localhost:8080/minishop/api/checkLogin/",
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
      url: "http://localhost:8080/minishop/api/addToCart/",
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
        url: "http://localhost:8080/minishop/api/getCartQuantity/",
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
      url: "http://localhost:8080/minishop/api/updateCart/",
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
      url: "http://localhost:8080/minishop/api/removeItem/",
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
      url: "http://localhost:8080/minishop/api/checkout/",
      data: {
        firstName: firstName,
        lastName: lastName,
        address: address,
        phone_number: phone_number,
      },
      success: function () {
        $("#noti")
          .css({ opacity: 1.0, visibility: "visible" })
          .animate({ opacity: 0 }, 2500);
      },
    });
  });

  $(".delete-button").on("click", function () {
    let self = $(this);
    let product_id = $(this).closest("tr").attr("data-product-id");
    $.ajax({
      type: "GET",
      url: "http://localhost:8080/minishop/api/deleteProduct/",
      data: {
        product_id: product_id,
      },
      success: function () {
        self.closest("tr").hide(1500, function () {
          self.closest("tr").remove();
        });
      },
    });
  });

  var files = [];
  $("#exampleFormControlFile1").change(function (event) {
    files = event.target.files;
    let form = new FormData();
    form.append("file", files[0]);

    $.ajax({
      type: "POST",
      data: form,
      contentType: false,
      enctype: "multipart/form-data",
      processData: false,
      url: "http://localhost:8080/minishop/api/upload/",
    });
  });

  $("#add-detail-button").on("click", function () {
    var cloneContent = $("#product-detail-content")
      .clone()
      .removeAttr("style")
      .removeAttr("id");
    $("#container-product-detail").append(cloneContent);
  });

  $("#add-product-button").on("click", function (event) {
    event.preventDefault();
    let json = {};
    let product_image =
      "/resources/Images/" +
      $("#exampleFormControlFile1")[0].files[0]["name"];
    json["product_image"] = product_image;
    $.each($("#add-product-form").serializeArray(), function (index, element) {
      json[element.name] = element.value;
    });

    let product_detail_array = [];
    $(".product-detail-content").each(function () {
      let product_detail = {};
      let product_color = $(this).find("#color").val();
      let product_quantity = $(this).find("#quantity").val();
      let date_import = $(this).find("#date").val();
      let product_size = $(this).find("#size").val();
      if (
        product_color != "" &&
        product_size != "" &&
        date_import != "" &&
        product_quantity != ""
      ) {
        product_detail.product_color = product_color;
        product_detail.product_size = product_size;
        product_detail.product_quantity = product_quantity;
        product_detail.date_import = date_import;
        product_detail_array.push(product_detail);
        console.log(product_quantity);
        console.log(date_import);
      }
    });
    json.product_details = product_detail_array;
    let data = JSON.stringify(json);

    $.ajax({
      type: "POST",
      url: "http://localhost:8080/minishop/api/add/",
      data: {
        data: data,
      },
    });
  });
});
