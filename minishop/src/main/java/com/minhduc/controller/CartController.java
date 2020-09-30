package com.minhduc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.minhduc.dao.CategoryRepository;
import com.minhduc.dto.Cart;

@RequestMapping("cart/")
@Controller
public class CartController {
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@GetMapping
	@SuppressWarnings("unchecked")
	public String getCartPage(HttpSession httpSession, ModelMap modelMap) {
		if (httpSession.getAttribute("carts") != null) {
			List<Cart> listCart =(List<Cart>) httpSession.getAttribute("carts");
			for (Cart cart : listCart) {
				System.out.println(cart.getProduct_id() + " " + cart.getColor_id() + " " + cart.getSize_id() + " " + cart.getQuantity());
			}
			modelMap.addAttribute("listCart", listCart);
		}
		modelMap.addAttribute("listCategory", categoryRepository.getAllCategory());
		return "Cart";
	}
}
