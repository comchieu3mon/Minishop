package com.minhduc.entity;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class BillDetailId implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	int bill_id;
	int product_detail_id;
	
	public BillDetailId() {
		
	}
	
	public BillDetailId(int bill_id, int product_detail_id) {
		super();
		this.bill_id = bill_id;
		this.product_detail_id = product_detail_id;
	}

	public int getBill_id() {
		return bill_id;
	}

	public void setBill_id(int bill_id) {
		this.bill_id = bill_id;
	}

	public int getProduct_detail_id() {
		return product_detail_id;
	}

	public void setProduct_detail_id(int product_detail_id) {
		this.product_detail_id = product_detail_id;
	}

	@Override
	public String toString() {
		return "BillDetailId [bill_id=" + bill_id + ", product_detail_id=" + product_detail_id + "]";
	}
	
	
}
