<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Checkout</title>
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
            max-width: 600px;
        }
        h1 {
            color: #333;
            text-align: center;
            font-size: 2.5em;
            margin-bottom: 20px;
        }
        p {
            font-size: 1.2em;
            text-align: center;
        }
        a {
            display: block;
            text-align: center;
            text-decoration: none;
            color: #5b5e61;
            font-size: 1.1em;
        }
        a:hover {
            color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Delete Checkout Data</h1>
        <%
            String phoneNumber = request.getParameter("phoneNumber");
            if (phoneNumber != null) {
                Connection conn = null;
                PreparedStatement ps = null;

                try {
                    // Database connection
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "c##rajeeb", "rajeeb");

                    String deleteSql = "DELETE FROM checkouts WHERE PHONE_NUMBER = ?";
                    ps = conn.prepareStatement(deleteSql);
                    ps.setString(1, phoneNumber);

                    int deleted = ps.executeUpdate();

                    if (deleted > 0) {
        %>
                        <p>Checkout data deleted successfully!</p>
                        <a href="viewCheckouts.jsp">Back</a>
        <%
                    } else {
        %>
                        <p>No checkout data found for this phone number.</p>
                        <a href="viewCheckouts.jsp">Back</a>
        <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            } else {
        %>
                <p>No phone number provided.</p>
                <a href="viewCheckouts.jsp">Back</a>
        <%
            }
        %>
    </div>
    
</body>
</html>
