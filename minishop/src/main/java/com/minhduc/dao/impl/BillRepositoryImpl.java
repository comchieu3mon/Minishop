package com.minhduc.dao.impl;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.minhduc.dao.BillRepository;
import com.minhduc.entity.Bill;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class BillRepositoryImpl implements BillRepository{

	@Autowired
	private SessionFactory mySessionFactory;
	
	@Override
	@Transactional
	public int addBill(Bill bill) {
		Session session = mySessionFactory.getCurrentSession();
		return (int) session.save(bill);
	}

}
