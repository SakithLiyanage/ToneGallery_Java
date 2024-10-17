<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.products.Product" %>
<%@ page import="com.products.ViewShopProductsDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.log.Login" %> 
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Tone Gallery | Home</title>
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
                            <a href="index.jsp" class="nav-item nav-link active">Home</a>
                            <a href="shop.jsp" class="nav-item nav-link">Shop</a>
                            
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



        <!-- Hero Start -->
        <div class="container-fluid py-5 mb-5 hero-header">
            <div class="container py-5">
                <div class="row g-5 align-items-center">
                    <div class="col-md-12 col-lg-7">
                        <h4 class="mb-3 text-secondary">Your one-stop destination for all things musical </h4>
                        <h1 class="mb-5 display-3 text-primary">Welcome to Tone Gallery</h1>
                        
                    </div>
                    <div class="col-md-12 col-lg-5">
                        <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active rounded">
                                    <img src="img/img4.png" class="img-fluid w-100 h-100  rounded" alt="First slide">
                                    
                                </div>
                                <div class="carousel-item rounded">
                                    <img src="img/img5.png" class="img-fluid w-100 h-100 rounded" alt="Second slide">
                                    
                                </div>
                                <div class="carousel-item rounded">
                                    <img src="img/img6.png" class="img-fluid w-100 h-100 rounded" alt="First slide">
                                    
                                </div>
                                <div class="carousel-item rounded">
                                    <img src="img/img7.png" class="img-fluid w-100 h-100 rounded" alt="Second slide">
                                    
                                </div>
                                
                                <div class="carousel-item rounded">
                                    <img src="img/img5.png" class="img-fluid w-100 h-100 rounded" alt="Second slide">
                                    
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->


        <!-- Featurs Section Start -->
        <div class="container-fluid featurs py-5">
            <div class="container py-5">
                <div class="row g-4">
                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                <i class="fas fa-car-side fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>Free Shipping</h5>
                                <p class="mb-0">Free on order over 50,000 LKR</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                <i class="fas fa-user-shield fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>Security Payment</h5>
                                <p class="mb-0">100% security payment</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                <i class="fas fa-exchange-alt fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>30 Day Return</h5>
                                <p class="mb-0">30 day money guarantee</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                <i class="fa fa-phone-alt fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>24/7 Support</h5>
                                <p class="mb-0">Support every time fast</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Featurs Section End -->


        <!-- Shop Start-->
       <div class="container-fluid py-5 categories">
    <div class="container py-5">
        <div class="text-center mb-4">
            <h1 class="fw-bold">Our Categories</h1>
        </div>
        <div class="tab-content">
            <div id="tab-1" class="tab-pane fade show active">
                <div class="row g-4">
                    <div class="col-md-6 col-lg-4">
                        <div class="rounded position-relative category-item">
                            <div class="category-img">
                                <img src="img/guitar.jpg" class="img-fluid w-100 rounded-top" alt="Guitar">
                                <div class="category-label">Guitar</div>
                            </div>
                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                <h4 class="text-dark fw-bold">Guitar</h4>
                                <p>Sleek design, rich tone, versatile, durable, lightweight, ergonomic, comfortable, professional.</p>
                                <a href="shop.jsp" class="btn btn-outline-secondary rounded-pill"><i class="fa fa-shopping-bag me-2"></i> Shop Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <div class="rounded position-relative category-item">
                            <div class="category-img">
                                <img src="img/drums.jpg" class="img-fluid w-100 rounded-top" alt="Drums">
                                <div class="category-label">Drums & Percussion</div>
                            </div>
                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                <h4 class="text-dark fw-bold">Drums</h4>
                                <p>Powerful sound, durable, versatile, rhythmic, responsive, ergonomic, dynamic, balanced, comfortable, professional.</p>
                                <a href="shop.jsp" class="btn btn-outline-secondary rounded-pill"><i class="fa fa-shopping-bag me-2"></i> Shop Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <div class="rounded position-relative category-item">
                            <div class="category-img">
                                <img src="img/piano.avif" class="img-fluid w-100 rounded-top" alt="Keyboards & Synth">
                                <div class="category-label">Keyboards & Synth</div>
                            </div>
                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                <h4 class="text-dark fw-bold">Keyboards & Synth</h4>
                                <p>Expressive, versatile, innovative, dynamic, responsive, sleek, portable, professional, customizable, intuitive.</p>
                                <a href="shop.jsp" class="btn btn-outline-secondary rounded-pill"><i class="fa fa-shopping-bag me-2"></i> Shop Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <div class="rounded position-relative category-item">
                            <div class="category-img">
                                <img src="https://img.freepik.com/premium-vector/live-sound-neon-sign-electric-guitar-brick-wall-background_1262-10919.jpg" class="img-fluid w-100 rounded-top" alt="Keyboards & Synth">
                                <div class="category-label">Live Sound & Light</div>
                            </div>
                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                <h4 class="text-dark fw-bold">Live Sound & Light</h4>
                                <p>Powerful, immersive, dynamic, versatile, crisp, reliable, bright, responsive, professional, vibrant.</p>
                                <a href="shop.jsp" class="btn btn-outline-secondary rounded-pill"><i class="fa fa-shopping-bag me-2"></i> Shop Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <div class="rounded position-relative category-item">
                            <div class="category-img">
                                <img src="https://img.freepik.com/premium-photo/audio-recording-studio-with-professional-audio-equipment-closeup-view-shot-modern-music-record-studio-control-desk-with-computer-screen-show-user-interface-daw-software-ai-generated_538213-7605.jpg" class="img-fluid w-100 rounded-top" alt="Keyboards & Synth">
                                <div class="category-label">Studio & Recordings</div>
                            </div>
                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                <h4 class="text-dark fw-bold">Studio & Recordings</h4>
                                <p>High-quality, precise, professional, versatile, detailed, reliable, innovative, immersive, crisp, durable.</p>
                                <a href="shop.jsp" class="btn btn-outline-secondary rounded-pill"><i class="fa fa-shopping-bag me-2"></i> Shop Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <div class="rounded position-relative category-item">
                            <div class="category-img">
                                <img src="img/violine.JPG" class="img-fluid w-100 rounded-top" alt="Violine">
                                <div class="category-label">Strings</div>
                            </div>
                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                <h4 class="text-dark fw-bold">Strings</h4>
                                <p>Warm tone, resonant, durable, versatile, expressive, smooth, responsive, balanced, ergonomic, rich.</p>
                                <a href="shop.jsp" class="btn btn-outline-secondary rounded-pill"><i class="fa fa-shopping-bag me-2"></i> Shop Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
