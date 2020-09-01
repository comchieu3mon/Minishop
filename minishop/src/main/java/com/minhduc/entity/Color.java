package com.minhduc.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "color")
public class Color {
	
	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY )
	private int color_id;
	private String color_name;
	
	public Color() {
		
	}

	public Color(String color_name) {
		super();
		this.color_name = color_name;
	}

	public int getColor_id() {
		return color_id;
	}

	public void setColor_id(int color_id) {
		this.color_id = color_id;
	}

	public String getColor_name() {
		return color_name;
	}

	public void setColor_name(String color_name) {
		this.color_name = color_name;
	}

	@Override
	public String toString() {
		return "Color [color_id=" + color_id + ", color_name=" + color_name + "]";
	}
}
