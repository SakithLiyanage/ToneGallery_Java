package com.cart;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/AddtoCart")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String productID = request.getParameter("productID");
        String productName = request.getParameter("productName");
        String pricePerUnit = request.getParameter("pricePerUnit");
        String quantity = request.getParameter("quantity");
        
        
        
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            // Establish database connection
            conn = DatabaseConnection.getConnection();  // Ensure this works

            // Insert message into the database
            String sql = "INSERT INTO cart (productID, productName, pricePerUnit, quantity) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);  // Fetch generated keys
            stmt.setString(1, productID);
            stmt.setString(2, productName);
            stmt.setString(3, pricePerUnit);
            stmt.setString(4, quantity);
            stmt.executeUpdate();
            
            // Retrieve the message ID
            ResultSet rs = stmt.getGeneratedKeys();
            int cartID = -1;
            if (rs.next()) {
                cartID = rs.getInt(1);
            }

            // Set attributes to display the message
            request.setAttribute("cartID", cartID);
            request.setAttribute("productID", productID);
            request.setAttribute("productName", productName);
            request.setAttribute("pricePerUnit", pricePerUnit);
            request.setAttribute("quantity", quantity);

            // Forward to the view message page
            RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
            dispatcher.forward(request, response);
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");  // Consider adding more details about the error here for debugging
        } finally {
            // Close resources
            if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    }
}
