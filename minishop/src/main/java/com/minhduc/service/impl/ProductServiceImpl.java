package com.minhduc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.minhduc.dao.ProductRepository;
import com.minhduc.entity.Category;
import com.minhduc.entity.Product;
import com.minhduc.service.ProductService;

@Service

public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductRepository productRepository;
	
	@Override
	public List<Product> getAllProducts() {
		return productRepository.getAllProducts();
	}

	@Override
	public Product getProductById(int product_id) {
		return productRepository.getProductById(product_id);
	}
}
