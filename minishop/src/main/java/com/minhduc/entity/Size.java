package com.minhduc.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "size")
public class Size {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int size_id;
	private String size_name;
	
	public Size() {
		
	}
	
	public Size(String size_name) {
		super();
		this.size_name = size_name;
	}

	public int getSize_id() {
		return size_id;
	}

	public void setSize_id(int size_id) {
		this.size_id = size_id;
	}

	public String getSize_name() {
		return size_name;
	}

	public void setSize_name(String size_name) {
		this.size_name = size_name;
	}

	@Override
	public String toString() {
		return "Size [size_id=" + size_id + ", size_name=" + size_name + "]";
	}
}
