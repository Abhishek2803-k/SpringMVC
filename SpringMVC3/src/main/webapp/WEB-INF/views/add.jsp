<%@page import="com.jspides.SpringMVC.POJO.StudentPOJO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="Navbar.jsp" />
<%
StudentPOJO student = (StudentPOJO) request.getAttribute("student");
%>
<%
String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add page</title>
<style>
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

input {
	border: 1px solid rgba(0, 0, 0, 0.1);
	border-radius: 4px;
	height: 38px;
	line-height: 38px;
	padding-left: 5px;
}

input, label {
	color: rgba(0, 0, 0, 0.8);
}

input {
	width: 220px;
	z-index: 1000;
}

footer {
	padding: 10px;
}

h2 {
	color: red;
}
.sub{
background-color: #7cf03e;
}
</style>
</head>
<body>
	<%
	if (student != null) {
	%>
	<h2>
		<marquee behavior="slide" direction="left"><%=student.getFirstname()%>
			added successfully...	add more...			
		</marquee>
	</h2>

	<%
	} else if (msg != null) {
	%>
	<h2 align="center">
		<%=msg%>
	</h2>
	<%
	}
	%>

	<div class="big">

		<fieldset class="tea">
			<legend>
				<h1>Student Details Management</h1>
			</legend>
			<h3>Here, you can add details of new Students.</h3>
			<form action="./add" method="post">
				<table>

					<tr>
						<td><label>First Name</label></td>
						<td><input type="text" name="firstname" /></td>
					</tr>

					<tr>
						<td><label>Last Name</label></td>
						<td><input type="text" name="lastname" /></td>

						<td><label>Email</label></td>
						<td><input type="email" name="email" /></td>
					</tr>

					<tr>
						<td><label>UserName</label></td>
						<td><input type="text" name="username" /></td>

						<td><label>Password</label></td>
						<td><input type="password" name="password" /></td>
					</tr>
					<br>
					<tr>
						<td><label>Mobile No</label></td>
						<td><input type="tel" name="contact" maxlength="10" /></td>

						<td><label>D.O.B</label></td>
						<td><input type="date" name="dob" /></td>
					</tr>

				</table>
				<footer>
					<br> <br>
					<tr>
						<td><input class="sub" type="submit" value="ADD Students" /></td>
					</tr>
					<br> <br>
				</footer>
			</form>
		</fieldset>

	</div>


</body>
</html>