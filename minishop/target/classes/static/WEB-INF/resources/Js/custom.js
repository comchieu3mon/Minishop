$(document).ready(function() {
	$(".login-status").css("display", "none");
	$(".login-status").addClass("wow bounce");

	$("#btn-login").click(function() {
		$.ajax({
			type: "GET",
			url: "http://localhost:8080/Hibernate/api/checkLogin/",
			data: {
				username: $("#username").val(),
				password: $("#password").val(),
			},
			success: function(value) {
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

	$(".btn-add-to-cart").click(function() {
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
			}
		}).done(function() {
			$.ajax({
				type: "GET",
				url: "http://localhost:8080/Hibernate/api/getCartQuantity/",
				success: function(value) {
					$("#cart-icon").addClass("cart-icon");
					$(".cart-icon").html("<span>" + value + "</span>");
				},
			});
		});
	});
});
