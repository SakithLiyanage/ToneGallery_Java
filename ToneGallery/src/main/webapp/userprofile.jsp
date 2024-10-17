<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tone Gallery | User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/userprofile.css">
    <!-- Google Web Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 
     
    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    
    <script>
        function validateForm() {
            const username = document.getElementById('fullName').value.trim();
            const email = document.getElementById('email').value.trim();
            const password = document.getElementById('password').value.trim();

            let isValid = true;
            let errorMessage = "";

            // Validate full name
            if (username === "") {
                errorMessage += "Full Name is required.\n";
                isValid = false;
            }

            // Validate email
            const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
            if (email === "") {
                errorMessage += "Email is required.\n";
                isValid = false;
            } else if (!email.match(emailPattern)) {
                errorMessage += "Please enter a valid email address.\n";
                isValid = false;
            }

            // Validate password
            if (password.length > 0 && password.length < 6) {
                errorMessage += "Password must be at least 6 characters long.\n";
                isValid = false;
            }

            if (!isValid) {
                alert(errorMessage);
            }

            return isValid;
        }
    </script>
</head>
<body>

<%
com.log.Login user = (com.log.Login) session.getAttribute("user"); 
if (user == null) {
    // If user is not logged in, redirect to the login page
    response.sendRedirect("log.jsp");
    return; 
}
%>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 sidebar bg-success">
                <div class="profile-info p-4 text-center">
                    <img src="img/avatar.jpg" alt="User Profile" class="rounded-circle profile-img">
                    <h4><%= user.getUsername() %></h4>
                    <p>User Profile</p>
                </div>
                <nav class="nav flex-column p-2">
                    <a class="nav-link text-white" href="#"><i class="bi bi-house"></i> Dashboard</a>
                    <a class="nav-link text-white" href="#"><i class="bi bi-pen"></i> Update Profile</a>
                    <a class="nav-link text-white" href="logout"><i class="bi bi-box-arrow-left"></i> Logout</a>
                </nav>
                <div class="contact-support p-3 text-white text-center">
                    <i class="bi bi-headset"></i> Contact Support
                </div>
            </div>
            <!-- Main content -->
            <div class="col-md-9">
                <div class="header d-flex justify-content-between align-items-center p-4">
                    <h2>Welcome, <%= user.getUsername() %></h2>
                    <div class="d-flex align-items-center">
                        <img src="img/avatar.jpg" alt="User Avatar" class="rounded-circle avatar-img">
                    </div>
                </div>
                <div class="profile-banner mb-4">
                    <img src="img/banner.png" alt="Profile Banner" class="img-fluid">
                </div>
                <div class="profile-form p-4">
                    <!-- Update Profile Form -->
                    <form action="UpdateProfileServlet" method="post" onsubmit="return validateForm();">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="fullName">Full Name</label>
                                <input type="text" class="form-control" id="fullName" name="username" value="<%= user.getUsername() %>">
                            </div>
                            <div class="col-md-6">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" id="email" name="email" value="<%= user.getEmail() %>">
                            </div>
                        </div>
                        <div class="row mb-3">
                        	<div class="col-md-6">
                                <label for="cPass">Current Password</label>
                                <input type="text" disabled class="form-control" id="cpass" name="cpass" value="<%= user.getPassword() %>">
                            </div>
                            <div class="col-md-6">
                                <label for="password">New Password</label>
                                <input type="password" class="form-control" id="password" name="password" value="">
                            </div>
                            
                        </div>
                        <button type="submit" class="btn btn-success me-2">Update</button>
                    </form>

                    <!-- Delete Account Button -->
                    <form action="DeleteAccountServlet" method="post">
                        <button type="submit" class="btn btn-danger mt-3">Delete Account</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
