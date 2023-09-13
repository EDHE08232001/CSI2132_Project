package com.CSI2132_Project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RoomsByCity {
    public List<Room> getAll() throws Exception {
        String sql = "SELECT * FROM RoomsByCity;";

        ConnectionDB db = new ConnectionDB();

        List<Room> rooms = new ArrayList<>();

        try (Connection con = db.getConnection()) {
            // code
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Room room = new Room(
                        rs.getInt("room_number"),
                        rs.getString("hotel_id"),
                        rs.getDouble("price"),
                        rs.getInt("capacity"),
                        rs.getInt("max_capacity")
                );
                rooms.add(room);
            }
            rs.close();
            stmt.close();
            con.close();
            db.close();

            return rooms;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }
    public String create(Room room) throws Exception {
        //code
        String message = "";
        Connection con = null;

        ConnectionDB db = new ConnectionDB();
        System.out.println(room);

        String attributes = "(room_number, hotel_id, price, capacity, max_capacity)";
        String insertedValues = "(?, ?, ?, ?, ?)";
        String insertRoomByCityQuery = "INSERT INTO RoomsByCity " + attributes + " VALUES " + insertedValues + ";";

        try {
            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(insertRoomByCityQuery);

            stmt.setInt(1, room.getRoomNumber());
            stmt.setString(2, room.getHotelID());
            stmt.setDouble(3, room.getPrice());
            stmt.setInt(4, room.getCapacity());
            stmt.setInt(5, room.getMaxCapacity());

            int output = stmt.executeUpdate();
            System.out.println(output);

            stmt.close();
            db.close();
        } catch (Exception e) {
            message = "Error while inserting a Room: " + e.getMessage();
        } finally {
            if (con != null) {
                con.close();
            }
            if (message.equals("")) {
                message = "A room is successfully inserted";
            }
        }

        return message;
    }

    public String deleteAll() throws Exception {
        String message = "";
        Connection con = null;
        ConnectionDB db = new ConnectionDB();

        String deleteQuery = "DELETE FROM RoomsByCity;";

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
                message = "A room is successfully deleted";
            }
        }
        return message;
    }
}
