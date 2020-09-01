package com.minhduc.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.minhduc.dao.ProductRepository;
import com.minhduc.entity.Product;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ProductRepositoryImpl implements ProductRepository {
	
	@Autowired
	private SessionFactory mySessionFactory;
	
	@Transactional
	@Override
	public List<Product> getAllProducts() {
		Session session = mySessionFactory.getCurrentSession();
		return session.createQuery("FROM Product").getResultList();
	}

	@Transactional
	@Override
	public List<Product> getProductsLimit() {
		
		return null;
	}
}
