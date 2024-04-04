<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.company.pojo.Employee"%>
<%@page import="com.company.controller.EmployeeController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Read all data</title>
</head>
<body style="background-color: #87CEEB">
	<h1>Here's your data:</h1>

	<table border="5">
		<thead style="font-weight: bold;">
			<tr>
				<td>Name</td>
				<td>Skills</td>
				<td>Date of Birth</td>
				<td>Action</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${list}">
				<tr>
					<%-- <td>${emp.employeeID} </td> --%>
					<td>${list.name}</td>
					<td><c:forEach var="list1" items="${list.skills}"
							varStatus="loop">
							${list1},
						</c:forEach></td>
					<td>${list.dateOfBirth}</td>
					<td><a href="getEmployeeById/${list.id}"><button>Update</button></a>
						&nbsp <a href="DeleteEmployeeAction/${list.id}"><button>Delete</button></a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<hr>
	<hr>
	<br>
	<h1 style="display: inline-block;">Insert Employee Data:</h1>
	<h1 style="display: inline-block;">
		<a href="InsertEmployee.jsp">Insert</a>
	</h1>
</body>
</html>