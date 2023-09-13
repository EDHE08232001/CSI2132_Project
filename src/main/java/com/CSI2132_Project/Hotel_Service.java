package com.CSI2132_Project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Hotel_Service {
    public static void main(String[] args) throws Exception {
        Hotel hotel = new Hotel(
                "H006A",
                "C005",
                123,
                "Union",
                2,
                "Miami",
                "FL",
                "USA",
                "78990",
                3,
                "@example.com",
                "Business Hotel"
                );
        Hotel_Service myService = new Hotel_Service();
        myService.delete("H006A");
    }
    // code
    public List<Hotel> getAll() throws Exception {
        String sql = "SELECT * FROM Hotel;";

        ConnectionDB db = new ConnectionDB();

        List<Hotel> hotels = new ArrayList<>();

        try (Connection con = db.getConnection()) {
            // code
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Hotel hotel = new Hotel(
                        rs.getString("hotel_id"),
                        rs.getString("chain_id"),
                        rs.getInt("street_number"),
                        rs.getString("street_name"),
                        rs.getInt("unit_number"),
                        rs.getString("city"),
                        rs.getString("state"),
                        rs.getString("country"),
                        rs.getString("postal_code"),
                        rs.getInt("rating"),
                        rs.getString("email"),
                        rs.getString("category")
                );
                hotels.add(hotel);
            }
            rs.close();
            stmt.close();
            con.close();
            db.close();

            return hotels;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public String create(Hotel hotel) throws Exception {
        System.out.println("Creating");
        //code
        String message = "";
        Connection con = null;

        ConnectionDB db = new ConnectionDB();
        System.out.println(hotel);

        String attributes = "(hotel_id, chain_id, street_number, street_name, unit_number, city, state, country, postal_code, rating, email, category)";
        String insertedValues = "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String insertHotelChainQuery = "INSERT INTO Hotel " + attributes + " VALUES " + insertedValues + ";";

        try {
            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(insertHotelChainQuery);
            stmt.setString(1, hotel.getHotelID());
            stmt.setString(2, hotel.getChainID());
            stmt.setInt(3, hotel.getStreetNumber());
            stmt.setString(4, hotel.getStreetName());
            stmt.setInt(5, hotel.getUnitNumber());
            stmt.setString(6, hotel.getCity());
            stmt.setString(7, hotel.getState());
            stmt.setString(8, hotel.getCountry());
            stmt.setString(9, hotel.getPostalCode());
            stmt.setInt(10, hotel.getRating());
            stmt.setString(11, hotel.getEmail());
            stmt.setString(12, hotel.getCategory());

            int output = stmt.executeUpdate();
            System.out.println(output);

            stmt.close();
            db.close();
        } catch (Exception e) {
            message = "Error while inserting hotel: " + e.getMessage();
        } finally {
            if (con != null) {
                con.close();
            }
            if (message.equals("")) {
                message = "A hotel is successfully inserted";
            }
        }

        return message;
    }

    public String delete(String hotel_id) throws Exception {
        String message = "";
        Connection con = null;
        ConnectionDB db = new ConnectionDB();

        String deleteQuery = "DELETE FROM Hotel WHERE hotel_id = " + "'" + hotel_id + "'" + ";";

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
                message = "A hotel is successfully deleted";
            }
        }

        return message;
    }

    public String update(Hotel hotel) throws Exception {
        // code
        Connection con = null;
        String message = "";

        ConnectionDB db = new ConnectionDB();

        String newValues = "name=?, street_number=?, street_name=?, unit_number=?";
        String updateQuery = "UPDATE Hotel SET " + newValues + " WHERE hotel_id=?;";

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(updateQuery);

            stmt.setString(1, hotel.getStreetName());
            stmt.setInt(2, hotel.getStreetNumber());
            stmt.setString(3, hotel.getStreetName());
            stmt.setInt(4, hotel.getUnitNumber());
            stmt.setString(5, hotel.getChainID());

            stmt.executeUpdate();
            stmt.close();

        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        } finally {
            if (con != null) {
                con.close();
            }
            if (message.equals("")) {
                message = "Hotel Table Successfully Got Updated";
            }
        }
        return message;
    }
}