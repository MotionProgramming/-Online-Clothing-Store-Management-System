<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirmation</title>
</head>
<body>
	<%
	// Retrieve parameters from the form
	String name = request.getParameter("name");
	String number = request.getParameter("number");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	String totalPrice = request.getParameter("totalPrice");

	// Check if any parameter is null or empty
	if (number == null || number.trim().isEmpty()) {
	%>
	<h1>Purchase failed: Phone number is required.</h1>
	<%
	return;
	}

	// Database connection variables
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	try {
	// Load Oracle JDBC Driver
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "c##rajeeb", "rajeeb");

	// Check if the phone number exists in the Users table
	String checkNumberSql = "SELECT USERNAME, USER_EMAIL FROM Users WHERE PHONE_NUMBER = ?";
	ps = conn.prepareStatement(checkNumberSql);
	ps.setString(1, number);
	rs = ps.executeQuery();

	if (!rs.next()) { // If no record is found
	%>
	<h1>Purchase failed: This phone number is not registered.</h1>
	<%
	} else {
	// Retrieve user details from Users table (if phone number is registered)
	String userName = rs.getString("USERNAME");
	String userEmail = rs.getString("USER_EMAIL");

	// Insert purchase details into Checkouts table
	String insertSql = "INSERT INTO Checkouts (NAME, PHONE_NUMBER, EMAIL, ADDRESS, TOTAL_PRICE) VALUES (?, ?, ?, ?, ?)";
	ps = conn.prepareStatement(insertSql);
	ps.setString(1, userName); // Use the registered user name
	ps.setString(2, number);
	ps.setString(3, userEmail); // Use the registered user email
	ps.setString(4, address);
	ps.setString(5, totalPrice);

	int result = ps.executeUpdate();

	if (result > 0) {
	%>
	<h1>Purchase Successful</h1>
	<p>
		Thank you for your purchase,
		<%=userName%>!
	</p>
	<p>
		Your total is <strong><%=String.format("%.2f", Double.parseDouble(totalPrice))%>
			&#2547;</strong>
	</p>
	<%
	} else {
	%>
	<h1>Purchase failed: Unable to save data.</h1>
	<%
	}
	}
	} catch (Exception e) {
	out.println("<h1>Error occurred: " + e.getMessage() + "</h1>");
	e.printStackTrace();
	} finally {
	// Close resources
	try {
	if (rs != null)
	rs.close();
	} catch (SQLException e) {
	e.printStackTrace();
	}
	try {
	if (ps != null)
	ps.close();
	} catch (SQLException e) {
	e.printStackTrace();
	}
	try {
	if (conn != null)
	conn.close();
	} catch (SQLException e) {
	e.printStackTrace();
	}
	}
	%>
	<a href="index.jsp" class="action-button">Back</a>
</body>
</html>
