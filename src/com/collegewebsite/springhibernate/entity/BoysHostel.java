package com.collegewebsite.springhibernate.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="boys_hostel")
public class BoysHostel {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="hostel_name")
	private String hostelName;
	
	@Column(name="no_of_beds")
	private int noOfBeds;
	
	@Column(name="no_of_occupied_beds")
	private int noOfOccupiedBeds;
	
	@Column(name="address")
	private String address;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getHostelName() {
		return hostelName;
	}

	public void setHostelName(String hostelName) {
		this.hostelName = hostelName;
	}

	public int getNoOfBeds() {
		return noOfBeds;
	}

	public void setNoOfBeds(int noOfBeds) {
		this.noOfBeds = noOfBeds;
	}

	public int getNoOfOccupiedBeds() {
		return noOfOccupiedBeds;
	}

	public void setNoOfOccupiedBeds(int noOfOccupiedBeds) {
		this.noOfOccupiedBeds = noOfOccupiedBeds;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
}
