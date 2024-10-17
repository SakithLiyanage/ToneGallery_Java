package com.log;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/logout") // Define the URL mapping
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Invalidate the user session
        HttpSession session = request.getSession(false); // Get current session, if it exists
        if (session != null) {
            session.invalidate(); // Invalidate the session
        }
        
        // Redirect to the home page or login page after logout
        response.sendRedirect("index.jsp"); // Change to your desired page
    }
}
