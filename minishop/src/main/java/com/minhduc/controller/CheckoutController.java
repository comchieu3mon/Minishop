package com.minhduc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.minhduc.service.CategoryService;

@RequestMapping("checkout/")
@Controller
public class CheckoutController {
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping
	public String getCheckoutPage(ModelMap modelMap) {
		modelMap.addAttribute("listCategory", categoryService.getAllCategory());
		return "Checkout";
	}
}
