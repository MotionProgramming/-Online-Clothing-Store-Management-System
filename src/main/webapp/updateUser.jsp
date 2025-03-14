<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update User</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #5b5e61;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.container {
	background: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	width: 300px;
	text-align: center;
}

h1 {
	color: #333;
}

input[type="text"], input[type="email"] {
	width: 100%;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-radius: 5px;
}

button {
	background: #5b5e61;
	color: white;
	border: none;
	padding: 10px 15px;
	margin-top: 20px;
	width: 100%;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
}

button:hover {
	background: #5b5959d5;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Update User</h1>
		<form action="updateUserProcess.jsp" method="post">
			<input type="text" name="username" placeholder="Username" required>
			<input type="email" name="email" placeholder="Email" required>
			<input type="text" name="phone" placeholder="Phone Number" required>
			<button type="submit">Update User</button>
		</form>
		<br> <a href="admin.jsp" class="action-button">Back</a>
	</div>
</body>
</html>
