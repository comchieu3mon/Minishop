package com.minhduc.controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("register/")
public class RegisterController {
	
	private static final String regex = "^(.+)@(.+)$";
	
	public boolean checkEmail(String email) {
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(email);
		return matcher.matches();
	}
	
	@GetMapping
	public String getRegisterPage() {
		return "Register";
	}
	
	@PostMapping
	public String handleRegister(@RequestParam String email, @RequestParam String fullname, @RequestParam String address, @RequestParam String phonenumber, @RequestParam String username, @RequestParam String password) {

		//staffService.addStaff(staff);
		return "Register";
	}
}
