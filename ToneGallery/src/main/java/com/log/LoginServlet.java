package com.log;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // Validate the user using LoginDAO with plain text password
            Login user = LoginDAO.validateUser(email, password);

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);

                // Set session timeout (in seconds)
                session.setMaxInactiveInterval(30 * 60); // 30 minutes

                // Check for admin credentials
                if ("admin@tonegallery.com".equals(email) && "admin123".equals(password)) {
                    // Redirect to admin dashboard
                    response.sendRedirect("admindashboard.jsp");
                } else {
                    // Redirect to user profile page for regular users
                    response.sendRedirect("index.jsp");
                }
            } else {
                // Handle invalid login
                request.setAttribute("error", "Invalid email or password.");
                request.getRequestDispatcher("log.jsp").forward(request, response);
            }
        } catch (Exception e) {
            // Log the error and forward to an error page
            request.setAttribute("error", "A server error occurred. Please try again later.");
        }
    }
}
