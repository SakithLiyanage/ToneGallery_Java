package com.payment;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import com.payment.Payment;
import com.payment.PaymentDAO;

@WebServlet("/PaymentServlet")

public class PaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String cardNumber = request.getParameter("cardNumber");
        String expiry = request.getParameter("expiry");
        String cvv = request.getParameter("cvv");
        double totalAmount = Double.parseDouble(request.getParameter("total"));

        // Create payment object and store payment details
        Payment payment = new Payment(name, email, address, cardNumber, expiry, cvv, totalAmount);

        // Save payment details to the database using DAO
        PaymentDAO paymentDAO = new PaymentDAO();
        boolean success = paymentDAO.savePayment(payment);

        if (success) {
            // Redirect to payment success page
            request.setAttribute("payment", payment);
            request.getRequestDispatcher("paymentsuccess.jsp").forward(request, response);
        } else {
            response.sendRedirect("payment.jsp?error=Failed");
        }
    }
}

