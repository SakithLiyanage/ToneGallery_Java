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

@WebServlet("/DeleteAccountServlet")
public class DeleteAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Login user = (Login) session.getAttribute("user");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "DELETE FROM users WHERE userid = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, user.getUserid());
                int rowsDeleted = pstmt.executeUpdate();
                
                if (rowsDeleted > 0) {
                    // Invalidate session after deletion
                    session.invalidate();
                    
                    // Redirect to login page
                    response.sendRedirect("index.jsp");
                } else {
                    response.sendRedirect("userprofile.jsp?status=error");
                }
            }
        } catch (Exception e) {
            throw new ServletException("Account deletion failed", e);
        }
    }
}
