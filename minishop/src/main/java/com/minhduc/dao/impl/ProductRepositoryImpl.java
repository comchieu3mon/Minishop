package com.minhduc.dao.impl;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

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
		CriteriaBuilder cb = mySessionFactory.getCurrentSession().getCriteriaBuilder();
	    CriteriaQuery<Product> cq = cb.createQuery(Product.class);
	    Root<Product> rootEntry = cq.from(Product.class);
	    CriteriaQuery<Product> all = cq.select(rootEntry);
	 
	    TypedQuery<Product> allQuery = mySessionFactory.getCurrentSession().createQuery(all);
	    return allQuery.getResultList();
	}

	@Override
	@Transactional
	public Product getProductById(int product_id) {
		CriteriaBuilder cb = mySessionFactory.getCurrentSession().getCriteriaBuilder();
		CriteriaQuery<Product> cq = cb.createQuery(Product.class);
		Root<Product> rootEntry = cq.from(Product.class);
		cq.select(rootEntry);
		cq.where(cb.equal(rootEntry.get("product_id"), product_id));
		TypedQuery<Product> query = mySessionFactory.getCurrentSession().createQuery(cq);
		return query.getSingleResult();
	}
}
