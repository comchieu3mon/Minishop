package com.minhduc.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "bill")
public class Bill {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int bill_id;
	String customer_name;
	String customer_phone;
	String customer_address;
	Boolean status;
	String date_create;
	String type_of_delivery;
	String note;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name="bill_detail_id")
	Set<BillDetail> billDetails;
	
	public Bill() {
		
	}

	public Bill(String customer_name, String customer_phone, String customer_address, Boolean status,
			String date_create, String type_of_delivery, String note) {
		super();
		this.customer_name = customer_name;
		this.customer_phone = customer_phone;
		this.customer_address = customer_address;
		this.status = status;
		this.date_create = date_create;
		this.type_of_delivery = type_of_delivery;
		this.note = note;
	}
	
	public Bill(String customer_name, String customer_phone, String customer_address, Boolean status,
			String date_create, String type_of_delivery, String note, Set<BillDetail> billDetails) {
		super();
		this.customer_name = customer_name;
		this.customer_phone = customer_phone;
		this.customer_address = customer_address;
		this.status = status;
		this.date_create = date_create;
		this.type_of_delivery = type_of_delivery;
		this.note = note;
		this.billDetails = billDetails;
	}

	public int getBill_id() {
		return bill_id;
	}

	public void setBill_id(int bill_id) {
		this.bill_id = bill_id;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getCustomer_phone() {
		return customer_phone;
	}

	public void setCustomer_phone(String customer_phone) {
		this.customer_phone = customer_phone;
	}

	public String getCustomer_address() {
		return customer_address;
	}

	public void setCustomer_address(String customer_address) {
		this.customer_address = customer_address;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public String getDate_create() {
		return date_create;
	}

	public void setDate_create(String date_create) {
		this.date_create = date_create;
	}

	public String getType_of_delivery() {
		return type_of_delivery;
	}

	public void setType_of_delivery(String type_of_delivery) {
		this.type_of_delivery = type_of_delivery;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Set<BillDetail> getBillDetails() {
		return billDetails;
	}

	public void setBillDetails(Set<BillDetail> billDetails) {
		this.billDetails = billDetails;
	}

	@Override
	public String toString() {
		return "Bill [bill_id=" + bill_id + ", customer_name=" + customer_name + ", customer_phone=" + customer_phone
				+ ", customer_address=" + customer_address + ", status=" + status + ", date_create=" + date_create
				+ ", type_of_delivery=" + type_of_delivery + ", note=" + note + ", billDetails=" + billDetails + "]";
	}
}
