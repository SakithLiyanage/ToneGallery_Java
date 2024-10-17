<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.log.Login" %> 

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Tone Gallery | Feedbacks</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <link rel="icon" type="image/x-icon" href="images/favicon.png">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>

    <!-- Spinner Start -->
    <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->

     <!-- Navbar start -->
        <div class="container-fluid fixed-top">
            <div class="container topbar bg-primary d-none d-lg-block">
                <div class="d-flex justify-content-between">
                    <div class="top-info ps-2">
                        <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#" class="text-white">ToneGallery</a></small>
                        <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#" class="text-white">customersupport@tonegallery.com</a></small>
                    </div>
                    <div class="top-link pe-2">
                        
                    </div>
                </div>
            </div>
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="index.html" class="navbar-brand"><h1 class="text-primary display-6"><img src="img/logopng2.png"width="50%"></h1></a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                        <div class="navbar-nav mx-auto">
                            <a href="index.jsp" class="nav-item nav-link">Home</a>
                            <a href="shop.jsp" class="nav-item nav-link">Shop</a>
                            
                            <a href="contact.jsp" class="nav-item nav-link">Contact</a>
                            <a href="feedback.jsp" class="nav-item nav-link active">Feedback</a>
                            <% 
                        // Check if the user is logged in
                        Login user = (Login) session.getAttribute("user"); 
                        if (user == null) { %>
                            <a href="log.jsp" class="nav-item nav-link active">
                                <button style="border-radius: 20px; padding: 5px 5px; width: 100px; border: 0px;">Log In</button>
                            </a>
                            <a href="log.jsp" class="nav-item nav-link active">
                                <button style="border-radius: 20px; padding: 5px 5px; width: 100px; border: 0px;">Sign Up</button>
                            </a>
                        <% } else { %>
                            <span class="nav-item nav-link">Welcome, <%= user.getUsername() %>!</span>
                            <a href="logout" class="nav-item nav-link active">
                                <button style="border-radius: 20px; padding: 5px 5px; width: 100px; border: 0px;">Logout</button>
                            </a>
                        <% } %>
                        </div>
                        <div class="d-flex m-3 me-0">
                            
                            
                            <a href="userprofile.jsp" class="my-auto">
                                <i class="fas fa-user fa-2x"></i>
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->


    <!-- Single Page Header Start -->
    <div class="container-fluid page-header py-5">
        <h1 class="text-center text-white display-6">Feedbacks</h1>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
            <li class="breadcrumb-item active text-white">Feedbacks</li>
        </ol>
    </div>
    <!-- Single Page Header End -->

    <!-- Feedback Display Section Start -->
    <div class="container-fluid testimonial py-5">
        <div class="container py-5">
            <div class="testimonial-header text-center">
                <h4 class="text-primary">Our Feedbacks</h4>
                <h1 class="display-5 mb-5 text-dark">Our Client Saying!</h1>
            </div>
            <div class="owl-carousel testimonial-carousel">

                <!-- Retrieve Feedbacks from Database -->
                <%
                 com.feedbacks.Feedback feed = (com.feedbacks.Feedback) request.getAttribute("feedback");
                    Connection conn = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tonegallery", "root", "1234");
                        ps = conn.prepareStatement("SELECT * FROM feedbacks");
                        rs = ps.executeQuery();
                        while (rs.next()) {
                            String clientName = rs.getString("name");
                            String email = rs.getString("email");
                            String feedback = rs.getString("feedback");
                            int rating = rs.getInt("rating");
                %>
                <div class="testimonial-item img-border-radius bg-light rounded p-4">
                    <div class="position-relative">
                        <i class="fa fa-quote-right fa-2x text-secondary position-absolute" style="bottom: 30px; right: 0;"></i>
                        <div class="mb-4 pb-4 border-bottom border-secondary">
                            <p class="mb-0"><%= feedback %></p>
                        </div>
                        <div class="d-flex align-items-center flex-nowrap">
                            <div class="bg-secondary rounded">
                                <img src="img/avatar.jpg" class="img-fluid rounded" style="width: 100px; height: 100px;" alt="">
                            </div>
                            <div class="ms-4 d-block">
                                <h4 class="text-dark"><%= clientName %></h4>
                                
                                <div class="d-flex pe-5">
                                    <% for (int i = 1; i <= rating; i++) { %>
                                        <i class="fas fa-star text-primary"></i>
                                    <% } %>
                                    <% for (int i = rating + 1; i <= 5; i++) { %>
                                        <i class="fas fa-star"></i>
                                    <% } %>
                                </div><br>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <% } } catch (Exception e) { e.printStackTrace(); } finally { if (conn != null) conn.close(); } %>
            </div>
        </div>
    </div>
    <!-- Feedback Display Section End -->

    <!-- Add New Feedback Section Start -->
    <div class="testimonial-header text-center">
        <h4 class="text-primary">Share your thoughts with us! We appreciate your feedbacks..
