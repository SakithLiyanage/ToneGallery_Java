package com.cart;


import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get product details from the request
    	int productId = Integer.parseInt(request.getParameter("productID"));
    	String productName = request.getParameter("productName");
    	double pricePerUnit = Double.parseDouble(request.getParameter("pricePerUnit"));
    	int quantity = Integer.parseInt(request.getParameter("quantity"));

        
        // Calculate total price
        double totalPrice = pricePerUnit * quantity;
        
        // Create Cart object
        CartItem cart = new CartItem();
        cart.setProductId(productId);
        cart.setProductName(productName);
        cart.setPricePerUnit(pricePerUnit);
        cart.setQuantity(quantity);
        cart.setTotalPrice(totalPrice);

        // Add to Cart using CartDAO
        CartDAO cartDAO = new CartDAO();
        try {
            cartDAO.addToCart(cart);
            response.sendRedirect("cart.jsp"); // Redirect to cart page
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
