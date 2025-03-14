<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// Invalidate the session to log out the user
session.invalidate(); // Clears all session data
response.sendRedirect("login.jsp"); // Redirect to the login page
%>
