package com.minhduc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.minhduc.entity.Category;
import com.minhduc.entity.Product;
import com.minhduc.service.CategoryService;
import com.minhduc.service.ColorService;
import com.minhduc.service.ProductService;
import com.minhduc.service.SizeService;

@RequestMapping("admin/")
@Controller
public class AdminController {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ColorService colorService;
	
	@Autowired
	private SizeService sizeService;
	
	@GetMapping
	public String getAdminPage(ModelMap modelMap) {
		List<Category> categoryList = categoryService.getAllCategory();
//		for (Category category : categoryList) {
//			category.setTotalProduct(categoryService.getAllProductByCategoryName(category.getCategory_name()));
//		}
		
		modelMap.addAttribute("categoryList", categoryList);
		return "Admin";
	}
	
	@GetMapping("/products/{page_id}")
	public String getAdminProductsPage(ModelMap modelMap, @PathVariable(name = "page_id") int page_id) {
		int total = 10;
		if (page_id == 1) {
			
		} else {
			page_id = (page_id - 1) * total + 1;
		}
		List<Product> products = productService.getProductByPage(page_id, total);
		modelMap.addAttribute("products", products);
		return "AdminProduct";
	}
	
	@GetMapping("/add/product/")
	public String getAdminAddProduct(ModelMap modelMap) {
		modelMap.addAttribute("colorList", colorService.getAllColor());
		modelMap.addAttribute("sizeList", sizeService.getAllSize());
		modelMap.addAttribute("categoryList", categoryService.getAllCategory());
		return "AdminAddProduct";
	}
	
	@GetMapping("/update/")
	public String getAdminUpdateProduct(ModelMap modleMap) {
		return "AdminUpdateProduct";
	}
}
