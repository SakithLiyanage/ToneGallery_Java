package com.feedbacks;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.products.DBConnection;

@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            addFeedback(request, response);
        } else if (action.equals("update")) {
            updateFeedback(request, response);
        } else if (action.equals("delete")) {
            deleteFeedback(request, response);
        }
    }

    private void addFeedback(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String feedback = request.getParameter("feedback");
        int rating = Integer.parseInt(request.getParameter("rating"));

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO feedbacks (name, email, feedback, rating) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, feedback);
            stmt.setInt(4, rating);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("feedback.jsp");
    }

    private void updateFeedback(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String feedback = request.getParameter("feedback");
        int rating = Integer.parseInt(request.getParameter("rating"));

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE feedbacks SET feedback = ?, rating = ? WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, feedback);
            stmt.setInt(2, rating);
            stmt.setInt(3, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("feedback.jsp");
    }

    private void deleteFeedback(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "DELETE FROM feedbacks WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("feedback.jsp");
    }
}
