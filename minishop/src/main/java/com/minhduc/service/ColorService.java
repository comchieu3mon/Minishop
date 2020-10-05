package com.minhduc.service;

import java.util.List;

import com.minhduc.entity.Color;

public interface ColorService {
	List<Color> getAllColor();
	
	Color getColorByColorName(String name);
	
	Color getColorById(int color_id);

}
