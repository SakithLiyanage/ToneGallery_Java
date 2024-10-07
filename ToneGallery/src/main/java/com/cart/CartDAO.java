package com.cart;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.cart.CartItem;
import com.products.DBConnection;

public class CartDAO {
    public void addToCart(CartItem cart) throws SQLException {
        String sql = "INSERT INTO cart (product_id, product_name, price_per_unit, quantity, total_price) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
             
            pstmt.setInt(1, cart.getProductId());
            pstmt.setString(2, cart.getProductName());
            pstmt.setDouble(3, cart.getPricePerUnit());
            pstmt.setInt(4, cart.getQuantity());
            pstmt.setDouble(5, cart.getTotalPrice());

            pstmt.executeUpdate();
        }
    }
}
