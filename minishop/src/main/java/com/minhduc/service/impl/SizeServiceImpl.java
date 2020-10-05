package com.minhduc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.minhduc.dao.SizeRepository;
import com.minhduc.entity.Size;
import com.minhduc.service.SizeService;

@Service
public class SizeServiceImpl implements SizeService{

	@Autowired
	private SizeRepository sizeRepository;
	
	@Override
	public List<Size> getAllSize() {
		return sizeRepository.getAllSize();
	}

	@Override
	public Size getSizeBySizeName(String name) {
		return sizeRepository.getSizeBySizeName(name);
	}

	@Override
	public Size getSizeById(int size_id) {
		return sizeRepository.getSizeById(size_id);
	}

}
