package com.payment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.cart.*;

public class PaymentDAO {
    public boolean savePayment(Payment payment) {
        boolean status = false;
        try {
            Connection con = DatabaseConnection.getConnection();
            String query = "INSERT INTO payment(name, email, address, card_number, expiry, cvv, total) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, payment.getName());
            ps.setString(2, payment.getEmail());
            ps.setString(3, payment.getAddress());
            ps.setString(4, payment.getCardNumber());
            ps.setString(5, payment.getExpiry());
            ps.setString(6, payment.getCvv());
            ps.setDouble(7, payment.getTotalAmount());

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                status = true;
            }
            ps.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }
}

