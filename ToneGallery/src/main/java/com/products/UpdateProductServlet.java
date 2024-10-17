package com.products;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/UpdateProductServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50   // 50MB
)
public class UpdateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String productName = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        Part filePart = request.getPart("image"); 

        String imagePath = null;
        // Check if a new file is uploaded
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = extractFileName(filePart);
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir(); // Create the directory if it does not exist

            // Save the file to the server
            filePart.write(uploadPath + File.separator + fileName);
            imagePath = UPLOAD_DIR + File.separator + fileName; // Store the relative path to DB
        }

        // Update product in the database
        try (Connection connection = DBConnection.getConnection()) {
            String sql = "UPDATE products SET category = ?, price = ?" + (imagePath != null ? ", image_path = ?" : "") + " WHERE name = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, category);
            stmt.setDouble(2, price);
            if (imagePath != null) {
                stmt.setString(3, imagePath);
                stmt.setString(4, productName);
            } else {
                stmt.setString(3, productName);
            }

            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                response.sendRedirect("admindashboard.jsp"); // Redirect to dashboard after success
            } else {
                response.sendRedirect("error.jsp"); // Handle failure case
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    // Utility method to extract file name from HTTP header
    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String content : contentDisposition.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return "default.png"; // Default name if no file is uploaded
    }
}
