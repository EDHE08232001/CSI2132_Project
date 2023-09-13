package com.CSI2132_Project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

public class Renting_Service {
    // code
    public List<Renting> getAll() throws Exception {
        String sql = "SELECT * FROM Renting;";

        ConnectionDB db = new ConnectionDB();

        List<Renting> rentings = new ArrayList<>();

        try (Connection con = db.getConnection()) {
            // code
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Renting renting = new Renting(
                        rs.getString("booking_id"),
                        rs.getInt("cc_number"),
                        rs.getDate("expiry_date")
                );
                rentings.add(renting);
            }
            rs.close();
            stmt.close();
            con.close();
            db.close();

            return rentings;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public String create(Renting renting) throws Exception {
        //code
        String message = "";
        Connection con = null;

        ConnectionDB db = new ConnectionDB();
        System.out.println(renting);

        String attributes = "(booking_id, cc_number, expiry_date)";
        String insertedValues = "(?, ?, ?)";
        String insertHotelChainQuery = "INSERT INTO Renting " + attributes + " VALUES " + insertedValues + ";";

        try {
            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(insertHotelChainQuery);

            stmt.setString(1, renting.getBooking_id());
            stmt.setInt(2, renting.getCcNumber());
            stmt.setDate(3, renting.getExpiryDate());

            int output = stmt.executeUpdate();
            System.out.println(output);

            stmt.close();
            db.close();
        } catch (Exception e) {
            message = "Error while inserting a renting: " + e.getMessage();
        } finally {
            if (con != null) {
                con.close();
            }
            if (message.equals("")) {
                message = "A renting is successfully inserted";
            }
        }

        return message;
    }

    public String delete(String booking_id) throws Exception {
        String message = "";
        Connection con = null;
        ConnectionDB db = new ConnectionDB();

        String deleteQuery = "DELETE FROM Renting WHERE booking_id = " + "'" + booking_id + "'" + ";";

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(deleteQuery);
            int output = stmt.executeUpdate();
            System.out.println(output);
            stmt.close();
            db.close();
        } catch (Exception e) {
            // code
            message = "Error with deletion: " + e.getMessage();
        } finally {
            if (con != null) {
                con.close();
            }
            if (message.equals("")) {
                message = "A renting is successfully deleted";
            }
        }

        return message;
    }

    public String update(Renting renting) throws Exception {
        // code
        Connection con = null;
        String message = "";

        ConnectionDB db = new ConnectionDB();

        String newValues = "expiry_date=?";
        String updateQuery = "UPDATE Renting SET " + newValues + " WHERE booking_id=?;";

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(updateQuery);

            stmt.setDate(1, renting.getExpiryDate());
            stmt.setString(2, renting.getBooking_id());

            stmt.executeUpdate();
            stmt.close();

        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        } finally {
            if (con != null) {
                con.close();
            }
            if (message.equals("")) {
                message = "Renting Table Successfully Got Updated";
            }
        }
        return message;
    }
}