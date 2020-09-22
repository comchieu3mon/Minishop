package com.minhduc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.minhduc.entity.Product;
import com.minhduc.service.ProductService;

@Controller
@RequestMapping("/detail")
public class DetailController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("{id}")
	public String getDetailPage2(@PathVariable(name = "id") int product_id, ModelMap modelMap) {
		Product product = productService.getProductById(product_id);
		modelMap.addAttribute("product", product);
		return "Detail";
	}
}
