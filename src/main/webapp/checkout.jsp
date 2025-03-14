<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Checkout</title>
<link rel="stylesheet" href="css/checkout.css">
<script>
	function clearForm() {
		document.getElementById("checkoutForm").reset();
	}
</script>
</head>
<body onload="clearForm()">
	<div class="container">
		<h1>Checkout</h1>

		<%
		// Get the total price from the form or session
		String totalPrice = request.getParameter("totalPrice");
		if (totalPrice == null) {
			totalPrice = (String) session.getAttribute("totalPrice");
		}
		// Clear session attribute after usage
		// Comment the next line if you want to keep the total price on next submissions
		session.removeAttribute("totalPrice");
		%>

		<!-- Display total price -->
		<p>
			Total Price: <strong><%=totalPrice != null ? totalPrice : "N/A"%>
				&#2547;</strong>
		</p>

		<!-- Form submission -->
		<form id="checkoutForm"
			action="${pageContext.request.contextPath}/confirm.jsp" method="post">

			<label for="name">Name:</label> <input type="text" id="name"
				name="name" required><br> <label for="email">Email:</label>
			<input type="email" id="email" name="email" required><br>

			<label for="number">Number:</label> <input type="text" id="number"
				name="number" required><br> <label for="address">Address:</label>
			<input type="text" id="address" name="address" required><br>

			<!-- Hidden input for total price -->
			<input type="hidden" name="totalPrice"
				value="<%=totalPrice != null ? totalPrice : ""%>">

			<button type="submit">Confirm Purchase</button>

			<br>
			<br>
			<a href="index.jsp">Back</a>
		</form>
	</div>
</body>
</html>