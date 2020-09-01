package com.minhduc.dao;

import com.minhduc.entity.Staff;

public interface StaffRepository {
	Staff findStaffByUsername(String username);
	
	void addStaff(Staff staff);
}
