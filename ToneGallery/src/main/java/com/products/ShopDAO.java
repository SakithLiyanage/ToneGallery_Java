package com.products;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ShopDAO {
    private Connection getConnection() throws SQLException {
        String jdbcURL = "jdbc:mysql://localhost:3306/tonegallery";
        String dbUser = "root";
        String dbPassword = "1234";
        return DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
    }

    public List<Product> getAllProducts() throws SQLException {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT * FROM products";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                String image = rs.getString("image");

                Product product = new Product(id, name, description, price, image);
                productList.add(product);
            }
        }

        return productList;
    }
}

