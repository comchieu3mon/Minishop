package com.minhduc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.minhduc.entity.Product;
import com.minhduc.entity.Category;
import com.minhduc.service.CategoryService;
import com.minhduc.service.ProductService;

@Controller
@RequestMapping("category/")
public class CategoryController {
	
	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("{name}")
	public String getCategoryPage(@PathVariable(name = "name") String name, ModelMap modelMap) {
		List<Product> productList = productService.getProductByCategoryName(name);
		List<Category> categoryList = categoryService.getAllCategory();
		modelMap.addAttribute("listProduct", productList);
		modelMap.addAttribute("listCategory", categoryList);
		return "Category";
	}
	
}
