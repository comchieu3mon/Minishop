package com.minhduc.dao;

import java.util.List;

import com.minhduc.entity.Size;

public interface SizeRepository {
	
	List<Size> getAllSize();
	
	Size getSizeBySizeName(String name);
	
	Size getSizeById(int size_id);
}
