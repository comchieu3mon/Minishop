package com.minhduc.service;

import com.minhduc.entity.Staff;

public interface StaffService {
	
	Staff findStaffByUsername(String username);
	
	boolean checkLogin(String username, String password);
	
	void addStaff(Staff staff);
}
