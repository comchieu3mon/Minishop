package com.minhduc.entity;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "billdetail")
public class BillDetail {

	@EmbeddedId 
	BillDetailId chiTietHoaDonId;
	int quantity;
	String price;
	
	public BillDetail() {
		
	}

	public BillDetail(BillDetailId chiTietHoaDonId, int quantity, String price) {
		super();
		this.chiTietHoaDonId = chiTietHoaDonId;
		this.quantity = quantity;
		this.price = price;
	}

	public BillDetailId getChiTietHoaDonId() {
		return chiTietHoaDonId;
	}

	public void setChiTietHoaDonId(BillDetailId chiTietHoaDonId) {
		this.chiTietHoaDonId = chiTietHoaDonId;
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
		return "BillDetail [chiTietHoaDonId=" + chiTietHoaDonId + ", quantity=" + quantity + ", price=" + price + "]";
	}
}
