package com.cart;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String productID = request.getParameter("productID");
        String productName = request.getParameter("productName");
        String pricePerUnitStr = request.getParameter("pricePerUnit");
        String quantityStr = request.getParameter("quantity");

        // Convert necessary fields
        double pricePerUnit = Double.parseDouble(pricePerUnitStr);
        int quantity = Integer.parseInt(quantityStr);
        double totalPrice = pricePerUnit * quantity;

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tonegallery", "root", "1234");

            // Insert query
            String sql = "INSERT INTO cart (productID, productName, pricePerUnit, quantity, totalPrice) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, productID);
            pstmt.setString(2, productName);
            pstmt.setDouble(3, pricePerUnit);
            pstmt.setInt(4, quantity);
            pstmt.setDouble(5, totalPrice);

            // Execute the insert statement
            pstmt.executeUpdate();

            // Redirect back to product or cart page (optional)
            response.sendRedirect("cart.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}

