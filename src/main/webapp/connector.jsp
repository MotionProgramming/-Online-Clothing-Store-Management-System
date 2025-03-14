<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
</head>
<body>
	<%
	// Retrieve parameters from the form
	String username = request.getParameter("username");
	String number = request.getParameter("number");
	String email = request.getParameter("email");

	// Database connection variables
	Connection conn = null;
	PreparedStatement ps = null;

	try {
		// Load Oracle JDBC Driver
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "c##rajeeb", "rajeeb");

		String sqlStatement = "INSERT INTO users(username, phone_number, user_email) VALUES(?,?,?)";
		ps = conn.prepareStatement(sqlStatement);

		ps.setString(1, username);
		ps.setString(2, number);
		ps.setString(3, email);

		int rowsInserted = ps.executeUpdate();
		if (rowsInserted > 0) {
			// Redirect to login page after successful registration
			response.sendRedirect("login.jsp");
		}
	} catch (Exception e) {
		e.printStackTrace();
		response.sendRedirect("connector.jsp?error=" + e.getMessage());
	} finally {
		if (ps != null)
			ps.close();
		if (conn != null)
			conn.close();
	}
	%>

</body>
</html>
