<%@ page import="com.products.Product" %>
<%@ page import="com.products.ViewShopProductsDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.log.Login" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Tone Gallery | Shop</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

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
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
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
                            <a href="shop.jsp" class="nav-item nav-link active">Shop</a>
                            
                            <a href="contact.jsp" class="nav-item nav-link">Contact</a>
                            <a href="feedback.jsp" class="nav-item nav-link">Feedback</a>
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
        <h1 class="text-center text-white display-6">Shop</h1>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
            <li class="breadcrumb-item active text-white">Shop</li>
        </ol>
    </div>
    <!-- Single Page Header End -->

    <!-- Products Display Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <h1 class="mb-4">Musical Instruments</h1>
            <div class="row g-4">
                <div class="col-lg-12">
                    <div class="row g-4 justify-content-center">

                        <%
                            // Retrieve products from the database
                            ViewShopProductsDAO productDAO = new ViewShopProductsDAO();
                            List<Product> productList = productDAO.getAllProducts();

                            for (Product product : productList) {
                        %>
                        <div class="col-md-6 col-lg-6 col-xl-4">
    <div class="rounded position-relative fruite-item">
        <a href="product.jsp?productID=<%= product.getProductID() %>">
            <div class="fruite-img hover-zoom">
                <img src="<%= request.getContextPath()+ "/"%><%= product.getImage_path() %>" class="img-fluid w-100 rounded-top" alt="<%= product.getName() %>">
            </div>
        
        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">
            <%= product.getCategory() %>
        </div>
        <div class="p-4 border border-secondary border-top-0 rounded-bottom">
            <div class="d-flex justify-content-between flex-lg-wrap">
                <h1 class="text-dark fs-5 fw-bold mb-0"><%= product.getName() %></h1>
                <p class="text-dark fs-5 fw-bold mb-0">LKR <%= product.getPrice() %></p></a>
                <a href="product.jsp?productID=<%= product.getProductID() %>" class="btn border border-secondary rounded-pill px-3 text-primary">
                    <i class="fa fa-eye me-2 text-primary" style="margin-top:10px"></i> View
                </a>
            </div>
        </div>
    </div>
</div>
                        <%
                            }
                        %>
<style>

.hover-zoom img {
    transition: transform 0.5s ease;
}

.hover-zoom:hover img {
    transform: scale(1.05); 
}
</style>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Products Display End -->

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
    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   

    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>
</html>
