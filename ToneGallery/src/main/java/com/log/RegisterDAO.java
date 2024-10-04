package com.log;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegisterDAO {

    private Connection connection;

    public RegisterDAO(Connection connection) {
        this.connection = connection;
    }

    // Method to insert a new user into the database
    public boolean registerUser(Login log) {
        boolean result = false;
        String query = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, log.getUsername());
            stmt.setString(2, log.getEmail());
            stmt.setString(3, log.getPassword());

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
}
