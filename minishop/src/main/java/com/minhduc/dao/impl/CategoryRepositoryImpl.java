package com.minhduc.dao.impl;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.minhduc.dao.CategoryRepository;
import com.minhduc.entity.Category;

@Repository
public class CategoryRepositoryImpl implements CategoryRepository {

	@Autowired
	private SessionFactory mySessionFactory;

	@Override
	@Transactional
	public List<Category> getAllCategory() {
		CriteriaBuilder cb = mySessionFactory.getCurrentSession().getCriteriaBuilder();
		CriteriaQuery<Category> cq = cb.createQuery(Category.class);
		Root<Category> root = cq.from(Category.class);
		cq.select(root);
		TypedQuery<Category> query = mySessionFactory.getCurrentSession().createQuery(cq);
		return query.getResultList();
	}

	@Override
	@Transactional
	public Category getCategoryByName(String name) {
		CriteriaBuilder cb = mySessionFactory.getCurrentSession().getCriteriaBuilder();
		CriteriaQuery<Category> cq = cb.createQuery(Category.class);
		Root<Category> root = cq.from(Category.class);
		cq.select(root);
		cq.where(cb.equal(root.get("category_name"), name));
		TypedQuery<Category> query = mySessionFactory.getCurrentSession().createQuery(cq);
		return (Category) query.getSingleResult();
	}

	@Override
	@Transactional
	public Category getCategoryById(int category_id) {
		CriteriaBuilder cb = mySessionFactory.getCurrentSession().getCriteriaBuilder();
		CriteriaQuery<Category> cq = cb.createQuery(Category.class);
		Root<Category> root = cq.from(Category.class);
		cq.select(root);
		cq.where(cb.equal(root.get("category_id"), category_id));
		TypedQuery<Category> query = mySessionFactory.getCurrentSession().createQuery(cq);
		return (Category) query.getSingleResult();
	}

}
