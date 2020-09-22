package com.minhduc.entity;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "bill_detail")
public class BillDetail {

	@EmbeddedId 
	BillDetailId bill_detail_id;
	int quantity;
	String price;
	
	public BillDetail() {
		
	}

	public BillDetail(BillDetailId bill_detail_id, int quantity, String price) {
		super();
		this.bill_detail_id = bill_detail_id;
		this.quantity = quantity;
		this.price = price;
	}

	public BillDetailId getBill_detail_id() {
		return bill_detail_id;
	}

	public void setBill_detail_id(BillDetailId bill_detail_id) {
		this.bill_detail_id = bill_detail_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "BillDetail [bill_detail_id=" + bill_detail_id + ", quantity=" + quantity + ", price=" + price + "]";
	}
}
