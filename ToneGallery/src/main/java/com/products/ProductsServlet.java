package com.products;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/ProductsServlet")
public class ProductsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = ShowProductDAO.getAllProducts();  // Fetch all products from the database
        request.setAttribute("products", products);  // Pass the product list to the JSP
        request.getRequestDispatcher("products.jsp").forward(request, response);  // Forward to the JSP
    }
}
