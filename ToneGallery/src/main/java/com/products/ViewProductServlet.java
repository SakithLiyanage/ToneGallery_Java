package com.products;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


@WebServlet("/ViewProductServlet")
public class ViewProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("name");

        // Retrieve product details from database using the product ID
        Product product = ProductDAO.getProductByName(productName);

        // Set product as an attribute and forward to a JSP page to display details
        request.setAttribute("product", product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewProduct.jsp");
        dispatcher.forward(request, response);
    }
}

