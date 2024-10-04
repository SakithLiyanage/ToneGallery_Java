package com.products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ShowProductDAO {
    public static List<Product> getAllProducts() {
        List<Product> productList = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM products";  // SQL query to fetch all products
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setName(rs.getString("name"));
                product.setCategory(rs.getString("category"));
                product.setPrice(rs.getDouble("price"));
                product.setImage_path(rs.getString("image_path"));
                productList.add(product);  // Add each product to the list
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;  // Return the list of products
    }
}