</h4>
        <h1 class="display-5 mb-5 text-dark">Add New Feedback</h1>
    </div>
    <div class="container" style="padding: 0 15%;">
        <form name="feedbackForm" action="FeedbackServlet" method="POST" onsubmit="return validateForm()">
            <h4 class="mb-5 fw-bold">Add Feedback</h4>
            <div class="row g-4">
                <div class="col-lg-6">
                    <div class="border-bottom rounded">
                        <input type="text" name="name" class="form-control border-0 me-4" placeholder="Your Name *" >
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="border-bottom rounded">
                        <input type="email" name="email" class="form-control border-0" placeholder="Your Email *" >
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="border-bottom rounded">
                        <input type="text" name="profession" class="form-control border-0" placeholder="Your Profession *" >
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="border-bottom rounded">
                        <select name="rating" class="form-control border-0">
                            <option value="5">5 Stars</option>
                            <option value="4">4 Stars</option>
                            <option value="3">3 Stars</option>
                            <option value="2">2 Stars</option>
                            <option value="1">1 Star</option>
                        </select>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="border-bottom rounded">
                        <textarea name="feedback" class="form-control border-0" rows="4" placeholder="Your Feedback *" ></textarea>
                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-secondary mt-4">Submit Feedback</button>
        </form>
    </div>
    <!-- Add New Feedback Section End -->
 <script>
    function validateForm() {
        var name = document.forms["feedbackForm"]["name"].value;
        var email = document.forms["feedbackForm"]["email"].value;
        var profession = document.forms["feedbackForm"]["profession"].value;
        var feedback = document.forms["feedbackForm"]["feedback"].value;
        var rating = document.forms["feedbackForm"]["rating"].value;

        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        if (name == "" || email == "" || profession == "" || feedback == "") {
            alert("All fields must be filled out");
            return false;
        }

        if (!emailPattern.test(email)) {
            alert("Invalid email format");
            return false;
        }

        if (rating < 1 || rating > 5) {
            alert("Please select a valid rating between 1 and 5");
            return false;
        }

        return true;
    }
</script>
    

    <!-- Footer Start -->
        <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5">
            <div class="container py-5">
                <div class="pb-4 mb-4" style="border-bottom: 1px solid rgba(226, 175, 24, 0.5) ;">
                    <div class="row g-4">
                        <div class="col-lg-3">
                            <a href="#">
                                <h1 class="text-primary mb-0">ToneGallery</h1>
                                <p class="text-secondary mb-0">Your one-stop destination for all things musical</p>
                            </a>
                        </div>
                        <div class="col-lg-6">
                            
                        </div>
                        <div class="col-lg-3">
                            <div class="d-flex justify-content-end pt-3">
                                <a class="btn  btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-youtube"></i></a>
                                <a class="btn btn-outline-secondary btn-md-square rounded-circle" href=""><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-item">
                            <h4 class="text-light mb-3">Why People Like us!</h4>
                            <p class="mb-4">People love ToneGallery for quality instruments, personalized service, and a passionate community of musicians.</p>
                            
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="d-flex flex-column text-start footer-item">
                            <h4 class="text-light mb-3">Shop Info</h4>
                            <a class="btn-link" href="index.jsp">Home</a>
                            <a class="btn-link" href="contact.jsp">Contact Us</a>
                            
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="d-flex flex-column text-start footer-item">
                            <h4 class="text-light mb-3">Account</h4>
                            <a class="btn-link" href="userprofile.jsp">My Account</a>
                            <a class="btn-link" href="shop.jsp">Shop details</a>
                            <a class="btn-link" href="cart.jsp">Shopping Cart</a>
                            
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-item">
                            <h4 class="text-light mb-3">Contact</h4>
                            <p>Address: Tonegallery</p>
                            <p>Email: customersupport@tonegallery.com</p>
                            <p>Phone: +94 76 909 2755</p>
                            <p>Payment Accepted</p>
                            <img src="img/payment.png" class="img-fluid" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->
        
        <!-- Copyright Start -->
        <div class="container-fluid copyright bg-dark py-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        <span class="text-light"><a href="#"><i class="fas fa-copyright text-light me-2"></i>tonegallery.com</a>, All right reserved.</span>
                    </div>
                    <div class="col-md-6 my-auto text-center text-md-end text-white">
                        
                        Designed By ToneGallery</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Copyright End -->

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="fas fa-angle-double-up"></i></a>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>
