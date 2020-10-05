package com.minhduc.dao;

import java.util.List;

import com.minhduc.entity.Color;

public interface ColorRepository {
	List<Color> getAllColor();
	
	Color getColorByColorName(String name);
	
	Color getColorById(int color_id);
}
