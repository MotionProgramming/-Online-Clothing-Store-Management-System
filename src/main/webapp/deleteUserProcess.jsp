<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String phoneNumber = request.getParameter("phone_number");

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        // Load database driver and establish connection
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "c##rajeeb", "rajeeb");

        // Prepare the DELETE SQL query
        String query = "DELETE FROM users WHERE phone_number = ?";
        ps = conn.prepareStatement(query);
        ps.setString(1, phoneNumber);

        // Execute the deletion query
        int rowsAffected = ps.executeUpdate();
        if (rowsAffected > 0) {
            out.println("<p>User with phone number '" + phoneNumber + "' has been successfully deleted!</p>");
        } else {
            out.println("<p>No user found with the given phone number. Deletion failed.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        try {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<br>
<br>
    <a href="deleteUser.jsp">Delete again</a>
    <br><br>
    <a href="admin.jsp">Back</a>
