<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobile = request.getParameter("mobile");
String password = request.getParameter("password");

Connection connection = null;
PreparedStatement preparedStatement = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "21532153");
    preparedStatement = connection.prepareStatement("INSERT INTO user (name,email,mobile,password) VALUES (?,?,?,?)");

    preparedStatement.setString(1, name);
    preparedStatement.setString(2, email);
    preparedStatement.setString(3, mobile);
    preparedStatement.setString(4, password);

    int rowsAffected = preparedStatement.executeUpdate();

    if (rowsAffected > 0) {
    	 response.sendRedirect("loginform.html");
    } else {
        out.println("Registration failed!");
    }
    connection.close();
    preparedStatement.close();
} catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
}
%>

</body>
</html>
