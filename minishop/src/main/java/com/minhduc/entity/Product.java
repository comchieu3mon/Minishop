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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int product_id;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	Category category;

	String product_name;
	String product_price;
	String product_description;
	String product_image;

	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "product_id")
	Set<ProductDetail> productDetails;

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "promotion_detail", joinColumns = {
			@JoinColumn(name = "product_id", referencedColumnName = "product_id") }, inverseJoinColumns = {
					@JoinColumn(name = "promotion_id", referencedColumnName = "promotion_id") })
	Set<Promotion> promotions;

	public Product() {

	}

	public Product(Category category, String product_name, String product_price, String product_description,
			String product_image, String danhcho) {
		super();
		this.category = category;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_description = product_description;
		this.product_image = product_image;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_price() {
		return product_price;
	}

	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}

	public String getProduct_description() {
		return product_description;
	}

	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}

	public String getProduct_image() {
		return product_image;
	}

	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}

	public Set<ProductDetail> getProductDetails() {
		return productDetails;
	}

	public void setProductDetails(Set<ProductDetail> productDetails) {
		this.productDetails = productDetails;
	}

	public Set<Promotion> getPromotions() {
		return promotions;
	}

	public void setPromotions(Set<Promotion> promotions) {
		this.promotions = promotions;
	}

	@Override
	public String toString() {
		return "Product [product_id=" + product_id + ", category=" + category + ", product_name=" + product_name
				+ ", product_price=" + product_price + ", product_description=" + product_description
				+ ", product_image=" + product_image + ", productDetails=" + productDetails + ", promotions="
				+ promotions + "]";
	}
}
