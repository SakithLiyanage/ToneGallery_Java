<%@ page import="com.products.Product" %>
<%
    Product product = (Product) request.getAttribute("product");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Product</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom Styles (Optional) -->
    <style>
        .product-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .product-image {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        .product-details h2 {
            margin-bottom: 20px;
        }
        .product-details p {
            margin-bottom: 10px;
        }
        .btn-back {
            margin-top: 30px;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="product-container">
            <div class="row">
                <div class="col-md-6">
                    <!-- Product Image -->
                    <img src="<%= request.getContextPath() + "/" + product.getImage_path() %>" alt="Product Image" class="product-image">
                </div>
                <div class="col-md-6 product-details">
                    <h2>Product Details</h2>
                    
                    <!-- Product Name -->
                    <p><strong>Name:</strong> <%= product.getName() %></p>
                    
                    <!-- Product Category -->
                    <p><strong>Category:</strong> <%= product.getCategory() %></p>
                    
                    <!-- Product Price -->
                    <p><strong>Price:</strong> LKR <%= product.getPrice() %></p>
                    
                    <!-- Back Button -->
                    <a href="admindashboard.jsp" class="btn btn-secondary btn-back">Back to Dashboard</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS (Optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
