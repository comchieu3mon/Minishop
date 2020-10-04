package com.minhduc.dao.impl;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.minhduc.dao.BillDetailRepository;
import com.minhduc.entity.BillDetail;

@Repository
public class BillDetailRepositoryImpl implements BillDetailRepository{

	@Autowired
	private SessionFactory mySessionFactory;
	
	@Override
	@Transactional
	public void addBillDetail(BillDetail billDetail) {
		Session session = mySessionFactory.getCurrentSession();
		session.save(billDetail);
	}

}
