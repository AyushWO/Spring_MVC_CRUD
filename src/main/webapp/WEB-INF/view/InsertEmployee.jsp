<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Page</title>
</head>
<body style="background-color: #87CEEB">
	<form name="registrationForm" action="insertEmployeeAction"
		method="post" autocomplete="off" onsubmit="return validateForm()">
		<div
			style="border: 5px solid black; width: 565px; height: 450px; padding-left: 80px; padding-top: 70px">
			<h1 style="margin-left: 125px">
				<U>Employee</U>
			</h1>
			<h1 style="margin-left: 70px">
				<U>Registration Form</U>
			</h1>
			<p style="display: inline-block;">Name:</p>
			<input name="name" type="text" placeholder="Type Here..." /> <span
				style="color: red" id="nameError"></span>
			<hr>
			<c:set var="EmployeeSkills1" value="JAVA,OOPS,SPRING-MVC,JDBC,MySQL"
				scope="application" />
			<c:forEach var="skills11" items="${EmployeeSkills1}">
				<input name="skills" value="${skills11}" type="checkbox" />${skills11} &nbsp &nbsp
			</c:forEach>
			<hr>
			<p style="display: inline-block;">Date of birth:</p>
			<input name="dateOfBirth" onsubmit="getAge(dob)" type="date"
				onfocus="this.max=new Date().toISOString().split('T')[0]" /> <span
				style="color: red" id="dobError"></span> <small>${dob1}</small> <br>
			<br>
			<button>Insert</button>
		</div>
	</form>
	<button>
		<a href="readAllEmployeeAction">ReadAll</a>
	</button>
</body>
<script>
function validateForm() {
    var name = document.forms["registrationForm"]["name"].value;
    var dob = document.forms["registrationForm"]["dateOfBirth"].value;
    var isValid = true;

    if (name === "" || name === null) {
        document.getElementById("nameError").innerHTML = "Please Enter Your Name";
        isValid = false;
    } else if (name.match(/[0-9]/)) {
        document.getElementById("nameError").innerHTML = "Please enter Your Name in letters only";       
        isValid = false;
    } else {
        document.getElementById("nameError").innerHTML = "";
    }
    
    if (dob === "" || dob === null) {
        document.getElementById("dobError").innerHTML = "Please Enter Your Date Of Birth";
        isValid = false;
    } else {
        document.getElementById("dobError").innerHTML = "";
        
        var age = getAge(dob);  //getting function getAge(dob) from the below function code
        if (age < 18 || age > 66) {
            document.getElementById("dobError").innerHTML = "Age should be from 18 to 65";
            isValid = false;
        } else {
            document.getElementById("dobError").innerHTML = "";
        }
    }

    return isValid;
}

function getAge(dob) {
    var today = new Date();
    var birthDate = new Date(dob);
    var age = today.getFullYear() - birthDate.getFullYear();
    var m = today.getMonth() - birthDate.getMonth();
    if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
        age--;
    }
    return age;
}

</script>

</html>
