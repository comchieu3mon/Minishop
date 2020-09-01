package com.minhduc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.minhduc.dao.StaffRepository;
import com.minhduc.entity.Staff;
import com.minhduc.service.StaffService;

@Service
public class StaffServiceImpl implements StaffService{
	
	@Autowired
	private StaffRepository staffRespotitory;

	@Override
	public Staff findStaffByUsername(String username) {
		return staffRespotitory.findStaffByUsername(username);
	}

	@Override
	public boolean checkLogin(String username, String password) {
		Staff staff = new Staff();
		try {
			staff = findStaffByUsername(username);
			
		} catch (Exception e) {
			return false;
		}
		if (password.equals(staff.getStaff_password())) {
				return true;
		}
		return false;
	}

	@Override
	public void addStaff(Staff staff) {
		staffRespotitory.addStaff(staff);
	}
}
