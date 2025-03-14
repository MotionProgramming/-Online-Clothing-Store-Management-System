<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shopping Cart</title>
<link rel="stylesheet" href="css/cart.css">
</head>
<body>
	<div class="container">
		<h1>Your Shopping Cart</h1>
		<div class="cart-items">
			<%
			// Retrieve cart items and their prices from session
			List<String> cartItems = (List<String>) session.getAttribute("cartItems");
			List<Integer> cartPrices = (List<Integer>) session.getAttribute("cartPrices");

			if (cartItems == null) {
				cartItems = new ArrayList<>();
				session.setAttribute("cartItems", cartItems);
			}
			if (cartPrices == null || cartPrices.size() != cartItems.size()) {
				cartPrices = new ArrayList<>();
				for (int j = 0; j < cartItems.size(); j++) {
					cartPrices.add(0);
				}
				session.setAttribute("cartPrices", cartPrices);
			}

			if (!cartItems.isEmpty()) {
				int total = 0;
				for (int i = 0; i < cartItems.size(); i++) {
			%>
			<div class="cart-item">
				<p><%=cartItems.get(i)%>
					-
					<%=cartPrices.get(i)%>
					&#2547;
				</p>
			</div>
			<%
			total += cartPrices.get(i);
			}
			%>
			<div class="total">
				<h2>
					Total Price:
					<%=total%>
					&#2547;
				</h2>
			</div>
			<form action="checkout.jsp" method="post">
				<input type="hidden" name="totalPrice" value="<%=total%>">
				<button type="submit" class="button">Proceed to Checkout</button>
			</form>
			<%
			} // Closing the if block for !cartItems.isEmpty()
			%>
		</div>
		<div class="continue-shopping">
			<a href="index.jsp" class="button">Continue Shopping</a>
		</div>
		<a href="index.jsp" class="action-button">Back</a>
	</div>
</body>
</html>
