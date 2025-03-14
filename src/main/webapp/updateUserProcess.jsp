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
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "c##rajeeb", "rajeeb");

	// Update the query to allow updating username, email, and phone number
	String query = "UPDATE users SET user_email = ?, phone_number = ? WHERE username = ?";
	ps = conn.prepareStatement(query);
	ps.setString(1, email);
	ps.setString(2, phone);
	ps.setString(3, username);

	int rowsUpdated = ps.executeUpdate();
	if (rowsUpdated > 0) {
		out.println("<p>User details updated successfully!</p>");
	} else {
		out.println("<p>Failed to update user. User not found.</p>");
	}
} catch (Exception e) {
	e.printStackTrace();
	out.println("<p>Error: " + e.getMessage() + "</p>");
} finally {
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
<a href="admin.jsp" class="action-button">Back</a>
