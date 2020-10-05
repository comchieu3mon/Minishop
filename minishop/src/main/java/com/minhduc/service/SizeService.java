package com.minhduc.service;

import java.util.List;

import com.minhduc.entity.Size;

public interface SizeService {
	List<Size> getAllSize();
	
	Size getSizeBySizeName(String name);
	
	Size getSizeById(int size_id);
}
