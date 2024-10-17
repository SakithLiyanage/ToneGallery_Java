package com.cart;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteCartServlet")
public class DeleteCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cartID = Integer.parseInt(request.getParameter("cartID"));

        CartDAO cartDAO = new CartDAO();

        // Remove the cart item from the database
        cartDAO.deleteCartItem(cartID);

        // Redirect back to the cart page
        response.sendRedirect("cart.jsp");
    }
}
