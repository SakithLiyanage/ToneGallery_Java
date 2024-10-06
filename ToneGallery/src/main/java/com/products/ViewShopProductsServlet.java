package com.products;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ViewShopProductsServlet extends HttpServlet {
    private ViewShopProductsDAO productDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new ViewShopProductsDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Fetch the products
            List<Product> products = productDAO.getAllProducts();

            // Pass products list to the JSP
            request.setAttribute("products", products);
            
            // Forward request to JSP page
            RequestDispatcher dispatcher = request.getRequestDispatcher("shop.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            // Handle any errors and pass an informative message
            throw new ServletException("Error retrieving products", e);
        }
    }
}
