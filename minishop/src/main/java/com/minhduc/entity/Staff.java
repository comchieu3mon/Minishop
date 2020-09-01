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
@Table(name = "staff")
public class Staff {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int staff_id;
	String staff_full_name;
	String staff_address;
	String staff_identity_number;
	Boolean staff_gender;
	
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name="role_id")
	Role role;
	
	String staff_email;
	String staff_username;
	String staff_password;
	
	public Staff() {
		
	}
	
	public Staff(String staff_full_name, String staff_address, String staff_identity_number, Boolean staff_gender,
			Role role, String staff_email, String staff_username, String staff_password) {
		super();
		this.staff_full_name = staff_full_name;
		this.staff_address = staff_address;
		this.staff_identity_number = staff_identity_number;
		this.staff_gender = staff_gender;
		this.role = role;
		this.staff_email = staff_email;
		this.staff_username = staff_username;
		this.staff_password = staff_password;
	}

	public int getStaff_id() {
		return staff_id;
	}

	public void setStaff_id(int staff_id) {
		this.staff_id = staff_id;
	}

	public String getStaff_full_name() {
		return staff_full_name;
	}

	public void setStaff_full_name(String staff_full_name) {
		this.staff_full_name = staff_full_name;
	}

	public String getStaff_address() {
		return staff_address;
	}

	public void setStaff_address(String staff_address) {
		this.staff_address = staff_address;
	}

	public String getStaff_identity_number() {
		return staff_identity_number;
	}

	public void setStaff_identity_number(String staff_identity_number) {
		this.staff_identity_number = staff_identity_number;
	}

	public Boolean getStaff_gender() {
		return staff_gender;
	}

	public void setStaff_gender(Boolean staff_gender) {
		this.staff_gender = staff_gender;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getStaff_email() {
		return staff_email;
	}

	public void setStaff_email(String staff_email) {
		this.staff_email = staff_email;
	}

	public String getStaff_username() {
		return staff_username;
	}

	public void setStaff_username(String staff_username) {
		this.staff_username = staff_username;
	}

	public String getStaff_password() {
		return staff_password;
	}

	public void setStaff_password(String staff_password) {
		this.staff_password = staff_password;
	}

	@Override
	public String toString() {
		return "Staff [staff_id=" + staff_id + ", staff_full_name=" + staff_full_name + ", staff_address="
				+ staff_address + ", staff_identity_number=" + staff_identity_number + ", staff_gender=" + staff_gender
				+ ", role=" + role + ", staff_email=" + staff_email + ", staff_username=" + staff_username
				+ ", staff_password=" + staff_password + "]";
	}
}
