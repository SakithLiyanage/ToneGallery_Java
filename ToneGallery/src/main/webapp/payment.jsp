<%@ page import="java.util.List, com.cart.CartItem, com.cart.CartDAO" %>
<%@ page import="com.payment.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 700px;
            background: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .form-label {
            font-weight: bold;
        }
        h1 {
            font-weight: bold;
            color: #343a40;
        }
        .btn-secondary {
            background-color: #5a6268;
            border-color: #5a6268;
        }
        .btn-secondary:hover {
            background-color: #4e555b;
        }
        .card-details {
            padding: 1rem;
            background-color: #e9ecef;
            border-radius: 8px;
        }
        .error-message {
            color: red;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <h1 class="text-center mb-4">Payment Details</h1>

        <!-- Payment Form -->
        <form action="PaymentServlet" method="post" id="paymentForm" novalidate>
            <div class="row">
                <!-- Billing Information -->
                <div class="col-md-6 mb-4">
                    <h5>Billing Information</h5>
                    <div class="mb-3">
                        <label for="name" class="form-label">Name</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                        <div class="error-message" id="nameError"></div>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                        <div class="error-message" id="emailError"></div>
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">Address</label>
                        <input type="text" class="form-control" id="address" name="address" required>
                        <div class="error-message" id="addressError"></div>
                    </div>
                </div>

                <!-- Payment Information -->
                <div class="col-md-6 mb-4">
                    <h5>Payment Information</h5>
                    <div class="card-details">
                        <div class="mb-3">
                            <label for="cardNumber" class="form-label">Card Number</label>
                            <input type="text" class="form-control" id="cardNumber" name="cardNumber" pattern="\\d{16}" placeholder="1234 5678 9012 3456" required maxlength="16">
                            <div class="error-message" id="cardNumberError"></div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="expiry" class="form-label">Expiry Date</label>
                                <input type="text" class="form-control" id="expiry" name="expiry" placeholder="MM/YY" pattern="\\d{2}/\\d{2}" required>
                                <div class="error-message" id="expiryError"></div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="cvv" class="form-label">CVV</label>
                                <input type="text" class="form-control" id="cvv" name="cvv" pattern="\\d{3}" required maxlength="3">
                                <div class="error-message" id="cvvError"></div>
                            </div>
                        </div>
                    </div>

                    <!-- Display Subtotal and Total -->
                    <%
                        CartDAO cartDAO = new CartDAO();
                        List<CartItem> cartItems = cartDAO.getAllCartItems();
                        double subtotal = 0.0;
                        for (CartItem item : cartItems) {
                            subtotal += item.getQuantity() * item.getPricePerUnit();
                        }
                    %>
                    <div class="mt-3">
                        <label for="subtotal" class="form-label">Subtotal</label>
                        <input type="text" class="form-control" id="subtotal" name="subtotal" value="<%= subtotal %>" readonly>
                    </div>
                    <div class="mt-3">
                        <label for="total" class="form-label">Total (Including Shipping)</label>
                        <input type="text" class="form-control" id="total" name="total" value="<%= subtotal + 300 %>" readonly>
                    </div>
                </div>
            </div>

            <!-- Submit Button -->
            <div class="text-center">
                <button type="submit" class="btn btn-secondary mt-4">Submit Payment</button>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS and Validation Script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Restrict the card number to a maximum of 16 digits
        document.getElementById('cardNumber').addEventListener('input', function () {
            let cardNumberField = document.getElementById('cardNumber');
            if (cardNumberField.value.length > 16) {
                cardNumberField.value = cardNumberField.value.slice(0, 16); // Limit input to 16 characters
            }
        });

        // Form validation
        document.getElementById('paymentForm').addEventListener('submit', function(event) {
            let valid = true;

            // Clear previous error messages
            document.querySelectorAll('.error-message').forEach(function(elem) {
                elem.textContent = '';
            });

            // Validation logic
            if (!document.getElementById('name').value.trim()) {
                document.getElementById('nameError').textContent = 'Name is required';
                valid = false;
            }
            if (!document.getElementById('email').value.trim()) {
                document.getElementById('emailError').textContent = 'Email is required';
                valid = false;
            }
            if (!document.getElementById('address').value.trim()) {
                document.getElementById('addressError').textContent = 'Address is required';
                valid = false;
            }
            if (!/^\d{16}$/.test(document.getElementById('cardNumber').value)) {
                document.getElementById('cardNumberError').textContent = 'Please enter a valid 16-digit card number';
                valid = false;
            }
            if (!/^\d{2}\/\d{2}$/.test(document.getElementById('expiry').value)) {
                document.getElementById('expiryError').textContent = 'Please enter a valid expiry date in MM/YY format';
                valid = false;
            }
            if (!/^\d{3}$/.test(document.getElementById('cvv').value)) {
                document.getElementById('cvvError').textContent = 'Please enter a valid 3-digit CVV';
                valid = false;
            }

            if (!valid) {
                event.preventDefault();
            }
        });
    </script>
</body>
</html>