.categories {
    background-color: #f8f9fa; 
}

.category-item {
    overflow: hidden; 
    transition: transform 0.3s ease; 
    height: 500px; 
}

.category-item:hover {
    transform: scale(1.05); 
}

.category-img {
    position: relative; 
    height: 250px; 
    overflow: hidden; 
}

.category-img img {
    width: 100%;
    height: 100%; 
    object-fit: cover; 

.category-label {
    position: absolute;
    top: 15px;
    left: 15px;
    background-color: rgba(0, 0, 0, 0.7); 
    color: white;
    padding: 5px 10px;
    border-radius: 5px;
    font-weight: bold;
    transition: opacity 0.3s ease;
}

.category-item:hover .category-label {
    opacity: 0.9; 
}

.btn-outline-primary {
    border-color: #007bff; 
    color: #007bff; 
}

.btn-outline-primary:hover {
    background-color: #007bff; 
    color: white; 
}

</style>
                        


        <!-- Disocunts Start -->
        <div class="container-fluid service py-5">
            <div class="container py-5">
                <div class="row g-4 justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        
                            <div class="service-item bg-secondary rounded border border-secondary">
                                <img src="img/discount1.jpg" class="img-fluid rounded-top w-100" alt="">
                                <div class="px-4 rounded-bottom">
                                    <div class="service-content bg-primary text-center p-4 rounded">
                                        <h5 class="text-white">Discount</h5>
                                        <h3 class="mb-0">30% OFF</h3>
                                    </div>
                                </div>
                            </div>
                        
                    </div>
                    <div class="col-md-6 col-lg-4">
                        
                            <div class="service-item bg-dark rounded border border-dark">
                                <img src="img/discount.png" class="img-fluid rounded-top w-100" alt="">
                                <div class="px-4 rounded-bottom">
                                    <div class="service-content bg-light text-center p-4 rounded">
                                        <h5 class="text-primary">Flash sale</h5>
                                        <h3 class="mb-0">Free delivery</h3>
                                    </div>
                                </div>
                            </div>
                        
                    </div>
                    <div class="col-md-6 col-lg-4">
                        
                            <div class="service-item bg-primary rounded border border-primary">
                                <img src="img/friday.jpg" class="img-fluid rounded-top w-100" alt="">
                                <div class="px-4 rounded-bottom">
                                    <div class="service-content bg-secondary text-center p-4 rounded">
                                        <h5 class="text-white">Black Friday</h5>
                                        <h3 class="mb-0">Save up to 30%</h3>
                                    </div>
                                </div>
                            </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Discounts End -->

<!-- featured Shop Start-->
<div class="container-fluid py-5">
    <div class="container py-5">
        <h1 class="mb-4">Featured Products</h1>
        <div class="row g-4">
            <div class="col-lg-12">
                <div class="row g-4 justify-content-center">

                    <%
                        // Retrieve products from the database
                        ViewShopProductsDAO productDAO = new ViewShopProductsDAO();
                        List<Product> productList = productDAO.getAllProducts();

                        // Limit to first 4 products
                        int productCount = Math.min(productList.size(), 3); // Ensuring not to exceed available products
                        for (int i = 0; i < productCount; i++) {
                            Product product = productList.get(i);
                    %>
                    <div class="col-md-6 col-lg-6 col-xl-4">
                        <div class="rounded position-relative fruite-item">
                            <a href="product.jsp?productID=<%= product.getProductID() %>">
                                <div class="fruite-img hover-zoom">
                                    <img src="<%= request.getContextPath() + "/" %><%= product.getImage_path() %>" class="img-fluid w-100 rounded-top" alt="<%= product.getName() %>">
                                </div>
                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">
                                    <%= product.getCategory() %>
                                </div>
                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                        <h1 class="text-dark fs-5 fw-bold mb-0"><%= product.getName() %></h1>
                                        <p class="text-dark fs-5 fw-bold mb-0">LKR <%= product.getPrice() %></p>
                                    </a>
                                    <a href="shop.jsp" class="btn border border-secondary rounded-pill px-3 text-primary">
                                        <i class="fa fa-shopping-bag me-2 text-primary"></i> Shop Now
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
<!--  Shop End -->



        <!-- Banner Section Start-->
        <div class="container-fluid banner bg-secondary my-5">
            <div class="container py-5">
                <div class="row g-4 align-items-center">
                    <div class="col-lg-6">
                        <div class="py-4">
                            <h1 class="display-3 text-white">Flash sale</h1>
                            <p class="fw-normal display-3 text-dark mb-4">Limited Discount</p>
                            <p class="mb-4 text-dark">The generated Lorem Ipsum is therefore always free from repetition injected humour, or non-characteristic words etc.</p>
                            <a href="shop.jsp" class="banner-btn btn border-2 border-white rounded-pill text-dark py-3 px-5">BUY</a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="position-relative">
                            <img src="img/drums.jpg" class="img-fluid w-100 rounded" alt="">
                            <div class="d-flex align-items-center justify-content-center bg-white rounded-circle position-absolute" style="width: 140px; height: 140px; top: 0; left: 0;">
                                <h1 style="font-size: 100px;"></h1>
                                <div class="d-flex flex-column">
                                    <span class="h2 mb-0">40 %</span>
                                    <span class="h4 text-muted mb-0"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Banner Section End -->


       

        <!-- Fact Start -->
        <div class="container-fluid py-5">
            <div class="container">
                <div class="bg-light p-5 rounded">
                    <div class="row g-4 justify-content-center">
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users text-secondary"></i>
                                <h4>satisfied customers</h4>
                                <h1>1000 +</h1>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users text-secondary"></i>
                                <h4>quality of service</h4>
                                <h1>99%</h1>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users text-secondary"></i>
                                <h4>quality certificates</h4>
                                <h1>20</h1>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Fact Start -->


       


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
                            <a class="btn-link" href="shop.jsp">Shop</a>
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