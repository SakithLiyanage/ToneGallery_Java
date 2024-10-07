package com.message;

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

@WebServlet("/ContactFormServlet")
public class ContactFormServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");
        
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            // Establish database connection
            conn = DBConnection.getConnection();  // Ensure this works

            // Insert message into the database
            String sql = "INSERT INTO messages (name, email, message) VALUES (?, ?, ?)";
            stmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);  // Fetch generated keys
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, message);
            stmt.executeUpdate();
            
            // Retrieve the message ID
            ResultSet rs = stmt.getGeneratedKeys();
            int messageId = -1;
            if (rs.next()) {
                messageId = rs.getInt(1);
            }

            // Set attributes to display the message
            request.setAttribute("messageId", messageId);
            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("message", message);

            // Forward to the view message page
            RequestDispatcher dispatcher = request.getRequestDispatcher("view-message.jsp");
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
