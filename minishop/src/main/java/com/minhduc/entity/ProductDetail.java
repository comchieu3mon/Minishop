package com.minhduc.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "product_detail")
public class ProductDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int product_detail_id;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="product_id")
	Product product;
	
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name="size_id")
	Size size;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="color_id")
	Color color;
	
	int quantity;
	String date_import;
	
	public ProductDetail() {
		
	}

	public ProductDetail(int product_detail_id, int quantity, String date_import) {
		super();
		this.product_detail_id = product_detail_id;
		this.quantity = quantity;
		this.date_import = date_import;
	}

	
	public Size getSize() {
		return size;
	}

	public void setSize(Size size) {
		this.size = size;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getDate_import() {
		return date_import;
	}

	public void setDate_import(String date_import) {
		this.date_import = date_import;
	}

	public int getProduct_detail_id() {
		return product_detail_id;
	}

	public void setProduct_detail_id(int product_detail_id) {
		this.product_detail_id = product_detail_id;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Color getColor() {
		return color;
	}

	public void setColor(Color color) {
		this.color = color;
	}

	@Override
	public String toString() {
		return "ProductDetail [product_detail_id=" + product_detail_id + ", product=" + product + ", size=" + size
				+ ", color=" + color + ", quantity=" + quantity + ", date_import=" + date_import + "]";
	}
}