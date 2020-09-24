package com.minhduc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.minhduc.entity.Product;
import com.minhduc.dto.Cart;
import com.minhduc.entity.Category;
import com.minhduc.service.ProductService;
import com.minhduc.service.CategoryService;


@Controller
@RequestMapping("/detail")
public class DetailController {
	
	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("{id}")
	@SuppressWarnings("unchecked")
	public String getDetailPage2(@PathVariable(name = "id") int product_id, ModelMap modelMap, HttpSession httpSession) {
		if (httpSession.getAttribute("carts") != null) {
			List<Cart> cartList = (List<Cart>) httpSession.getAttribute("carts");
			modelMap.addAttribute("cartsSize", cartList.size());
		}
		Product product = productService.getProductById(product_id);
		List<Category> listCategory = categoryService.getAllCategory();
		modelMap.addAttribute("listCategory", listCategory);
		modelMap.addAttribute("product", product);
		return "Detail";
	}
}
