package com.company.dao;

import java.util.List;

import com.company.pojo.Employee;

public interface EmployeeDAOInterface {
	
	public int insertEmployeeDAO(Employee employee);
	
	public List<Employee> ReadAllEmployeeDAO();
	
	public Employee ReadEmployeeByIdDAO(int id);
	
	public int UpdateEmployeeDAO(Employee employee);
	
	public int DeleteEmployeeDAO(int id);
	
}