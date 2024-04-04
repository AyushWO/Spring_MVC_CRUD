package com.company.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.pojo.Employee;
import com.company.service.EmployeeServiceInterface;
import com.company.service.EmployeeServiceImplementation;

@Controller
public class EmployeeController {

	private EmployeeServiceInterface employeeService;

	public void setEmployeeService(EmployeeServiceImplementation employeeService) {
		this.employeeService = employeeService;
	}

	@RequestMapping(value = "/insertEmployeeAction", method = RequestMethod.POST)
	public String insertEmployee(@ModelAttribute("employee") Employee employee) {
		employeeService.insertEmployeeService(employee);
		return "redirect:/readAllEmployeeAction";
	}

	@RequestMapping(value = "/readAllEmployeeAction", method = RequestMethod.GET)
	public String readALLEmployee(Model model) {
		List<Employee> list = employeeService.ReadAllEmployeeService();
		model.addAttribute("list", list);
		return "ReadAllEmployee";
	}

	@RequestMapping(value = "/getEmployeeById/{id}", method = RequestMethod.GET)
	public String getEmployeeById(@PathVariable int id, Model model) {
		Employee employee = employeeService.ReadEmployeeByIdService(id);
		model.addAttribute("employee", employee);
		return "UpdatePage";
	}

	@RequestMapping(value = "/UpdateEmployeeAction/{id}", method = RequestMethod.POST)
	public String UpdateEmployee(@ModelAttribute("employee") Employee employee) {
		employeeService.UpdateEmployeeService(employee);
		return "redirect:/readAllEmployeeAction";
	}

	@RequestMapping(value = "/DeleteEmployeeAction/{id}", method = RequestMethod.GET)
	public String deleteEmployeeById(@PathVariable("id") int id) {
		employeeService.DeleteEmployeeService(id);
		return "redirect:/readAllEmployeeAction";
	}
}