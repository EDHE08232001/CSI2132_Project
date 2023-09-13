package com.CSI2132_Project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Person_Service {
    // code
    public List<Person> getAll() throws Exception {
        String sql = "SELECT * FROM Person;";

        ConnectionDB db = new ConnectionDB();

        List<Person> persons = new ArrayList<>();

        try (Connection con = db.getConnection()) {
            // code
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Person person = new Person(
                        rs.getString("SIN"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("last_name"),
                        rs.getInt("street_number"),
                        rs.getString("street_name"),
                        rs.getInt("unit_number"),
                        rs.getString("city"),
                        rs.getString("state"),
                        rs.getString("country"),
                        rs.getString("postal_code")
                );
                persons.add(person);
            }
            rs.close();
            stmt.close();
            con.close();
            db.close();

            return persons;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public String create(Person person) throws Exception {
        //code
        String message = "";
        Connection con = null;

        ConnectionDB db = new ConnectionDB();
        System.out.println(person);

        String attributes = "(SIN, first_name, last_name, middle_name, street_number, street_name, unit_number, city, state, country, postal_code)";
        String insertedValues = "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String insertHotelChainQuery = "INSERT INTO Person " + attributes + " VALUES " + insertedValues + ";";

        try {
            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(insertHotelChainQuery);
            stmt.setString(1, person.getSIN());
            stmt.setString(2, person.getFirstName());
            stmt.setString(3, person.getLastName());
            stmt.setString(4, person.getMiddleName());
            stmt.setInt(5, person.getStreetNumber());
            stmt.setString(6, person.getStreetName());
            stmt.setInt(7, person.getUnitNumber());
            stmt.setString(8, person.getCity());
            stmt.setString(9, person.getState());
            stmt.setString(10, person.getCountry());
            stmt.setString(11, person.getPostalCode());

            int output = stmt.executeUpdate();
            System.out.println(output);

            stmt.close();
            db.close();
        } catch (Exception e) {
            message = "Error while inserting person: " + e.getMessage();
        } finally {
            if (con != null) {
                con.close();
            }
            if (message.equals("")) {
                message = "A person is successfully inserted";
            }
        }

        return message;
    }

    public String delete(String sin) throws Exception {
        String message = "";
        Connection con = null;
        ConnectionDB db = new ConnectionDB();

        String deleteQuery = "DELETE FROM Person WHERE SIN = " + "'" + sin + "'" + ";";

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
                message = "A person is successfully deleted";
            }
        }

        return message;
    }

    public String update(Person person) throws Exception {
        // code
        Connection con = null;
        String message = "";

        ConnectionDB db = new ConnectionDB();

        String newValues = "street_number=?, street_name=?, unit_number=?";
        String updateQuery = "UPDATE Person SET " + newValues + " WHERE SIN=?;";

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(updateQuery);

            stmt.setInt(1, person.getStreetNumber());
            stmt.setString(2, person.getStreetName());
            stmt.setInt(3, person.getUnitNumber());
            stmt.setString(4, person.getSIN());

            stmt.executeUpdate();
            stmt.close();

        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        } finally {
            if (con != null) {
                con.close();
            }
            if (message.equals("")) {
                message = "Person Table Successfully Got Updated";
            }
        }
        return message;
    }
}
