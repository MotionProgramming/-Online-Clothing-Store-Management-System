<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Checkouts</title>
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
	box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
	width: 90%;
	max-width: 1200px;
	overflow-x: auto;
}

h1 {
	color: #333;
	text-align: center;
	font-size: 2.5em;
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

table, th, td {
	border: 1px solid #ddd;
}

th, td {
	padding: 12px;
	text-align: left;
}

th {
	background-color: #5b5e61;
	color: white;
}

td {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: #f1f1f1;
}

a {
	display: inline-block;
	margin-top: 20px;
	text-decoration: none;
	color: #5b5e61;
	font-size: 1.1em;
}

a:hover {
	color: #333;
}

.action-button {
	padding: 10px 20px;
	background-color: #5b5e61;
	color: white;
	border: none;
	border-radius: 5px;
	text-decoration: none;
	text-align: center;
	font-size: 16px;
}

.action-button:hover {
	background-color: #4a4d51;
}

.delete-button {
	padding: 8px 16px;
	background-color: #e74c3c;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.delete-button:hover {
	background-color: #c0392b;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Delivery History</h1>
		<table>
			<thead>
				<tr>
					<th>Name</th>
					<th>Phone Number</th>
					<th>Email</th>
					<th>Address</th>
					<th>Total Price</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				Connection conn = null;
				PreparedStatement ps = null;
				ResultSet rs = null;

				try {
					// Assuming you're using Oracle, change the database connection details accordingly
					Class.forName("oracle.jdbc.driver.OracleDriver");
					conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "c##rajeeb", "rajeeb");

					String query = "SELECT NAME, PHONE_NUMBER, EMAIL, ADDRESS, TOTAL_PRICE FROM checkouts";
					ps = conn.prepareStatement(query);
					rs = ps.executeQuery();

					while (rs.next()) {
						String name = rs.getString("NAME");
						String phoneNumber = rs.getString("PHONE_NUMBER");
						String email = rs.getString("EMAIL");
						String address = rs.getString("ADDRESS");
						double totalPrice = rs.getDouble("TOTAL_PRICE");
				%>
				<tr>
					<td><%=name%></td>
					<td><%=phoneNumber%></td>
					<td><%=email%></td>
					<td><%=address%></td>
					<td><%=totalPrice%></td>
					<td>
						<!-- Delete Button -->
						<form action="delete_checkout.jsp" method="post"
							style="display: inline;">
							<input type="hidden" name="phoneNumber"
								value="<%=phoneNumber%>">
							<button type="submit" class="delete-button">Delete</button>
						</form>
					</td>
				</tr>
				<%
				}
				} catch (Exception e) {
				e.printStackTrace();
				} finally {
				if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				if (ps != null)
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				}
				%>
			</tbody>
		</table>
		<a href="admin.jsp" class="action-button">Back</a>
	</div>
</body>
</html>
