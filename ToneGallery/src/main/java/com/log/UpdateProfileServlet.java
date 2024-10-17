package com.log;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve updated values from the form
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        HttpSession session = request.getSession();
        Login user = (Login) session.getAttribute("user");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE users SET username = ?, email = ?, password = ? WHERE userid = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, username);
                pstmt.setString(2, email);
                pstmt.setString(3, password); 
                pstmt.setInt(4, user.getUserid());
                
                int rowsUpdated = pstmt.executeUpdate();
                if (rowsUpdated > 0) {
                    // Update session with new user details
                    user.setUsername(username);
                    user.setEmail(email);
                    user.setPassword(password);
                    session.setAttribute("user", user);
                    
                    // Redirect to profile page with success message
                    response.sendRedirect("userprofile.jsp?status=success");
                } else {
                    response.sendRedirect("userprofile.jsp?status=error");
                }
            }
        } catch (Exception e) {
            throw new ServletException("Profile update failed", e);
        }
    }
}
