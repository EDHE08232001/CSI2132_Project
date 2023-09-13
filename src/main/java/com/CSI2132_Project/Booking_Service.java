package com.CSI2132_Project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Booking_Service {
    // code
    public List<Booking> getAll() throws Exception {
        String sql = "SELECT * FROM Booking;";

        ConnectionDB db = new ConnectionDB();

        List<Booking> bookings = new ArrayList<>();

        try (Connection con = db.getConnection()) {
            // code
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking(
                        rs.getString("booking_id"),
                        rs.getDate("check_in_date"),
                        rs.getDate("check_out_date"),
                        rs.getInt("room_number"),
                        rs.getString("hotel_id"),
                        rs.getFloat("total_price")
                );
                bookings.add(booking);
            }
            rs.close();
            stmt.close();
            con.close();
            db.close();

            return bookings;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public String create(Booking booking) throws Exception {
        //code
        String message = "";
        Connection con = null;

        ConnectionDB db = new ConnectionDB();
        System.out.println(booking);

        String attributes = "(booking_id, check_in_date, check_out_date, room_number, hotel_id, total_price)";
        String insertedValues = "(?, ?, ?, ?, ?, ?)";
        String insertHotelChainQuery = "INSERT INTO Booking " + attributes + " VALUES " + insertedValues + ";";

        try {
            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(insertHotelChainQuery);

            stmt.setString(1, booking.getBookingID());
            stmt.setDate(2, booking.getCheckInDate());
            stmt.setDate(3, booking.getCheckOutDate());
            stmt.setInt(4, booking.getRoomNumber());
            stmt.setString(5, booking.getHotelID());
            stmt.setFloat(6, booking.getTotalPrice());

            int output = stmt.executeUpdate();
            System.out.println(output);

            stmt.close();
            db.close();
        } catch (Exception e) {
            message = "Error while inserting a booking: " + e.getMessage();
        } finally {
            if (con != null) {
                con.close();
            }
            if (message.equals("")) {
                message = "A booking is successfully inserted";
            }
        }

        return message;
    }

    public String delete(String booking_id) throws Exception {
        String message = "";
        Connection con = null;
        ConnectionDB db = new ConnectionDB();

        String deleteQuery = "DELETE FROM Booking WHERE booking_id = " + "'" + booking_id + "'" + ";";

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
                message = "A booking is successfully deleted";
            }
        }

        return message;
    }

    public String update(Booking booking) throws Exception {
        // code
        Connection con = null;
        String message = "";

        ConnectionDB db = new ConnectionDB();

        String newValues = "check_in_date=?, check_out_date";
        String updateQuery = "UPDATE Booking SET " + newValues + " WHERE booking_id=?;";

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(updateQuery);

            stmt.setDate(1, booking.getCheckInDate());
            stmt.setDate(2, booking.getCheckOutDate());
            stmt.setString(3, booking.getBookingID());

            stmt.executeUpdate();
            stmt.close();

        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        } finally {
            if (con != null) {
                con.close();
            }
            if (message.equals("")) {
                message = "Booking Table Successfully Got Updated";
            }
        }
        return message;
    }
}
