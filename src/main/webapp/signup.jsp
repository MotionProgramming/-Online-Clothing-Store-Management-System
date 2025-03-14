<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up Form</title>
<!-- Linking the CSS file -->
<link href="<%=request.getContextPath()%>/css/stylesignup.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div class="signup-form">
		<form action="connector.jsp" method="POST">
			<!-- Update action to point to the JSP handling registration -->
			<h1>Enter Your Information</h1>
			<div class="content">
				<div class="input-field">
					<input type="text" name="username" placeholder="Enter your name"
						required>
					<!-- Added name attribute -->
				</div>
				<div class="input-field">
					<input type="text" name="number" placeholder="Enter your number"
						required>
					<!-- Added name attribute -->
				</div>
				<div class="input-field">
					<input type="email" name="email" placeholder="Email"
						autocomplete="nope" required>
					<!-- Added name attribute -->
				</div>
				<div class="action">
					<button type="submit">Register</button>
				</div>
				<br>
				<br> <a href="index.jsp" class="action-button">Back</a>
			</div>
		</form>
	</div>
	<script src="./script.js"></script>
</body>
</html>