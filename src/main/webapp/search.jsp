<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search Results</title>
<link rel="stylesheet" href="css/Search.css">
</head>
<body>
	<div class="container">
		<header id="header">
			<div class="topnav">
				<form action="search.jsp" method="get">
					<input type="text" name="query" placeholder="Search.." required>
					<button type="submit">Search</button>
				</form>
			</div>
		</header>

		<h1>Search Results</h1>

		<%
		String query = request.getParameter("query"); // Retrieve search query
		if (query != null && !query.isEmpty()) {
			out.println("<p>Search term: " + query + "</p>");

			// if you want to need to store data awhith database you creare table  ProductCollection
			//(name,  category, price, image_filename)

			String[] shirts = { "shirt1.jpg", "shirt2.jpg", "shirt3.jpg", "shirt4.jpg" };
			String[] tshirts = { "tsirt1.jpg", "tsirt2.jpg", "tsirt3.jpg", "tsirt4.jpg" };
			String[] pants = { "pant1.jpg", "pant2.jpg", "pant3.jpg", "pant4.jpg" };

			boolean found = false;

			out.println("<div class='search-results'>");

			if (query.toLowerCase().contains("shirt")) {
				for (String shirt : shirts) {
			found = true;
			out.println("<div class='product-item'>");
			out.println("<img src='image/" + shirt + "' alt='Shirt'>");
			out.println("<p>Shirt</p>");
			out.println("</div>");
				}
			}

			if (query.toLowerCase().contains("t-shirt")) {
				for (String tshirt : tshirts) {
			found = true;
			out.println("<div class='product-item'>");
			out.println("<img src='image/" + tshirt + "' alt='T-Shirt'>");
			out.println("<p>T-Shirt</p>");
			out.println("</div>");
				}
			}

			if (query.toLowerCase().contains("pant")) {
				for (String pant : pants) {
			found = true;
			out.println("<div class='product-item'>");
			out.println("<img src='image/" + pant + "' alt='Pant'>");
			out.println("<p>Pant</p>");
			out.println("</div>");
				}
			}

			out.println("</div>");

			if (!found) {
				out.println("<p class='no-results'>No results found for '" + query + "'</p>");
			}
		} else {
			out.println("<p class='info-message'>Please enter a search term.</p>");
		}
		%>
		<a href="index.jsp" class="action-button">Back</a>

	</div>

	<footer>
		<div class="container">
			<p>&copy; 2025 Cr7 Website. All rights reserved.</p>

		</div>
	</footer>
</body>
</html>
