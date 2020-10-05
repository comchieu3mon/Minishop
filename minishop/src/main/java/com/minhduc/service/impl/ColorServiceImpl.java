package com.minhduc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.minhduc.dao.ColorRepository;
import com.minhduc.entity.Color;
import com.minhduc.service.ColorService;

@Service
public class ColorServiceImpl implements ColorService{

	@Autowired
	private ColorRepository colorRepository;
	
	@Override
	public List<Color> getAllColor() {
		return colorRepository.getAllColor();
	}

	@Override
	public Color getColorByColorName(String name) {
		return colorRepository.getColorByColorName(name);
	}

	@Override
	public Color getColorById(int color_id) {
		return colorRepository.getColorById(color_id);
	}

}
