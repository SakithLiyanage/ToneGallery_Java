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

@WebServlet("/ProductServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50   // 50MB
)
public class AddProductsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Directory where uploaded files will be saved
    private static final String UPLOAD_DIR = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // Retrieve form data
        String productName = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        Part filePart = request.getPart("image"); // Retrieves <input type="file" name="image">

        // Create a path to save the uploaded file
        String fileName = extractFileName(filePart);
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir(); // Create the directory if it does not exist

        // Save the file to the server
        filePart.write(uploadPath + File.separator + fileName);
        String imagePath = UPLOAD_DIR + File.separator + fileName; // Store the relative path to DB

        // Insert product into the database
        try (Connection connection = DBConnection.getConnection()) {
            String sql = "INSERT INTO products (name, category, price, image_path) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, productName);
            stmt.setString(2, category);
            stmt.setDouble(3, price);
            stmt.setString(4, imagePath);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
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
