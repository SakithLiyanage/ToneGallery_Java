<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Submitted</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome for star icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <style>
        body {
            background-color: #f4f4f4;
        }
        .card {
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
            font-weight: 700;
        }
        .card-title {
            font-weight: 600;
            color: #007bff;
        }
        .feedback-details p {
            font-size: 1.1rem;
            margin-bottom: 0.8rem;
        }
        .feedback-details p strong {
            color: #007bff;
        }
        .fas.fa-star {
            color: #f5c518; 
        }
        .btn-back, .btn-edit, .btn-delete {
            margin-top: 20px;
            padding: 10px 20px;
            border-radius: 50px;
            text-transform: uppercase;
            font-weight: 600;
        }
        .btn-back {
            background-color: #007bff;
            color: white;
        }
        .btn-back:hover {
            background-color: #0056b3;
        }
        .btn-edit {
            background-color: #28a745;
            color: white;
        }
        .btn-edit:hover {
            background-color: #218838;
        }
        .btn-delete {
            background-color: #dc3545;
            color: white;
        }
        .btn-delete:hover {
            background-color: #c82333;
        }
    </style>
</head>

<body>
    <div class="container py-5">
        <h1 class="text-center mb-5">Thank you for your feedback!</h1>
        <div class="card mx-auto" style="max-width: 600px;">
            <div class="card-body">
                <h4 class="card-title">Feedback Details</h4>
                <div class="feedback-details">
                    <p><strong>Name:</strong> <%= request.getParameter("name") %></p>
                    <p><strong>Email:</strong> <%= request.getParameter("email") %></p>
                    <p><strong>Feedback:</strong> <%= request.getParameter("feedback") %></p>
                    <p><strong>Rating:</strong>
                        <% 
                            String ratingStr = request.getParameter("rating");
                            int rating = 0;
                            if (ratingStr != null) {
                                rating = Integer.parseInt(ratingStr);
                            }

                            // Display star icons based on rating
                            for (int i = 1; i <= rating; i++) {
                        %>
                            <i class="fas fa-star"></i>
                        <% 
                            }
                        %>
                    </p>
                </div>
            </div>
        </div>
        <div class="text-center">
            <!-- Use feedback ID for edit and delete actions -->
            <a href="feedback.jsp" class="btn btn-back">Back to Home</a>
            <a href="EditFeedbackServlet?email=<%= request.getParameter("email") %>" class="btn btn-edit">Edit Feedback</a>
            <a href="DeleteFeedbackServlet?email=<%= request.getParameter("email") %>" class="btn btn-delete" 
               onclick="return confirm('Are you sure you want to delete this feedback?');">Delete Feedback</a>
        </div>
    </div>

    <!-- Bootstrap JS and Font Awesome JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
