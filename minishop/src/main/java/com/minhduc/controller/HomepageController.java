package com.minhduc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.minhduc.dto.Cart;
import com.minhduc.entity.Category;
import com.minhduc.entity.Product;
import com.minhduc.service.CategoryService;
import com.minhduc.service.ProductService;

@Controller
@RequestMapping("/")
public class HomepageController {

	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;

	@GetMapping
	@SuppressWarnings("unchecked")
	public String getHomepage(SessionStatus sessionStatus, HttpSession httpSession, ModelMap modelMap) {
		if (httpSession.getAttribute("username") != null) {
			modelMap.addAttribute("username", httpSession.getAttribute("username"));
		}
		if (httpSession.getAttribute("carts") != null) {
			List<Cart> cartList = (List<Cart>) httpSession.getAttribute("carts");
			modelMap.addAttribute("cartsSize", cartList.size());
		}
		List<Category> categoryList = categoryService.getAllCategory();
		List<Product> list = productService.getAllProducts();
		modelMap.addAttribute("listProduct", list);
		modelMap.addAttribute("listCategory", categoryList);

		return "Homepage";
	}
}
