package com.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {
    
    // Method to retrieve all items from the cart table
    public List<CartItem> getAllCartItems() {
        List<CartItem> cartList = new ArrayList<>();
        try {
            Connection con = DatabaseConnection.getConnection(); 
            String query = "SELECT * FROM cart";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                CartItem cart = new CartItem();
                cart.setCartID(rs.getInt("cartID"));
                cart.setProductID(rs.getInt("productID"));
                cart.setProductName(rs.getString("productName"));
                cart.setPricePerUnit(rs.getDouble("pricePerUnit"));
                cart.setQuantity(rs.getInt("quantity"));
                
                cartList.add(cart);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cartList;
    }

    // Method to retrieve a single cart item by its ID
    public CartItem getCartItemByID(int cartID) {
        CartItem cartItem = null;
        try {
            Connection con = DatabaseConnection.getConnection();
            String query = "SELECT * FROM cart WHERE cartID = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, cartID);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                cartItem = new CartItem();
                cartItem.setCartID(rs.getInt("cartID"));
                cartItem.setProductID(rs.getInt("productID"));
                cartItem.setProductName(rs.getString("productName"));
                cartItem.setPricePerUnit(rs.getDouble("pricePerUnit"));
                cartItem.setQuantity(rs.getInt("quantity"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cartItem;
    }

    // Method to update a cart item
    public void updateCartItem(CartItem cartItem) {
        try {
            Connection con = DatabaseConnection.getConnection();
            String query = "UPDATE cart SET quantity = ? WHERE cartID = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, cartItem.getQuantity());
            ps.setInt(2, cartItem.getCartID());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Method to delete a cart item
    public void deleteCartItem(int cartID) {
        try {
            Connection con = DatabaseConnection.getConnection();
            String query = "DELETE FROM cart WHERE cartID = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, cartID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
