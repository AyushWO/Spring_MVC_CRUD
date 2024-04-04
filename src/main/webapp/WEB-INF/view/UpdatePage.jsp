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
<title>Update Page</title>
</head>
<body style="background-color: #87CEEB">
	<form action="<c:url value='/UpdateEmployeeAction/${employee.id}' />"
		method="post" autocomplete="off" onsubmit="return validateForm()">
		<div
			style="border: 5px solid black; width: 580px; height: 450px; padding-left: 80px; padding-top: 80px">
			<h1 style="margin-left: 90px">
				<U>Update Page</U>
			</h1>
			<p>
				Name: <input name="name" value="${employee.name}" type="text" />
			</p>
			<span style="color: red" id="nameError"></span>
			<p style="display: inline-block;">Skills:</p>
			<c:set var="EmployeeSkills1" value="JAVA,OOPS,SPRING-MVC,JDBC,MySQL"
				scope="application" />
			<c:forEach var="skill" items="${EmployeeSkills1.split(',')}">
				<c:set var="isChecked" value="false" />
				<c:forEach var="empSkill" items="${employee.skills}">
					<c:if test="${empSkill eq skill}">
						<c:set var="isChecked" value="true" />
					</c:if>
				</c:forEach>
				<input name="skills" value="${skill}" ${isChecked ? 'checked' : ''}
					type="checkbox" />${skill} &nbsp &nbsp
			</c:forEach>
			<hr>
			<p>
				Date of birth: <input name="dateOfBirth" onsubmit="getAge(dob)"
					value="${employee.dateOfBirth}" type="date"
					onfocus="this.max=new Date().toISOString().split('T')[0]" />
			</p>
			<span style="color: red" id="dobError"></span>
			<button>Update</button>
		</div>
	</form>
</body>
<script>
    function validateForm() {
        var name = document.forms["registrationForm"]["name"].value;
        var dob = document.forms["registrationForm"]["dateOfBirth"].value;
        var isValid = true;

        if (name == "") {
            document.getElementById("nameError").innerHTML = "Please Enter Your Name";
            isValid = false;
        } else {
            document.getElementById("nameError").innerHTML = "";
        }
        
        if (name != null) {
            if (name.match(/[0-9]/)) {
                document.getElementById("nameError").innerHTML = "Please enter in letters only";       
                isValid = false;
            } else {
                document.getElementById("nameError").innerHTML = "";
            }
        }

        if (dob == "") {
            document.getElementById("dobError").innerHTML = "Please Enter Your Date Of Birth";
            isValid = false;
        } else {
            document.getElementById("dobError").innerHTML = "";
        }
        
        var age = getAge(dob);  //getting function getAge(dob) from the below function code
        if (age < 18 || age > 66) {
            document.getElementById("dobError").innerHTML = "Age should be from 18 to 65";
            isValid = false;
        } else {
            document.getElementById("dobError").innerHTML = "";
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
