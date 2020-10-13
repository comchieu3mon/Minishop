package com.minhduc.dao.impl;

import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.minhduc.dao.ProductRepository;
import com.minhduc.entity.Product;
import com.minhduc.entity.ProductDetail;

@Repository
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

	@Override
	@Transactional
	public List<Product> getProductsByCategoryName(String category_name) {
		return getAllProducts().stream()
				.filter(product -> product.getCategory().getCategory_name().equals(category_name))
				.collect(Collectors.toList());
	}

	@Override
	@Transactional
	public void deleteProduct(int product_id) {
		Session session = mySessionFactory.getCurrentSession();
		session.delete(getProductById(product_id));
	}

	@Override
	@Transactional
	public void add(Product product) {
		Session session = mySessionFactory.getCurrentSession();
		session.save(product);
	}

	@Override
	@Transactional
	public List<Product> getProductByPage(int pageId, int total) {
		CriteriaBuilder cb = mySessionFactory.getCurrentSession().getCriteriaBuilder();
		CriteriaQuery<Product> cq = cb.createQuery(Product.class);
		Root<Product> rootEntry = cq.from(Product.class);
		CriteriaQuery<Product> all = cq.select(rootEntry);

		TypedQuery<Product> allQuery = mySessionFactory.getCurrentSession().createQuery(all).setFirstResult(pageId).setMaxResults(total);
		return allQuery.getResultList();
	}

	@Override
	@Transactional
	public void update(Product product) {
		Session session = mySessionFactory.getCurrentSession();
		System.out.println(product);
		for (ProductDetail productDetail : product.getProductDetails()) {
			System.out.println(productDetail);
		}
		session.update(product);
	}
}
