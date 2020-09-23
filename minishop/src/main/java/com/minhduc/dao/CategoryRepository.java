package com.minhduc.dao;

import java.util.List;

import com.minhduc.entity.Category;

public interface CategoryRepository {

	List<Category> getAllCategory();

	Category getCategoryByName(String name);

	Category getCategoryById(int category_id);

}
