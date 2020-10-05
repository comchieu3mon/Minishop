package com.minhduc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.minhduc.dao.CategoryRepository;
import com.minhduc.entity.Category;
import com.minhduc.service.CategoryService;
import com.minhduc.service.ProductService;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private ProductService productService;
	
	@Override
	public List<Category> getAllCategory() {
		return categoryRepository.getAllCategory();
	}

	@Override
	public Category getCategoryByName(String name) {
		return categoryRepository.getCategoryByName(name);
	}

	@Override
	public Category getCategoryById(int category_id) {
		return categoryRepository.getCategoryById(category_id);
	}

	@Override
	public int getAllProductByCategoryName(String category_name) {
		return productService.getProductByCategoryName(category_name).size();
	}

}
