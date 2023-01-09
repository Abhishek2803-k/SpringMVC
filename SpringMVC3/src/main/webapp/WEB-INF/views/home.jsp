<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="Navbar.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<style>
	.welcome {
            width: 100%;
            height: 100vh;
            display: flex;
            justify-content: center;
            margin: 100px auto auto auto;
          }
          .note {
            width: 100%;
            height: 100vh;
            text-align: center;
            padding: 30px;
            font-family: "Arial", sans-serif; 
            font-size: 22px;
            color: #fff; 
            position: absolute;
            top: 40%;
          }
          .list {
            width: 100%;
            height: 100vh;
            padding: 35px;
            font-family: "Arial", sans-serif; 
            font-size: 22px;
            color: #fff; 
            position: absolute;
            top: 50%;
            left: 34%;
          }

          h1 {
            color: #fff;
            font-family: "Raleway", sans-serif;
            font-size: 52px;
            font-weight: 600;
            text-transform: uppercase;
          }
</style>
</head>
<body>
<div class="welcome">
          <h1>
            <span>welcome</span>
          </h1>
        </div>
        <div class="note">
          <p> This is Student Details Management System, here you can 
            <br> perform several operation i.e.</p>
        </div>
          <div class="list">
          <ol>
            <li>Search a Student from Database</li>
            <li>Remove a Student from Database</li>
            <li>Edit or Modify details of Student from Database</li>
            <li>Add a new Student details in Database</li>
            <li>Login to Students Profile</li>
          </ol>
        </div>
</body>
</html>