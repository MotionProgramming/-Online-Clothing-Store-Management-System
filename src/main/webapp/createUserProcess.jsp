<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
String username = request.getParameter("username");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
Connection conn = null;
PreparedStatement ps = null;

try {
	// Load Oracle JDBC driver
	Class.forName("oracle.jdbc.driver.OracleDriver");

	// Establish connection
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "c##rajeeb", "rajeeb");

	// Prepare SQL query
	String sql = "INSERT INTO users (username, user_email, phone_number) VALUES (?, ?, ?)";
	ps = conn.prepareStatement(sql);

	// Set parameters
	ps.setString(1, username);
	ps.setString(2, email);
	ps.setString(3, phone);

	// Execute query
	int rowsInserted = ps.executeUpdate();
	if (rowsInserted > 0) {
		out.println("<p>User created successfully!</p>");
	} else {
		out.println("<p>Failed to create user.</p>");
	}
} catch (SQLException e) {
	e.printStackTrace();
	out.println("<p>Error: SQL Exception occurred.</p>");
} catch (ClassNotFoundException e) {
	e.printStackTrace();
	out.println("<p>Error: Database driver not found.</p>");
} catch (Exception e) {
	e.printStackTrace();
	out.println("<p>Error: " + e.getMessage() + "</p>");
} finally {
	// Close resources in finally block
	try {
		if (ps != null)
	ps.close();
		if (conn != null)
	conn.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
}
%>

<a href="admin.jsp">Back to Admin Dashboard</a>
