<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Scanner" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%  String name = request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/contact ", "root", "21532153");
        preparedStatement = connection.prepareStatement("INSERT INTO contact  (name,email,message) VALUES (?,?,?)");
          
        preparedStatement.setString(1, name);
        preparedStatement.setString(2, email);
        preparedStatement.setString(3, message);

        int rowsAffected = preparedStatement.executeUpdate();

        if (rowsAffected > 0) {
            out.println("Registration successful!");
        } else {
            out.println("Registration failed!");
        }
        connection.close();
        preparedStatement.close();
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    
    }
%>
<jsp:forward page="index.html"/>
</body>
</html>
