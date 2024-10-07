<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.cart.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Message</title>

    <!-- CSS for modern design -->
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        p {
            color: #555;
            margin-bottom: 20px;
        }

        .loader {
            border: 8px solid #f3f3f3; /* Light grey */
            border-top: 8px solid #3498db; /* Blue */
            border-radius: 50%;
            width: 50px;
            height: 50px;
            animation: spin 1s linear infinite;
            margin: 20px auto;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>

<%
    String messageId = request.getParameter("id");
    Connection conn = null;
    PreparedStatement stmt = null;
    
    try {
        conn = DatabaseConnection.getConnection();
        String sql = "DELETE FROM messages WHERE id=?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, Integer.parseInt(messageId));
        stmt.executeUpdate();
        
        // Displaying a message while redirecting
%>
    <div class="container">
        <h2>Message Deleted</h2>
        <p>The message has been successfully deleted.</p>
        <div class="loader"></div>
    </div>
<%
        // Redirect after a short delay to allow the user to see the success message
        response.setHeader("Refresh", "2; URL=contact.jsp");  // Redirect to the contact page after 2 seconds
    } catch (SQLException e) {
        e.printStackTrace();
%>
    <div class="container">
        <h2>Error Occurred</h2>
        <p>There was an error deleting the message. Please try again later.</p>
    </div>
<%
    } finally {
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>

</body>
</html>
