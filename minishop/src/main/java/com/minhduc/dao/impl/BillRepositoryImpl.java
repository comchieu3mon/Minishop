package com.minhduc.dao.impl;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.minhduc.dao.BillRepository;
import com.minhduc.entity.Bill;

@Repository
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
