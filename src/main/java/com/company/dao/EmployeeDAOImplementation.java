package com.company.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import com.company.pojo.Employee;
import org.springframework.jdbc.core.RowMapper;

public class EmployeeDAOImplementation implements EmployeeDAOInterface {

	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public int insertEmployeeDAO(Employee employee) {
		String sql = "insert into EmployeeTable (name,skills,dateOfBirth) values(?,?,?)";
		System.out.println("Working in DAO");
		String[] skills = employee.getSkills();
		String stringSkills = "";
		if (skills == null) {
			skills = Optional.ofNullable(skills).orElse(new String[] { "" });
			stringSkills = String.join(",", skills);
			return jdbcTemplate.update(sql, employee.getName(), stringSkills, employee.getDateOfBirth());
		} else {
			stringSkills = String.join(", ", skills);
		}
		return jdbcTemplate.update(sql, employee.getName(), stringSkills, employee.getDateOfBirth());
	}

	@Override
	public List<Employee> ReadAllEmployeeDAO() {
		return jdbcTemplate.query("select * from EmployeeTable", new RowMapper<Employee>() {
			public Employee mapRow(ResultSet rs, int row) throws SQLException {
				Employee employee = new Employee();
				employee.setId(rs.getInt("Id"));
				employee.setName(rs.getString("name"));
				String skillsString = rs.getString("skills");
				String[] skillsArray = skillsString.split(", ");
				employee.setSkills(skillsArray);
				employee.setDateOfBirth(rs.getString("dateOfBirth"));
				return employee;
			}
		});
	}

	@Override
	public Employee ReadEmployeeByIdDAO(int id) {
		String sql = "select * from EmployeeTable where id=?";
		return jdbcTemplate.queryForObject(sql, new Object[] { id },
				new BeanPropertyRowMapper<Employee>(Employee.class));
	}

	public int UpdateEmployeeDAO(Employee employee) {
		String sql = "update EmployeeTable set name=?, skills=?, dateOfBirth=? where id=?";
		String[] skills = employee.getSkills();
		String stringSkills = "";
		if (skills == null) {
			skills = Optional.ofNullable(skills).orElse(new String[] { "" });
			stringSkills = String.join(",", skills);
			return jdbcTemplate.update(sql, employee.getName(), stringSkills, employee.getDateOfBirth(),
					employee.getId());
		} else {
			stringSkills = String.join(", ", skills);
		}
		return jdbcTemplate.update(sql, employee.getName(), stringSkills, employee.getDateOfBirth(), employee.getId());
	}

	@Override
	public int DeleteEmployeeDAO(int id) {
		String sql = "delete from EmployeeTable where id=" + id + "";
		return jdbcTemplate.update(sql);
	}
}