package com.company.pojo;

import java.util.Arrays;

public class Employee {
	private int id;
	private String name;
	private String[] skills;
	private String dateOfBirth;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String[] getSkills() {
		return skills;
	}
	public void setSkills(String[] skills) {
		this.skills = skills;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	
	public Employee(int id, String name, String[] skills, String dateOfBirth) {
		super();
		this.id = id;
		this.name = name;
		this.skills = skills;
		this.dateOfBirth = dateOfBirth;
	}
	
	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "Employee [id=" + id + ", name=" + name + ", skills=" + Arrays.toString(skills) + ", dateOfBirth="
				+ dateOfBirth + "]";
	}
}
