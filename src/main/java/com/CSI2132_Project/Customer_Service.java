package com.CSI2132_Project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Customer_Service {
    // code
    public List<Customer> getAll() throws Exception {
        String sql = "SELECT * FROM Customer;";

        ConnectionDB db = new ConnectionDB();

        List<Customer> customers = new ArrayList<>();

        try (Connection con = db.getConnection()) {
            // code
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Customer customer = new Customer(
                        rs.getString("SIN"),
                        rs.getDate("registration_date")
                );
                customers.add(customer);
            }
            rs.close();
            stmt.close();
            con.close();
            db.close();

            return customers;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public String create(Customer customer) throws Exception {
        //code
        String message = "";
        Connection con = null;

        ConnectionDB db = new ConnectionDB();
        System.out.println(customer);

        String attributes = "(SIN, registration_date)";
        String insertedValues = "(?, ?)";
        String insertHotelChainQuery = "INSERT INTO Customer " + attributes + " VALUES " + insertedValues + ";";

        try {
            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(insertHotelChainQuery);

            stmt.setString(1, customer.getSIN());
            stmt.setDate(2, customer.getRegistrationDate());

            int output = stmt.executeUpdate();
            System.out.println(output);

            stmt.close();
            db.close();
        } catch (Exception e) {
            message = "Error while inserting a customer: " + e.getMessage();
        } finally {
            if (con != null) {
                con.close();
            }
            if (message.equals("")) {
                message = "An customer is successfully inserted";
            }
        }

        return message;
    }

    public String delete(String SIN) throws Exception {
        String message = "";
        Connection con = null;
        ConnectionDB db = new ConnectionDB();

        String deleteQuery = "DELETE FROM Customer WHERE SIN = " + "'" + SIN + "'" + ";";

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
                message = "A customer is successfully deleted";
            }
        }

        return message;
    }

    public String update(Customer customer) throws Exception {
        // code
        Connection con = null;
        String message = "";

        ConnectionDB db = new ConnectionDB();

        String newValues = "registration_date=?";
        String updateQuery = "UPDATE Customer SET " + newValues + " WHERE SIN=?;";

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(updateQuery);

            stmt.setDate(1, customer.getRegistrationDate());
            stmt.setString(2, customer.getSIN());

            stmt.executeUpdate();
            stmt.close();

        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        } finally {
            if (con != null) {
                con.close();
            }
            if (message.equals("")) {
                message = "Customer Table Successfully Got Updated";
            }
        }
        return message;
    }
}
