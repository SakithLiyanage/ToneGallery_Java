<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Message Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
</head>
<body class="bg-light">

<%@ page import="java.sql.*" %>
<%
    String messageId = request.getAttribute("messageId").toString();
    String name = request.getAttribute("name").toString();
    String email = request.getAttribute("email").toString();
    String message = request.getAttribute("message").toString();
%>

<!-- Main container -->
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <!-- Card for message details -->
            <div class="card shadow-lg">
                <div class="card-header bg-primary text-white">
                    <h3 class="mb-0">Message Sent Successfully</h3>
                </div>
                <div class="card-body">
                    <p><strong>Name:</strong> <%= name %></p>
                    <p><strong>Email:</strong> <%= email %></p>
                    <p><strong>Message:</strong> <%= message %></p>
                </div>
                <div class="card-footer text-center">
                    <!-- Edit and Delete buttons -->
                    <a href="edit-message.jsp?id=<%= messageId %>" class="btn btn-warning me-3">
                        <i class="fas fa-edit"></i> Edit
                    </a>
                    <a href="delete-message.jsp?id=<%= messageId %>" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this message?');">
                        <i class="fas fa-trash-alt"></i> Delete
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Back to Top Button -->
<a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top position-fixed" style="bottom: 30px; right: 30px;">
    <i class="fa fa-arrow-up"></i>
</a>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
