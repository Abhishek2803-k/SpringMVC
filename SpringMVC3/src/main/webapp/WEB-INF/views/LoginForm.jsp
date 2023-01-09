<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" />
<title>Student Management</title>
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto&display=swap)
	;

@import url(https://fonts.googleapis.com/css?family=Raleway:600);

@import url(https://font-awesome-4.6.3/css/font-awesome.min.css);

body {
	font-family: "Roboto", sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	overflow: hidden;
	margin: 0;
	padding: 0;
	background-image: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

#bg {
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-size: cover;
	filter: blur(5px);
}

form {
	width: 350px;
	position: relative;
}

form .form-field::before {
	font-size: 20px;
	position: absolute;
	left: 15px;
	top: 17px;
	color: #888888;
	content: " ";
	display: block;
	background-size: cover;
	background-repeat: no-repeat;
}

form .form-field {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-pack: justify;
	-ms-flex-pack: justify;
	justify-content: space-between;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	margin-bottom: 1rem;
	position: relative;
}

form input {
	font-family: inherit;
	width: 100%;
	outline: none;
	background-color: #fff;
	border-radius: 4px;
	border: none;
	display: block;
	padding: 0.9rem 0.7rem;
	box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.16);
	font-size: 17px;
	color: #4a4a4a;
	text-indent: 40px;
}

form .btn {
	outline: none;
	border: none;
	cursor: pointer;
	display: inline-block;
	margin: 0 auto;
	padding: 0.9rem 2.5rem;
	text-align: center;
	background-color: #47ab11;
	color: #fff;
	border-radius: 4px;
	box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.16);
	font-size: 17px;
}

.logged {
	width: 100%;
	height: 100vh;
	justify-content: center;
	display: flex;
	padding: 30px;
	font-family: "Arial", sans-serif;
	font-size: 22px;
	color: rgb(1, 1, 27);
	position: absolute;
	top: 35%;
}
</style>
</head>
<body>
	<div class="logged">
		<h1></h1>
		<form action="./login" method="post">
			<div class="form-field">
				<i class="fa-regular fa-user"></i> <input type="text"
					placeholder="Username" name="username" />
			</div>
			<div class="form-field">
				<i class="fa-solid fa-lock"></i> <input type="password"
					placeholder="Password" name="password" />
			</div>

			<div class="form-field">
				<input class="btn" type="submit" value="Login" />
			</div>
		</form>
	</div>
</body>
</html>