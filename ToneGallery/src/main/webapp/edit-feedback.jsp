<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Feedback</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            background-color: #e9ecef;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            padding: 20px;
            border: none;
            margin-top: 30px;
        }
        h1 {
            font-weight: 700;
            color: #333;
        }
        .form-label {
            font-weight: 600;
            color: #495057;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            padding: 10px 20px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .form-control:focus {
            box-shadow: none;
            border-color: #007bff;
        }
        .container {
            max-width: 600px;
        }
        .card-title {
            font-weight: 600;
            color: #007bff;
            margin-bottom: 20px;
        }
        .btn-cancel {
            background-color: #6c757d;
            color: white;
        }
        .btn-cancel:hover {
            background-color: #5a6268;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="card">
            <h1 class="text-center mb-4">Edit Your Feedback</h1>
            <div class="card-body">
                <form action="EditFeedbackServlet" method="post">
                    <!-- Hidden input for ID -->
                    <input type="hidden" name="id" value="<%= request.getAttribute("id") %>">

                    <!-- Name Field -->
                    <div class="mb-3">
                        <label for="name" class="form-label">Name</label>
                        <input type="text" class="form-control shadow-sm" id="name" name="name" 
                               value="<%= request.getAttribute("name") %>" required>
                    </div>

                    <!-- Email Field -->
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control shadow-sm" id="email" name="email" 
                               value="<%= request.getAttribute("email") %>" required>
                    </div>

                    <!-- Feedback Textarea -->
                    <div class="mb-3">
                        <label for="feedback" class="form-label">Feedback</label>
                        <textarea class="form-control shadow-sm" id="feedback" name="feedback" rows="4" required><%= request.getAttribute("feedback") %></textarea>
                    </div>

                    <!-- Rating Select -->
                    <div class="mb-3">
                        <label for="rating" class="form-label">Rating</label>
                        <select class="form-select shadow-sm" id="rating" name="rating" required>
                            <option value="1" <%= String.valueOf(request.getAttribute("rating")).equals("1") ? "selected" : "" %>>1</option>
                            <option value="2" <%= String.valueOf(request.getAttribute("rating")).equals("2") ? "selected" : "" %>>2</option>
                            <option value="3" <%= String.valueOf(request.getAttribute("rating")).equals("3") ? "selected" : "" %>>3</option>
                            <option value="4" <%= String.valueOf(request.getAttribute("rating")).equals("4") ? "selected" : "" %>>4</option>
                            <option value="5" <%= String.valueOf(request.getAttribute("rating")).equals("5") ? "selected" : "" %>>5</option>
                        </select>
                    </div>

                    <!-- Submit Button -->
                    <div class="d-flex justify-content-between mt-4">
                        <button type="submit" class="btn btn-primary shadow-sm">Update Feedback</button>
                        <a href="feedback.jsp" class="btn btn-cancel shadow-sm">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
