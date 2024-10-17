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
        // Retrieve form parameters with basic validation
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        // Input validation
        if (name == null || name.isEmpty() || email == null || email.isEmpty() || message == null || message.isEmpty()) {
            request.setAttribute("error", "All fields are required!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("contact.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Prepare to interact with the database
        try (Connection conn = DBConnection.getConnection(); 
             PreparedStatement stmt = conn.prepareStatement("INSERT INTO messages (name, email, message) VALUES (?, ?, ?)", PreparedStatement.RETURN_GENERATED_KEYS)) {
            
            // Set parameters and execute the query
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, message);
            int rowsAffected = stmt.executeUpdate();

            // Check if the insert was successful
            if (rowsAffected > 0) {
                // Retrieve the generated message ID
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        int messageId = rs.getInt(1);

                        // Set attributes for confirmation view
                        request.setAttribute("messageId", messageId);
                        request.setAttribute("name", name);
                        request.setAttribute("email", email);
                        request.setAttribute("message", message);

                        // Forward to the view-message.jsp
                        RequestDispatcher dispatcher = request.getRequestDispatcher("view-message.jsp");
                        dispatcher.forward(request, response);
                    }
                }
            } else {
                // If no rows were affected, show an error
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to save the message.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "A database error occurred.");
        }
    }
}
