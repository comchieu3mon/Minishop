package com.minhduc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.minhduc.dao.BillDetailRepository;
import com.minhduc.entity.BillDetail;
import com.minhduc.service.BillDetailService;

@Service
public class BillDetailServiceImpl implements BillDetailService{

	@Autowired
	private BillDetailRepository billDetailRepository;
	
	@Override
	public void addBillDetail(BillDetail billDetail) {
		billDetailRepository.addBillDetail(billDetail);
	}

}
