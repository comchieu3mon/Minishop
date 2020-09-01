package com.minhduc.dao;

import java.util.List;

import com.minhduc.entity.Product;

public interface ProductRepository {
	
	List<Product> getAllProducts();
	
	List<Product> getProductsLimit();
}
