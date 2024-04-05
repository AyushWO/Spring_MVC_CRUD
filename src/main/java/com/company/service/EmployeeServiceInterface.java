package com.company.service;

import java.util.List;

import com.company.pojo.Employee;

public interface EmployeeServiceInterface {

	public void insertEmployeeService(Employee employee);

	public List<Employee> ReadAllEmployeeService();

	public Employee ReadEmployeeByIdService(int id);

	public void UpdateEmployeeService(Employee employee);

	public void DeleteEmployeeService(int id);
}
