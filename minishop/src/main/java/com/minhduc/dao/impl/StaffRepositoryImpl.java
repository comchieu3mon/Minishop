package com.minhduc.dao.impl;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.minhduc.dao.StaffRepository;
import com.minhduc.entity.Staff;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class StaffRepositoryImpl implements StaffRepository{

	@Autowired
	private SessionFactory mySessionFactory;
	
	@Transactional
	@Override
	public Staff findStaffByUsername(String username) {
		Session session = mySessionFactory.getCurrentSession();
		return (Staff) session.createQuery("FROM Staff WHERE staff_username='" + username +"'").getResultList().get(0);
	}

	@Override
	@Transactional
	public void addStaff(Staff staff) {
		Session session = mySessionFactory.getCurrentSession();
		session.save(staff);
	}
}
