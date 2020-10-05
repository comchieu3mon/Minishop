package com.minhduc.dao;

import java.util.List;

import com.minhduc.entity.Product;

public interface ProductRepository {

	List<Product> getAllProducts();

	Product getProductById(int product_id);

	List<Product> getProductsByCategoryName(String category_name);
	
	void deleteProduct(int product_id);
}
