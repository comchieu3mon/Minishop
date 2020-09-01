package com.minhduc.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "promotion")
public class Promotion {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int promotion_id;
	String promotion_name;
	String promotion_start;
	String promotion_end;
	String promotion_description;
	int discountPrice;
	String promotion_image;
	
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name="PROMOTION_DETAIL",
	joinColumns = {@JoinColumn(name="promotion_id",referencedColumnName = "promotion_id")},
	inverseJoinColumns = {@JoinColumn(name="product_id",referencedColumnName = "product_id")})
	Set<Product> products;
	
	public Promotion() {
		
	}

	public Promotion(String promotion_name, String promotion_start, String promotion_end, String promotion_description,
			int discountPrice, String promotion_image) {
		super();
		this.promotion_name = promotion_name;
		this.promotion_start = promotion_start;
		this.promotion_end = promotion_end;
		this.promotion_description = promotion_description;
		this.discountPrice = discountPrice;
		this.promotion_image = promotion_image;
	}

	public int getPromotion_id() {
		return promotion_id;
	}

	public void setPromotion_id(int promotion_id) {
		this.promotion_id = promotion_id;
	}

	public String getPromotion_name() {
		return promotion_name;
	}

	public void setPromotion_name(String promotion_name) {
		this.promotion_name = promotion_name;
	}

	public String getPromotion_start() {
		return promotion_start;
	}

	public void setPromotion_start(String promotion_start) {
		this.promotion_start = promotion_start;
	}

	public String getPromotion_end() {
		return promotion_end;
	}

	public void setPromotion_end(String promotion_end) {
		this.promotion_end = promotion_end;
	}

	public String getPromotion_description() {
		return promotion_description;
	}

	public void setPromotion_description(String promotion_description) {
		this.promotion_description = promotion_description;
	}

	public int getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(int discountPrice) {
		this.discountPrice = discountPrice;
	}

	public String getPromotion_image() {
		return promotion_image;
	}

	public void setPromotion_image(String promotion_image) {
		this.promotion_image = promotion_image;
	}

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	@Override
	public String toString() {
		return "Promotion [promotion_id=" + promotion_id + ", promotion_name=" + promotion_name + ", promotion_start="
				+ promotion_start + ", promotion_end=" + promotion_end + ", promotion_description="
				+ promotion_description + ", discountPrice=" + discountPrice + ", promotion_image=" + promotion_image
				+ ", products=" + products + "]";
	}
}