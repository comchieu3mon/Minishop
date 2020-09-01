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
@Table(name = "productdetail")
public class ProductDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int product_detail_id;
	
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name="product_id")
	Product product_id;
	
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name="size_id")
	Size size;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="color_id")
	Color color_id;
	
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

	public int getProduct_detail_id() {
		return product_detail_id;
	}

	public void setProduct_detail_id(int product_detail_id) {
		this.product_detail_id = product_detail_id;
	}

	public Product getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Product product_id) {
		this.product_id = product_id;
	}

	public Size getSize() {
		return size;
	}

	public void setSize(Size size) {
		this.size = size;
	}

	public Color getColor_id() {
		return color_id;
	}

	public void setColor_id(Color color_id) {
		this.color_id = color_id;
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

	@Override
	public String toString() {
		return "ProductDetail [product_detail_id=" + product_detail_id + ", product_id=" + product_id + ", size=" + size
				+ ", color_id=" + color_id + ", quantity=" + quantity + ", date_import=" + date_import + "]";
	}
}