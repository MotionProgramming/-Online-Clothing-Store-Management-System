<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.container {
	background: #fff;
	padding: 50px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	width: 400px;
	text-align: center;
}

h1 {
	color: #333;
}

.action button {
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

.action button:hover {
	background: #5b5959d5;
}

.action a {
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Admin Dashboard</h1>
		<div class="action">
			<a href="viewUsers.jsp" target="_blank">
				<button>View Users</button>
			</a> <a href="createUser.jsp" target="_blank">
				<button>Create User</button>
			</a> <a href="updateUser.jsp" target="_blank">
				<button>Update User</button>
			</a> <a href="deleteUser.jsp" target="_blank">
				<button>Delete User</button>
			</a> <a href="viewCheckouts.jsp" target="_blank">
				<button>View Checkouts</button>
			</a>

		</div>
	</div>
	<br>

</body>
</html>
