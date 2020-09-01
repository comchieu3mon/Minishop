package com.minhduc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.minhduc.entity.Product;
import com.minhduc.service.ProductService;

@Controller
@RequestMapping("/")
public class HomepageController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping	
	public String getHomepage(SessionStatus sessionStatus, HttpSession httpSession, ModelMap modelMap) {
//		System.out.println(staffService.findStaffByUsername("caominhduc").getStaff_address());
//		if (httpSession.getAttribute("username") != null) {
//			modelMap.addAttribute("username", httpSession.getAttribute("username"));
//		}
		httpSession.removeAttribute("username");
//		List<Product> list = productService.getAllProducts();
		return "Homepage";
	}
}
