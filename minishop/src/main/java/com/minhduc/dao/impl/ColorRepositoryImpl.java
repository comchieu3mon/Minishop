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

import com.minhduc.dao.ColorRepository;
import com.minhduc.entity.Color;

@Repository

public class ColorRepositoryImpl implements ColorRepository {
	
	@Autowired
	private SessionFactory mySessionFactory;
	
	@Override
	@Transactional
	public List<Color> getAllColor() {
		CriteriaBuilder cb = mySessionFactory.getCurrentSession().getCriteriaBuilder();
		CriteriaQuery<Color> cq = cb.createQuery(Color.class);
		Root<Color> root = cq.from(Color.class);
		cq.select(root);
		TypedQuery<Color> query = mySessionFactory.getCurrentSession().createQuery(cq);
		return query.getResultList();
	}

	@Override
	@Transactional
	public Color getColorByColorName(String name) {
		CriteriaBuilder cb = mySessionFactory.getCurrentSession().getCriteriaBuilder();
		CriteriaQuery<Color> cq = cb.createQuery(Color.class);
		Root<Color> root = cq.from(Color.class);
		cq.select(root);
		cq.where(cb.equal(root.get("color_name"), name));
		TypedQuery<Color> query = mySessionFactory.getCurrentSession().createQuery(cq);
		return (Color) query.getSingleResult();
	}

	@Override
	@Transactional
	public Color getColorById(int color_id) {
		CriteriaBuilder cb = mySessionFactory.getCurrentSession().getCriteriaBuilder();
		CriteriaQuery<Color> cq = cb.createQuery(Color.class);
		Root<Color> root = cq.from(Color.class);
		cq.select(root);
		cq.where(cb.equal(root.get("color_id"), color_id));
		TypedQuery<Color> query = mySessionFactory.getCurrentSession().createQuery(cq);
		return (Color) query.getSingleResult();
	}

}
