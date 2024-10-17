<%@ page import="com.payment.Payment" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Success</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #e9ecef;
        }
        .container {
            max-width: 600px;
            margin-top: 50px;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        h1 {
            font-weight: bold;
            color: #343a40;
        }
        .thank-you {
            font-size: 1.25rem;
            color: #28a745;
            font-weight: bold;
        }
        .btn-secondary {
            background-color: #5a6268;
            border-color: #5a6268;
        }
        .btn-secondary:hover {
            background-color: #4e555b;
        }
        .transaction-details {
            background-color: #f8f9fa;
            border-radius: 10px;
            padding: 1rem;
            margin-top: 1rem;
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <h1 class="text-center mb-4">Payment Successful</h1>

        <%
            Payment payment = (Payment) request.getAttribute("payment");
        %>

        <div class="card p-4">
            <div class="text-center thank-you">Thank you for your purchase!</div>
            <p class="text-center">Your transaction details are as follows:</p>

            <div class="transaction-details">
                <ul class="list-unstyled">
                    <li><strong>Name:</strong> <%= payment.getName() %></li>
                    <li><strong>Email:</strong> <%= payment.getEmail() %></li>
                    <li><strong>Total Amount:</strong> LKR <%= payment.getTotalAmount() %></li>
                </ul>
            </div>
            <div class="text-center mt-4">
                <a href="shop.jsp" class="btn btn-secondary">Continue Shopping</a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
