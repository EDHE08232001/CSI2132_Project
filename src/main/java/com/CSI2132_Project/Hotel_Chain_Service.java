package com.CSI2132_Project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Hotel_Chain_Service {
    public static void main(String[] args) throws Exception {
        Hotel_Chain hotelChain = new Hotel_Chain(
                "C007",
                "My Ass",
                123,
                "Union",
                24,
                "Miami",
                "FL",
                "USA",
                "90000"
        );
        Hotel_Chain_Service myService = new Hotel_Chain_Service();
        //myService.create(hotelChain);
        myService.delete("C007");
    }
    // code
    public List<Hotel_Chain> getAll() throws Exception {
        String sql = "SELECT * FROM Hotel_Chain;";

        ConnectionDB db = new ConnectionDB();

        List<Hotel_Chain> hotelChains = new ArrayList<>();

        try (Connection con = db.getConnection()) {
            // code
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Hotel_Chain hotelChain = new Hotel_Chain(
                        rs.getString("chain_id"),
                        rs.getString("name"),
                        rs.getInt("street_number"),
                        rs.getString("street_name"),
                        rs.getInt("unit_number"),
                        rs.getString("city"),
                        rs.getString("state"),
                        rs.getString("country"),
                        rs.getString("postal_code")
                );
                hotelChains.add(hotelChain);
            }
            rs.close();
            stmt.close();
            con.close();
            db.close();

            return hotelChains;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public String create(Hotel_Chain hotelChain) throws Exception {
        //code
        String message = "";
        Connection con = null;

        ConnectionDB db = new ConnectionDB();
        System.out.println(hotelChain);

        String attributes = "(chain_id, name, street_number, street_name, unit_number, city, state, country, postal_code)";
        String insertedValues = "(?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String insertHotelChainQuery = "INSERT INTO Hotel_Chain " + attributes + " VALUES " + insertedValues + ";";

        try {
            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(insertHotelChainQuery);

            stmt.setString(1, hotelChain.getChainID());
            stmt.setString(2, hotelChain.getName());
            stmt.setInt(3, hotelChain.getStreetNumber());
            stmt.setString(4, hotelChain.getStreetName());
            stmt.setInt(5, hotelChain.getUnitNumber());
            stmt.setString(6, hotelChain.getCity());
            stmt.setString(7, hotelChain.getState());
            stmt.setString(8, hotelChain.getCountry());
            stmt.setString(9, hotelChain.getPostalCode());

            int output = stmt.executeUpdate();
            System.out.println(output);

            stmt.close();
            db.close();
        } catch (Exception e) {
            message = "Error while inserting a hotel chain: " + e.getMessage();
        } finally {
            if (con != null) {
                con.close();
            }
            if (message.equals("")) {
                message = "A hotel chain is successfully inserted";
            }
        }

        return message;
    }

    public String delete(String chain_id) throws Exception {
        String message = "";
        Connection con = null;
        ConnectionDB db = new ConnectionDB();

        String deleteQuery = "DELETE FROM Hotel_Chain WHERE chain_id = " + "'" + chain_id + "'" + ";";

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
                message = "A chain is successfully deleted";
            }
        }

        return message;
    }

    public String update(Hotel_Chain hotelChain) throws Exception {
        // code
        Connection con = null;
        String message = "";

        ConnectionDB db = new ConnectionDB();

        String newValues = "name=?, street_number=?, street_name=?, unit_number=?";
        String updateQuery = "UPDATE Hotel_Chain SET " + newValues + " WHERE chain_id=?;";

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(updateQuery);

            stmt.setString(1, hotelChain.getStreetName());
            stmt.setInt(2, hotelChain.getStreetNumber());
            stmt.setString(3, hotelChain.getStreetName());
            stmt.setInt(4, hotelChain.getUnitNumber());
            stmt.setString(5, hotelChain.getChainID());

            stmt.executeUpdate();
            stmt.close();

        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        } finally {
            if (con != null) {
                con.close();
            }
            if (message.equals("")) {
                message = "Hotel Chain Table Successfully Got Updated";
            }
        }
        return message;
    }
}
