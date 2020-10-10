package com.minhduc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.minhduc.dao.ProductRepository;
import com.minhduc.entity.Product;
import com.minhduc.service.ProductService;

@Service

public class ProductServiceImpl implements ProductService {

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

	@Override
	public List<Product> getProductByCategoryName(String category_name) {
		return productRepository.getProductsByCategoryName(category_name);
	}

	@Override
	public void deleteProduct(int product_id) {
		productRepository.deleteProduct(product_id);
	}

	@Override
	public void add(Product product) {
		productRepository.add(product);
	}

	@Override
	public List<Product> getProductByPage(int pageId, int total) {
		return productRepository.getProductByPage(pageId, total);
	}
}
