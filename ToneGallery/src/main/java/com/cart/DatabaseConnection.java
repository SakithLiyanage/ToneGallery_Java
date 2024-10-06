package com.cart;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tonegallery", "root", "1234");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}