<%@page import="java.util.List"%>
<%@page import="com.jspides.SpringMVC.POJO.StudentPOJO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="Navbar.jsp" />
<%
List<StudentPOJO> students = (List<StudentPOJO>) request.getAttribute("students");
String msg = (String) request.getAttribute("msg");
StudentPOJO student = (StudentPOJO) request.getAttribute("student");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
<style>
html {
	background-color: #ccc;
}

.big {
	font-family: "Roboto", sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	/* overflow: hidden; */
	margin: 0;
	padding: 0;
}

.tea {
	bottom: 100px;
	position: absolute;
	text-align: center;
	background: rgba(128, 113, 130, 0.5)
}

.iit {
	margin-top: 25px;
	border: 1px solid rgba(0, 0, 0, 0.1);
	border-radius: 4px;
	height: 38px;
	line-height: 38px;
	padding-left: 5px;
}

input, label {
	color: rgba(0, 0, 0, 0.8);
}

.iit {
	width: 220px;
	z-index: 1000;
}

footer {
	padding: 10px;
}

form.inp {
	display: block;
	left: 50%;
	position: absolute;
	top: 15%;
}

.inp input[type=number] {
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
	margin-top: 160px;
	border-radius: 5px;
	font-size: 20px;
	font-weight: normal;
	border: none;
	border-collapse: collapse;
	width: 100%;
	max-width: 100%;
	white-space: nowrap;
	background-color: white;
	margin-top: 160px;
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

.sub{
	background-color: #25d366;
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
}h2 {
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
	<%
	if (student != null) {
	%>
	<div class="big">
		<fieldset class="tea">
			<form action="./updateData" method="post">
				<table>
					<tr>
						<td><label>Id</label></td>
						<td><input type="number" name="id" min="0"	value="<%=student.getId()%>" class="iit" /></td>

						<td><label>First Name</label></td>
						<td><input type="text" name="firstname"
							value="<%=student.getFirstname()%>" class="iit" /></td>
					</tr>

					<tr>
						<td><label>Last Name</label></td>
						<td><input type="text" name="lastname"
							value="<%=student.getLastname()%>" class="iit" /></td>

						<td><label>Email</label></td>
						<td><input type="email" name="email"
							value="<%=student.getEmail()%>" class="iit" /></td>
					</tr>

					<tr>
						<td><label>UserName</label></td>
						<td><input type="text" name="username"
							value="<%=student.getUsername()%>" class="iit" /></td>

						<td><label>Password</label></td>
						<td><input type="password" name="password"
							value="<%=student.getPassword()%>" class="iit" /></td>
					</tr>
					<tr>
						<td><label>Mobile No</label></td>
						<td><input type="tel" name="contact" maxlength="10"
							value="<%=student.getContact()%>" class="iit" /></td>

						<td><label>D.O.B</label></td>
						<td><input type="date" name="dob"
							value="<%=student.getDob()%>" class="iit" /></td>
					</tr>
				</table>
				<footer>
					<br> <br>
					<tr>
						<td><input class="sub" type="submit" value="Update" /></td>
					</tr>
					<br> <br>
				</footer>
			</form>
		</fieldset>
	</div>
	<%
	} else {
	%>
	<form action="./update" method="post" class="inp">
		<table>
			<tr>
				<td><input type="number" name="id"  placeholder="Update record..." min="0"></td>
					<td><input type="submit" value="Update" class="sub"></td>
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
			for (StudentPOJO studant : students) {
			%>
			<tr>
				<td><%=studant.getId()%></td>
				<td><%=studant.getFirstname()%></td>
				<td><%=studant.getLastname()%></td>
				<td><%=studant.getEmail()%></td>
				<td><%=studant.getUsername()%></td>
				<td><%=studant.getPassword()%></td>
				<td><%=studant.getContact()%></td>
				<td><%=studant.getDob()%></td>

			</tr>
			<%
			}
			%>
		</table>
	</fieldset>
	<%
	}
	%>
	<%
	}
	%>
</body>
</html>