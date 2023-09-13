package com.CSI2132_Project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDB {
    // code
    private final String ipAddress = "";
    private final String dbServerPort = "";
    private final String dbName = "";
    private final String url = "jdbc:postgresql://localhost:5432/postgres";
    private final String dbusername = "postgres";
    private final String dbpassword = "edward0823";

    private Connection con = null;

    public Connection getConnection() throws Exception {
        try {
            // code
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, dbusername, dbpassword);
            return con;
        } catch (Exception e) {
            // code
            throw new Exception("Could not establish connection with database server: " + e.getMessage());
        }
    }


    public void close() throws SQLException {
        try {
            // code
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            // code
            throw new SQLException("Could not close connection with the database server: " + e.getMessage());
        }
    }
}
