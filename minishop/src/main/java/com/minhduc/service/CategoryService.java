package com.minhduc.service;

import java.util.List;

import com.minhduc.entity.Category;

public interface CategoryService {
	
	List<Category> getAllCategory();
	
	Category getCategoryByName(String name);
	
	Category getCategoryById(int category_id);
	
	int getAllProductByCategoryName(String category_name);

}
