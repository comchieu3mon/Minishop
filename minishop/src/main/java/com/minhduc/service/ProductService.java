package com.minhduc.service;

import java.util.List;

import com.minhduc.entity.Product;

public interface ProductService {
	
	List<Product> getAllProducts();
	
	Product getProductById(int product_id);
	
	List<Product> getProductByCategoryName(String category_name);
	
	void deleteProduct(int product_id);
}
