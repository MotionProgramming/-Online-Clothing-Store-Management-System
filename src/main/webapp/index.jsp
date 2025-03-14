<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/cloth.css">
</head>
<body>
	<div class="container">
		<header id="header">
			<div class="topnav">
				<a class="active" href="index.jsp">Home</a> <a href="signup.jsp">Register</a>
				<a href="contact.jsp">Contact</a> <a href="login.jsp">Login</a> <a
					href="cart.jsp" id="cart-link">Cart (<span id="cart-count"><%=session.getAttribute("cartCount") != null ? session.getAttribute("cartCount") : 0%></span>)
				</a> <a href="search.jsp">Search</a>
			</div>
		</header>

		<img class="front" src="image/collection2.jpg" alt="img">
		<h1>Available Now</h1>

		<div class="grid-container">
			<div class="grid-item">
				<p class="item">Shirt</p>
				<img class="gridimg" src="image/grid1.jpg" alt="image">
			</div>

			<div class="grid-item">
				<p class="item">T-Shirt</p>
				<img src="image/grid3.jpg" alt="image">
			</div>

			<div class="grid-item">
				<p class="item">Pant</p>
				<img src="image/grid4.jpg" alt="image">
			</div>
		</div>

		<h1>Select item you want to buy</h1>

		<h1>Shirt</h1>
		<div class="grid-container">
			<%
			String[] shirts = {"shirt1.jpg", "shirt2.jpg", "shirt3.jpg", "shirt4.jpg", "shirt5.jpg", "shirt6.jpg", "shirt7.jpg",
					"shirt8.jpg", "shirt9.jpg"};
			String[] shirtDetails = {"VIBRANT FULL SLEEVE PLAIN SHIRT", "VIBRANT FULL SLEEVE PLAIN SHIRT",
					"VIBRANT FULL SLEEVE PLAIN SHIRT", "VIBRANT FULL SLEEVE PLAIN SHIRT", "VIBRANT FULL SLEEVE PLAIN SHIRT",
					"VIBRANT FULL SLEEVE PLAIN SHIRT", "VIBRANT FULL SLEEVE PLAIN SHIRT", "VIBRANT FULL SLEEVE PLAIN SHIRT",
					"VIBRANT FULL SLEEVE PLAIN SHIRT"};
			int[] shirtPrices = {1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250};
			for (int i = 0; i < shirts.length; i++) {
			%>
			<div class="grid-item">
				<a href="image/<%=shirts[i]%>" target="_blank"><img
					class="gridimg" src="image/<%=shirts[i]%>" alt="image"></a>
				<p class="detail"><%=shirtDetails[i]%></p>
				<p class="prize"><%=shirtPrices[i]%>
					&#2547;
				</p>
				<button type="button" class="button"
					onclick="addToCart('<%=shirtDetails[i]%>', <%=shirtPrices[i]%>)">Add
					to Cart</button>
			</div>
			<%
			}
			%>
		</div>

		<h1>T-Shirt</h1>
		<div class="grid-container">
			<%
			String[] tshirts = {"tsirt1.jpg", "tsirt2.jpg", "tsirt3.jpg", "tsirt4.jpg", "tsirt5.jpg", "tsirt6.jpg"};
			String[] tshirtDetails = {"MAN T-SHIRT", "MAN T-SHIRT", "MAN T-SHIRT", "MAN T-SHIRT", "MAN T-SHIRT", "MAN T-SHIRT"};
			int[] tshirtPrices = {450, 450, 450, 450, 450, 450};
			for (int i = 0; i < tshirts.length; i++) {
			%>
			<div class="grid-item">
				<a href="image/<%=tshirts[i]%>"><img class="gridimg"
					src="image/<%=tshirts[i]%>" alt="img"></a>
				<p class="detail"><%=tshirtDetails[i]%></p>
				<p class="prize"><%=tshirtPrices[i]%>
					&#2547;
				</p>
				<button type="button" class="button"
					onclick="addToCart('<%=tshirtDetails[i]%>', <%=tshirtPrices[i]%>)">Add
					to Cart</button>
			</div>
			<%
			}
			%>
		</div>

		<h1>Pant</h1>
		<div class="grid-container">
			<%
			String[] pants = {"pant1.jpg", "pant2.jpg", "pant3.jpg", "pant4.jpg", "pant5.jpg", "pant6.jpg", "pant7.jpg"};
			String[] pantDetails = {"MAN's PANT", "MAN's PANT", "MAN's PANT", "MAN's PANT", "MAN's PANT", "MAN's PANT",
					"MAN's PANT"};
			int[] pantPrices = {1750, 1750, 1750, 1750, 1750, 1750, 1750};
			for (int i = 0; i < pants.length; i++) {
			%>
			<div class="grid-item">
				<a href="image/<%=pants[i]%>"><img class="gridimg"
					src="image/<%=pants[i]%>" alt="img"></a>
				<p class="detail"><%=pantDetails[i]%></p>
				<p class="prize"><%=pantPrices[i]%>
					&#2547;
				</p>
				<button type="button" class="button"
					onclick="addToCart(&quot;<%=pantDetails[i]%>&quot;, <%=pantPrices[i]%>)">Add
					to Cart</button>
			</div>
			<%
			}
			%>
		</div>

		<div class="totalprize">
			<h2>
				Total Price: <span id="total-price">0</span> &#2547;
			</h2>

			<!-- Checkout form -->
			<form action="checkout.jsp" method="post">
				<!-- Hidden input to pass total price to checkout.jsp -->
				<input type="hidden" id="hidden-total-price" name="totalPrice"
					value="0">
				<button type="submit" class="button">Checkout</button>
				<br> <br> <br>
				<footer>
					<div class="container">
						<a href="privacy.jsp" style="color: black; text-decoration: none;">Privacy
							Policy</a>
					</div>
				</footer>
			</form>
		</div>


	</div>

	<script>
        let cartCount = <%=session.getAttribute("cartCount") != null ? session.getAttribute("cartCount") : 0%>;
        let totalPrice = <%=session.getAttribute("totalPrice") != null ? session.getAttribute("totalPrice") : 0%>;

        // Update cart item count
        function updateCartCount() {
            document.getElementById("cart-count").textContent = cartCount;
        }

        // Add to cart functionality
        function addToCart(item, price) {
            cartCount++;
            totalPrice += price;
            updateCartCount();
            updateTotalPrice();
            alert(item + " added to cart! Price: " + price + " &#2547;");

            // Add the item and price to session using AJAX
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "addToCart.jsp", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    if (xhr.responseText == "success") {
                        console.log("Item added to cart successfully!");
                    } else {
                        alert("Failed to add item to cart.");
                    }
                }
            };
            xhr.send("item=" + encodeURIComponent(item) + "&price=" + price);
        }

        // Update the total price displayed on the page
        function updateTotalPrice() {
            document.getElementById("total-price").textContent = totalPrice;
            document.getElementById("hidden-total-price").value = totalPrice; // Update hidden field value
        }

        // Initialize on page load
        window.onload = function() {
            updateCartCount();
            updateTotalPrice();
        };
    </script>
</body>
</html>
