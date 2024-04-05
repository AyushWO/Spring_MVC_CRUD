package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.company.dao.EmployeeDAOImplementation;
import com.company.dao.EmployeeDAOInterface;
import com.company.pojo.Employee;

public class EmployeeServiceImplementation implements EmployeeServiceInterface {

	EmployeeDAOInterface employeeDAO;

	public void setEmployeeDAO(EmployeeDAOImplementation employeeDAO) {
		this.employeeDAO = employeeDAO;
	}

	@Override
	public void insertEmployeeService(Employee employee) {
		System.out.println("Working in Service");
		employeeDAO.insertEmployeeDAO(employee);
	}

	@Override
	public List<Employee> ReadAllEmployeeService() {
		return employeeDAO.ReadAllEmployeeDAO();
	}

	@Override
	public Employee ReadEmployeeByIdService(int id) {
		return employeeDAO.ReadEmployeeByIdDAO(id);
	}

	@Override
	public void UpdateEmployeeService(Employee employee) {
		employeeDAO.UpdateEmployeeDAO(employee);
	}

	@Override
	public void DeleteEmployeeService(int id) {
		employeeDAO.DeleteEmployeeDAO(id);
	}
}