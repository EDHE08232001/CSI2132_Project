package com.CSI2132_Project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Employee_Service {
    public static void main(String[] args) throws Exception {
        Employee employee = new Employee("E00006", "E00005", "123", "H005B", 17);
        Employee_Service employeeService = new Employee_Service();
        //employeeService.create(employee);
        employeeService.delete("E00006");
        //System.out.println(employeeService.getAll());
    }
    // code
    public List<Employee> getAll() throws Exception {
        String sql = "SELECT * FROM Employee;";

        ConnectionDB db = new ConnectionDB();

        List<Employee> employees = new ArrayList<>();

        try (Connection con = db.getConnection()) {
            // code
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Employee employee = new Employee(
                        rs.getString("employee_id"),
                        rs.getString("supervisor_id"),
                        rs.getString("SIN"),
                        rs.getString("hotel_id"),
                        rs.getDouble("salary")
                );
                employees.add(employee);
            }
            rs.close();
            stmt.close();
            con.close();
            db.close();

            return employees;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public String create(Employee employee) throws Exception {
        //code
        String message = "";
        Connection con = null;

        ConnectionDB db = new ConnectionDB();
        System.out.println(employee);

        String attributes = "(employee_id, supervisor_id, SIN, hotel_id, salary)";
        String insertedValues = "(?, ?, ?, ?, ?)";
        String insertHotelChainQuery = "INSERT INTO Employee " + attributes + " VALUES " + insertedValues + ";";

        try {
            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(insertHotelChainQuery);

            stmt.setString(1, employee.getEmployeeID());
            stmt.setString(2, employee.getSupervisorID());
            stmt.setString(3, employee.getSIN());
            stmt.setString(4, employee.getHotelID());
            stmt.setDouble(5, employee.getSalary());

            int output = stmt.executeUpdate();
            System.out.println(output);

            stmt.close();
            db.close();
        } catch (Exception e) {
            message = "Error while inserting a employee: " + e.getMessage();
        } finally {
            if (con != null) {
                con.close();
            }
            if (message.equals("")) {
                message = "An employee is successfully inserted";
            }
        }

        return message;
    }

    public String delete(String employee_id) throws Exception {
        String message = "";
        Connection con = null;
        ConnectionDB db = new ConnectionDB();

        String deleteQuery = "DELETE FROM Employee WHERE employee_id = " + "'" + employee_id + "'" + ";";

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
                message = "An employee is successfully deleted";
            }
        }
        return message;
    }

    public String update(Employee employee) throws Exception {
        // code
        Connection con = null;
        String message = "";

        ConnectionDB db = new ConnectionDB();

        String newValues = "salary=?";
        String updateQuery = "UPDATE Employee SET " + newValues + " WHERE employee_id=?;";

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(updateQuery);

            stmt.setDouble(1, employee.getSalary());
            stmt.setString(2, employee.getEmployeeID());

            stmt.executeUpdate();
            stmt.close();

        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        } finally {
            if (con != null) {
                con.close();
            }
            if (message.equals("")) {
                message = "Employee Table Successfully Got Updated";
            }
        }
        return message;
    }
}
