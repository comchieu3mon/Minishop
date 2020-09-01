package com.minhduc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.minhduc.dao.ProductRepository;
import com.minhduc.entity.Product;
import com.minhduc.service.ProductService;

@Service

public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductRepository productRepository;
	
	@Override
	public List<Product> getAllProducts() {
		for (Product product : productRepository.getAllProducts()) {
			System.out.println(product);
		}
		return productRepository.getAllProducts();
	}
	
}
