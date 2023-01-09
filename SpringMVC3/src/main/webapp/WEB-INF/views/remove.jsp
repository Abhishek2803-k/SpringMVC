<%@page import="com.jspides.SpringMVC.POJO.StudentPOJO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="Navbar.jsp" />
<%
List<StudentPOJO> students = (List<StudentPOJO>) request.getAttribute("students");
String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management</title>
<style>
html {
	background-color: #ccc;
}

form {
	display: block;
	left: 50%;
	position: absolute;
	top: 15%;
}

input[type=number] {
	border: solid 3px rgb(76, 68, 68);
	box-sizing: border-box;
	font-size: 2em;
	height: 2em;
	margin-left: -15vw;
	outline: solid #fc0 0;
	padding: .5em;
	transition: all 2s ease-in;
	width: 30vw;
	z-index: 1;
}

.tabs {
	margin-top: 120px;
}

.tab {
	border-radius: 5px;
	font-size: 12px;
	font-weight: normal;
	border: none;
	border-collapse: collapse;
	width: 100%;
	max-width: 100%;
	white-space: nowrap;
	background-color: white;
}

.tab td, .tab th {
	text-align: center;
	padding: 8px;
}

.tab td {
	border-right: 1px solid #f8f8f8;
	font-size: 12px;
}

.tab thead th {
	color: #ffffff;
	background: #4FC3A1;
}

.tab thead th:nth-child(odd) {
	color: #ffffff;
	background: #324960;
}

.tab tr:nth-child(even) {
	background: #F8F8F8;
}

h2 {
	margin-top: 110px;
	color: red;
}
.sub{
background-color: #7cf03e;
height: 3.2em;
font-size: 20px;
}
</style>
</head>
<body>
	<form action="./remove" method="post">
		<table>
			<tr>
				<td><input type="number" placeholder="Id remove... " name="id"></td>
				<td><input class="sub" type="submit" value="Remove"></td>
			</tr>
		</table>
	</form>

	<%
	if (msg != null) {
	%>
	<h2 align="center"><%=msg%></h2>
	<%
	}
	%>
	<%
	if (students != null) {
	%>
	<fieldset class="tabs">
		<table class="tab">
			<tr>
				<td>
					<h3>ID</h3>
				</td>
				<td>
					<h3>First Name</h3>
				</td>
				<td>
					<h3>Last Name</h3>
				</td>
				<td>
					<h3>Email</h3>
				</td>
				<td>
					<h3>Username</h3>
				</td>
				<td>
					<h3>Password</h3>
				</td>
				<td>
					<h3>Contact</h3>
				</td>
				<td>
					<h3>D.O.B</h3>
				</td>
			</tr>
			<%
			for (StudentPOJO student : students) {
			%>
			<tr>
				<td><%=student.getId()%></td>
				<td><%=student.getFirstname()%></td>
				<td><%=student.getLastname()%></td>
				<td><%=student.getEmail()%></td>
				<td><%=student.getUsername()%></td>
				<td><%=student.getPassword()%></td>
				<td><%=student.getContact()%></td>
				<td><%=student.getDob()%></td>

			</tr>
			<%
			}
			%>
		</table>
	</fieldset>
	<%
	}
	%>
</body>
</html>