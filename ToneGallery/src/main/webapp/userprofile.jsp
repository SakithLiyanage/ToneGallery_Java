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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 
     
      <!-- Icon Font Stylesheet -->
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">




</head>
<body>

<%
com.log.Login user = (com.log.Login) request.getAttribute("user");
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
                    <a class="nav-link text-white" href="#"><i class="bi bi-cart"></i> My Cart</a>
                    <a class="nav-link text-white" href="#"><i class="bi bi-pen"></i> Update Profile</a>
                    <a class="nav-link text-white" href="#"><i class="bi bi-box-arrow-left"></i> Logout</a>
                </nav>
                <div class="contact-support p-3 text-white text-center">
                    <i class="bi bi-headset"></i> Contact Support
                </div>
            </div>
            <!-- Main content -->
            <div class="col-md-9">
                <div class="header d-flex justify-content-between align-items-center p-4">
                    <h2>Welcome, Amanda</h2>
                    <div class="d-flex align-items-center">
                        <input type="search" placeholder="Search" class="form-control me-3">
                        <img src="img/avatar.jpg" alt="User Avatar" class="rounded-circle avatar-img">
                    </div>
                </div>
                <div class="profile-banner mb-4">
                    <img src="img/banner.png" alt="Profile Banner" class="img-fluid">
                </div>
                <div class="profile-form p-4">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="fullName">Full Name</label>
                            <input type="text" class="form-control" id="fullName" placeholder="Your First Name" value="<%= user.getUsername() %>">
                        </div>
                        <div class="col-md-6">
                            <label for="nickName">Nick Name</label>
                            <input type="text" class="form-control" id="nickName" placeholder="Your First Name">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="gender">Gender</label>
                            <select class="form-select" id="gender">
                                <option selected>Choose...</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label for="country">Country</label>
                            <input type="text" class="form-control" id="country" placeholder="Your First Name">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="language">Language</label>
                            <input type="text" class="form-control" id="language" placeholder="Your First Name">
                        </div>
                        <div class="col-md-6">
                            <label for="timeZone">Time Zone</label>
                            <input type="text" class="form-control" id="timeZone" placeholder="Your First Name">
                        </div>
                    </div>
                    <div class="row mb-3">
                        
                    </div>
                    <button class="btn btn-success me-2">Edit</button>
                    <button class="btn btn-danger">Delete Account</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
