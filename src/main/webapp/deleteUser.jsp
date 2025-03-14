<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete User</title>
</head>
<body>
    <h2>Delete User</h2>
    <form action="deleteUserProcess.jsp" method="post">
        <label for="phone_number">Enter Phone Number to Delete:</label>
        <input type="text" id="phone_number" name="phone_number" required>
        <button type="submit">Delete User</button>
    </form>
    <br>
    <a href="deleteUser.jsp">Delete again</a>
    <br><br>
    <a href="admin.jsp">Back</a>
</body>
</html>
