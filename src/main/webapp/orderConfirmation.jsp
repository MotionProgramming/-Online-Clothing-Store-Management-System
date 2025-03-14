<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order Confirmation</title>
<link rel="stylesheet" href="css/confirmation.css">
</head>
<body>
	<div class="container">
		<h1>Order Confirmation</h1>

		<%
		// Retrieve form data
		String name = request.getParameter("name");
		String number = request.getParameter("number");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String totalPrice = request.getParameter("totalPrice");
		%>
		<p>
			Thank you, <strong><%=name%></strong>, for your order!
		</p>
		<p>
			We will contact you at <strong><%=number%></strong> or <strong><%=email%></strong>
			regarding your delivery.
		</p>
		<p>Your order will be shipped to the following address:</p>
		<p><%=address%></p>
		<p>
			Total Amount: <strong><%=totalPrice%> &#2547;</strong>
		</p>
		<p>Your order is being processed and will be shipped shortly.</p>
	</div>
</body>
</html>
