package com.collegewebsite.springhibernate.entity;


import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name="user_student")
public class UserStudent {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="registration_number")
	private String registrationNumber;
	
	@Column(name="lateral")
	private String lateral;
	
	public String getLateral() {
		return lateral;
	}

	public void setLateral(String lateral) {
		this.lateral = lateral;
	}

	@Column(name="password")
	private String password;
	
	@Lob
	@Column(name="picture")
	@Basic(fetch=FetchType.LAZY)
	private byte[] picture;
	
	@Column(name="full_name")
	private String fullName;
	
	@Column(name="dob")
	private Date dob;
	
	@Column(name="mob_contact")
	private String mobContact;
	
	@Column(name="email")
	private String email;
	
	@Column(name="admission_year")
	private int admissionYear;
	
	@Column(name="gender")
	private String gender;
	
	@Column(name="guardian_name")
	private String guardianName;
	
	
	@Column(name="total_fees")
	private int totalFees;
	
	@Column(name="fees_paid")
	private int feesPaid;
	
	

	@Column(name="branch")
	private String branch;
	
	@Column(name="hostel")
	private String hostel;
	
	@Column(name="hostel_bed_no")
	private int hostelBedNo;

	public String getHostel() {
		return hostel;
	}

	public void setHostel(String hostel) {
		this.hostel = hostel;
	}

	public int getHostelBedNo() {
		return hostelBedNo;
	}

	public void setHostelBedNo(int hostelBedNo) {
		this.hostelBedNo = hostelBedNo;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRegistrationNumber() {
		return registrationNumber;
	}

	public void setRegistrationNumber(String registrationNumber) {
		this.registrationNumber = registrationNumber;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public byte[] getPicture() {
		return picture;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getMobContact() {
		return mobContact;
	}

	public void setMobContact(String mobContact) {
		this.mobContact = mobContact;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getAdmissionYear() {
		return admissionYear;
	}

	public void setAdmissionYear(int admissionYear) {
		this.admissionYear = admissionYear;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getGuardianName() {
		return guardianName;
	}

	public void setGuardianName(String guardianName) {
		this.guardianName = guardianName;
	}

	

	public int getTotalFees() {
		return totalFees;
	}

	public void setTotalFees(int totalFees) {
		this.totalFees = totalFees;
	}

	public int getFeesPaid() {
		return feesPaid;
	}

	public void setFeesPaid(int feesPaid) {
		this.feesPaid = feesPaid;
	}

	
	
	
}
