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

import com.minhduc.dao.SizeRepository;
import com.minhduc.entity.Size;

@Repository
public class SizeRepositoryImpl implements SizeRepository{

	@Autowired
	private SessionFactory mySessionFactory;
	
	@Override
	@Transactional
	public List<Size> getAllSize() {
		CriteriaBuilder cb = mySessionFactory.getCurrentSession().getCriteriaBuilder();
		CriteriaQuery<Size> cq = cb.createQuery(Size.class);
		Root<Size> root = cq.from(Size.class);
		cq.select(root);
		TypedQuery<Size> query = mySessionFactory.getCurrentSession().createQuery(cq);
		return query.getResultList();
	}

	@Override
	@Transactional
	public Size getSizeBySizeName(String name) {
		CriteriaBuilder cb = mySessionFactory.getCurrentSession().getCriteriaBuilder();
		CriteriaQuery<Size> cq = cb.createQuery(Size.class);
		Root<Size> root = cq.from(Size.class);
		cq.select(root);
		cq.where(cb.equal(root.get("size_name"), name));
		TypedQuery<Size> query = mySessionFactory.getCurrentSession().createQuery(cq);
		return (Size) query.getSingleResult();
	}

	@Override
	@Transactional
	public Size getSizeById(int size_id) {
		CriteriaBuilder cb = mySessionFactory.getCurrentSession().getCriteriaBuilder();
		CriteriaQuery<Size> cq = cb.createQuery(Size.class);
		Root<Size> root = cq.from(Size.class);
		cq.select(root);
		cq.where(cb.equal(root.get("size_id"), size_id));
		TypedQuery<Size> query = mySessionFactory.getCurrentSession().createQuery(cq);
		return (Size) query.getSingleResult();
	}

}
