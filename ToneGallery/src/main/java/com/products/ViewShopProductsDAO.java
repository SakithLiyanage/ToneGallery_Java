package com.products;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ViewShopProductsDAO {

    // Fetch products from the database
    public List<Product> getAllProducts() throws SQLException {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM products";

        try (Connection connection = DBConnection.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                // Creating product object using result set data
                Product product = new Product(
                    resultSet.getInt("productID"),
                    resultSet.getString("name"),
                    resultSet.getString("category"),
                    resultSet.getDouble("price"),  // Price as double
                    resultSet.getString("image_path")
                );
                products.add(product);
            }
        }
        return products;
    }
}
