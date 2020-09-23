package com.minhduc.dto;

public class Cart {
	private int product_id;
	private String product_name;
	private int product_price;
	private int color_id;
	private String color_name;
	private int size_id;
	private String size_name;
	private int quantity;
	
	public Cart() {
		
	}

	public Cart(int product_id, String product_name, int product_price, int color_id, String color_name, int size_id,
			String size_name, int quantity) {
		super();
		this.product_id = product_id;
		this.product_name = product_name;
		this.product_price = product_price;
		this.color_id = color_id;
		this.color_name = color_name;
		this.size_id = size_id;
		this.size_name = size_name;
		this.quantity = quantity;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "Cart [product_id=" + product_id + ", product_name=" + product_name + ", product_price=" + product_price
				+ ", color_id=" + color_id + ", color_name=" + color_name + ", size_id=" + size_id + ", size_name="
				+ size_name + ", quantity=" + quantity + "]";
	}
}
