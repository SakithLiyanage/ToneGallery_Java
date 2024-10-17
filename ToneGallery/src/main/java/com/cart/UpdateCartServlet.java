package com.cart;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cartID = Integer.parseInt(request.getParameter("cartID"));
        String action = request.getParameter("action");

        CartDAO cartDAO = new CartDAO();

        // Retrieve the current cart item
        CartItem cartItem = cartDAO.getCartItemByID(cartID);

        // Update quantity based on the action
        if ("plus".equals(action)) {
            cartItem.setQuantity(cartItem.getQuantity() + 1);
        } else if ("minus".equals(action) && cartItem.getQuantity() > 1) {
            cartItem.setQuantity(cartItem.getQuantity() - 1);
        }

        // Update the cart item in the database
        cartDAO.updateCartItem(cartItem);

        // Redirect back to the cart page
        response.sendRedirect("cart.jsp");
    }
}
