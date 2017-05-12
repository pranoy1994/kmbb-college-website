package com.collegewebsite.springhibernate.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="departments")
public class Departments {

	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="department")
	private String department;
	
	@Column(name="screen_pic")
	private byte[] screenPic;
	
	@Column(name="information")
	private String information;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartments(String department) {
		this.department = department;
	}

	public byte[] getScreenPic() {
		return screenPic;
	}

	public void setScreenPic(byte[] screenPic) {
		this.screenPic = screenPic;
	}

	public String getInformation() {
		return information;
	}

	public void setInformation(String information) {
		this.information = information;
	}
}
