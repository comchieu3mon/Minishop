package com.minhduc.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.minhduc.dao.BillRepository;
import com.minhduc.entity.Bill;
import com.minhduc.service.BillService;

@Service
public class BillServiceImpl implements BillService{

	@Autowired
	private BillRepository billRepository;
	
	@Override
	public int addBill(Bill bill) {
		return billRepository.addBill(bill);
	}

}
