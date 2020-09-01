$(document).ready(function() {
	
	$(".login-status").css('display', 'none');
	$(".login-status").addClass("wow bounce");
	
	$("#btn-login").click(function() {
		$.ajax({
			type: "GET",
			url:  "http://localhost:8080/minishop/api/checkLogin/",
			data: {
				username: $("#username").val(),
				password: $("#password").val()
			},
			success: function(value) {
				if ("true" === value) {
					$(".login-status").addClass("alert-success");
					$("#login-text").text("Login success");

					$(".login-status").css('display', 'block');
				} else {
					
					$(".login-status").removeClass("alert-success");
					$(".login-status").addClass("alert-danger");
					$("#login-text").text("Login Failed");
					$(".login-status").css('display', 'block');
				}
			}
		})
	});
});