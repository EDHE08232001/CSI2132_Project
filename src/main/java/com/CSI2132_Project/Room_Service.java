package com.CSI2132_Project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Room_Service {
    public static void main (String[] args) throws Exception {
        Room_Service myService = new Room_Service();
        Room room = new Room(10, "H005B", 89.98, 5, 6);
        //myService.create(room);
        myService.delete(10);
    }
    // code
    public List<Room> getAll() throws Exception {
        String sql = "SELECT * FROM Room;";

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
        String insertHotelChainQuery = "INSERT INTO Room " + attributes + " VALUES " + insertedValues + ";";

        try {
            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(insertHotelChainQuery);

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
            message = "Error while inserting a hotel chain: " + e.getMessage();
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

    public String delete(int room_number) throws Exception {
        String message = "";
        Connection con = null;
        ConnectionDB db = new ConnectionDB();

        String deleteQuery = "DELETE FROM Room WHERE room_number = " + room_number + ";";

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

    public String update(Room room) throws Exception {
        // code
        Connection con = null;
        String message = "";

        ConnectionDB db = new ConnectionDB();

        String newValues = "price=?, capacity=?, max_capacity=?";
        String updateQuery = "UPDATE Room SET " + newValues + " WHERE room_number=?;";

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(updateQuery);

            stmt.setDouble(1, room.getPrice());
            stmt.setInt(2, room.getCapacity());
            stmt.setInt(3, room.getMaxCapacity());

            stmt.executeUpdate();
            stmt.close();

        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        } finally {
            if (con != null) {
                con.close();
            }
            if (message.equals("")) {
                message = "Room Table Successfully Got Updated";
            }
        }
        return message;
    }

    public String available(Room room) throws Exception {
        Booking_Service bookingService = new Booking_Service();
        List<Booking> bookings = bookingService.getAll();
        Connection con = null;
        String message ="";
        ConnectionDB db = new ConnectionDB();
        String hotel_id = room.getHotelID();
        int roomNum = room.getRoomNumber();

        for (Booking each : bookings) {
            String booking_hotel_id = each.getHotelID();
            int booking_room_number = each.getRoomNumber();

            if (hotel_id.equals(booking_hotel_id) && roomNum == booking_room_number) {
                return "Occupied";
            }
        }

        return "Available";
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

    public void searchRooms(String city) throws Exception {
        System.out.println("Searching");
        String sql = "SELECT * FROM Room WHERE hotel_id IN (SELECT hotel_id FROM Hotel WHERE city = '" + city + "'" + ");";

        RoomsByCity roomsByCity = new RoomsByCity();

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
                        rs.getFloat("price"),
                        rs.getInt("capacity"),
                        rs.getInt("max_capacity")
                );
                rooms.add(room);
            }
            rs.close();
            stmt.close();
            con.close();
            db.close();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }

        for (Room each : rooms) {
            roomsByCity.create(each);
        }
    }
}
