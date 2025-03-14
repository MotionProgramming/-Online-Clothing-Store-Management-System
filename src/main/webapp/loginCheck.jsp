<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Status</title>
</head>
<body>
	<%
	String number = request.getParameter("number");
	String email = request.getParameter("email");

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");

		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "c##rajeeb", "rajeeb");

		String sql = "SELECT * FROM users WHERE phone_number = ? AND user_email = ?";

		ps = conn.prepareStatement(sql);
		ps.setString(1, number); // Bind phone number
		ps.setString(2, email); // Bind email

		rs = ps.executeQuery();

		// Check if a matching user is found
		if (rs.next()) {
			// Login Successful - Redirect to index.jsp
			response.sendRedirect("index.jsp");
		} else {

			out.println("<p style='color: red;'>Invalid credentials! Please try again.</p>");
			out.println("<a href='login.jsp'>Go Back</a>");
		}
	} catch (Exception e) {

		e.printStackTrace();
		out.println("<p style='color: red;'>Error: " + e.getMessage() + "</p>");
	} finally {
		if (rs != null)
			rs.close();
		if (ps != null)
			ps.close();
		if (conn != null)
			conn.close();
	}
	%>
</body>
</html>
