<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<script>
    // Function to display an alert message
    function showAlert(message) {
        alert(message);
        window.location.href = "loginform.html"; // Redirect to the login form
    }
</script>
</head>
<body>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");

Connection connection = null;
PreparedStatement preparedStatement = null;
ResultSet resultSet = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "21532153");
    preparedStatement = connection.prepareStatement("SELECT * FROM user WHERE email = ? AND password = ?");
    preparedStatement.setString(1, email);
    preparedStatement.setString(2, password);
    resultSet = preparedStatement.executeQuery();

    if (resultSet.next()) {
        // Successful login, redirect to index page
        response.sendRedirect("index.html");
    } else {
    	
    	 out.println("<script>showAlert('Login failed! Please check your credentials.');</script>");
    }
    

    resultSet.close();
    preparedStatement.close();
    connection.close();
} catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
}
%>
</body>
</html>
