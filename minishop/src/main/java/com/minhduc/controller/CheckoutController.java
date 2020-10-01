package com.minhduc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.minhduc.dto.Cart;
import com.minhduc.service.CategoryService;

@RequestMapping("checkout/")
@Controller
public class CheckoutController {
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping
	@SuppressWarnings("unchecked")
	public String getCheckoutPage(ModelMap modelMap, HttpSession httpSession) {
		if (httpSession.getAttribute("carts") != null) {
			List<Cart> listCart = (List<Cart>) httpSession.getAttribute("carts");
			modelMap.addAttribute("listCart", listCart);
		}
		modelMap.addAttribute("listCategory", categoryService.getAllCategory());
		return "Checkout";
	}
}
