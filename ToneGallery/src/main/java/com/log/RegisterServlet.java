package com.log;

import java.io.IOException;
import java.sql.Connection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form parameters
        String username = request.getParameter("name");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        // Create User object
        Login log = new Login(0, username, email, password);

        // Establish database connection using DBConnection class
        try (Connection connection = DBConnection.getConnection()) {

            // Instantiate DAO and call register method
            RegisterDAO userDAO = new RegisterDAO(connection);
            boolean isRegistered = userDAO.registerUser(log);

            // Redirect based on registration status
            if (isRegistered) {
                response.sendRedirect("log.jsp");
            } else {
                response.sendRedirect("404.html");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to error page if any exception occurs
        }
    }
}
