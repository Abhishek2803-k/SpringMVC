<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NavBar</title>
<style>
html, body {
	margin: 0;
	height: 100vh;
	width: 100vw;
	overflow: hidden;
}

body {
	font-family: "Roboto", sans-serif;
	background: #007991;
	background: -webkit-linear-gradient(to right, #78ffd6, #007991);
	background: linear-gradient(to right, #78ffd6, #007991);
}

h1 {
	margin: 20px 0;
	color: #fff;
}

.center {
	text-align: center;
}

.nav-wrapper {
	display: flex;
	position: relative;
	flex-direction: row;
	flex-wrap: nowrap;
	align-items: center;
	justify-content: space-between;
	margin: auto;
	width: 90%;
	height: 80px;
	border-radius: 0 0 15px 15px;
	padding: 0 25px;
	z-index: 2;
	background: #fff;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
}

.nav-tabs {
	display: flex;
	font-weight: 600;
	font-size: 18px;
	list-style: none;
}

.nav-tab:not(:last-child) {
	padding: 10px 25px;
	margin: 0;
	border-right: 1px solid #eee;
}

.nav-tab:last-child {
	padding: 10px 0 0 25px;
}

.nav-tab, .menu-btn {
	cursor: pointer;
}

.hidden {
	display: none;
}

@media screen and (max-width: 800px) {
	.nav-container {
		position: fixed;
		display: none;
		overflow-y: auto;
		z-index: -1;
		top: 0;
		right: 0;
		width: 280px;
		height: 100%;
		background: #fff;
		box-shadow: -1px 0 2px rgba(0, 0, 0, 0.2);
	}
	.nav-tabs {
		flex-direction: column;
		align-items: flex-end;
		margin-top: 80px;
		width: 100%;
	}
	.nav-tab:not(:last-child) {
		padding: 20px 25px;
		margin: 0;
		border-right: unset;
		border-bottom: 1px solid #f5f5f5;
	}
	.nav-tab:last-child {
		padding: 15px 25px;
	}
	.menu-btn {
		position: relative;
		display: block;
		margin: 0;
		width: 20px;
		height: 15px;
		cursor: pointer;
		z-index: 2;
		padding: 10px;
		border-radius: 10px;
	}
	.menu-btn .menu {
		display: block;
		width: 100%;
		height: 2px;
		border-radius: 2px;
		background: #111;
	}
	.menu-btn .menu:nth-child(2) {
		margin-top: 4px;
		opacity: 1;
	}
	.menu-btn .menu:nth-child(3) {
		margin-top: 4px;
	}
	#menuToggle:checked+.menu-btn .menu {
		transition: transform 0.2s ease;
	}
	#menuToggle:checked+.menu-btn .menu:nth-child(1) {
		transform: translate3d(0, 6px, 0) rotate(45deg);
	}
	#menuToggle:checked+.menu-btn .menu:nth-child(2) {
		transform: rotate(-45deg) translate3d(-5.71429px, -6px, 0);
		opacity: 0;
	}
	#menuToggle:checked+.menu-btn .menu:nth-child(3) {
		transform: translate3d(0, -6px, 0) rotate(-45deg);
	}
	#menuToggle:checked ~ .nav-container {
		z-index: 1;
		display: flex;
		animation: menu-slide-left 0.3s ease;
	}
	@
	keyframes menu-slide-left { 0% {
		transform: translateX(200px);
	}
	to {
		transform: translateX(0);
	}
}
}
</style>
</head>
<body>
	<header>
		<div class="nav-wrapper">
			<nav>

				<div class="nav-container">
					<ul class="nav-tabs">
						<li class="nav-tab"><a href="./home">Home</a></li>
						<li class="nav-tab"><a href="./search">Search</a></li>
						<li class="nav-tab"><a href="./add">Add</a></li>
						<li class="nav-tab"><a href="./remove">Remove</a></li>
						<li class="nav-tab"><a href="./update">update</a></li>
						<li class="nav-tab"><a href="./logout">logout</a></li>
					</ul>
				</div>
			</nav>
		</div>
	</header>

</body>
</html>