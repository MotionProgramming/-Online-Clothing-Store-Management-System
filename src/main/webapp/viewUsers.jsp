<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Users</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 20px;
}

h1 {
	color: #333;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

a {
	text-decoration: none;
	color: #5b5e61;
}

a:hover {
	text-decoration: underline;
}
/* Action button style */
.action-button {
	background-color: #5b5e61;
	color: white;
	padding: 10px 20px;
	text-align: center;
	border-radius: 5px;
	text-decoration: none;
	display: inline-block;
	margin-top: 20px;
}

.action-button:hover {
	background-color: #4a4e51;
}
</style>
</head>
<body>
	<h1>User List</h1>
	<table>
		<tr>
			<th>Username</th>
			<th>Phone Number</th>
			<th>Email</th>
		</tr>
		<%
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");

			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "c##rajeeb", "rajeeb");

			String query = "SELECT username, phone_number, user_email FROM users";
			ps = conn.prepareStatement(query);

			rs = ps.executeQuery();

			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("username")%></td>
			<td><%=rs.getString("phone_number")%></td>
			<td><%=rs.getString("user_email")%></td>
		</tr>
		<%
		}
		} catch (Exception e) {
		e.printStackTrace();
		out.println("<p>Error: " + e.getMessage() + "</p>");
		} finally {

		try {
		if (rs != null)
			rs.close();
		if (ps != null)
			ps.close();
		if (conn != null)
			conn.close();
		} catch (SQLException e) {
		e.printStackTrace();
		}
		}
		%>
	</table>
	<br>

	<a href="admin.jsp" class="action-button">Back</a>
</body>
</html>
