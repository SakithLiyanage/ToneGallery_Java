package com.cart;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {

    // Method to get all cart items (without checking user ID)
    public List<CartItem> getAllCartItems() {
        List<CartItem> cartItems = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Your DB connection
            conn = DatabaseConnection.getConnection();
            String query = "SELECT * from cart";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();

            while (rs.next()) {
                CartItem item = new CartItem();
                item.setProductId(rs.getInt("productID"));
                item.setProductName(rs.getString("productName"));
                item.setPrice(rs.getDouble("pricePerUnit"));
                item.setQuantity(rs.getInt("quantity"));
                item.setTotalPrice(item.getPrice() * item.getQuantity());

                cartItems.add(item);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return cartItems;
    }
}
