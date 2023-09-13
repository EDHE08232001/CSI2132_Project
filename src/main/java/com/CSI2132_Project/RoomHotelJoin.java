package com.CSI2132_Project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RoomHotelJoin {
    public static void main (String[] args) throws Exception {
        RoomHotelJoin myJ = new RoomHotelJoin();
        //myJ.searchQuery("Miami", 0, 0);
        //System.out.println(myJ.getAll());
        myJ.deleteAll();

    }
    List<RoomHotelJoinObject> roomHotelJoinObjects = new ArrayList<>();

    public List<RoomHotelJoinObject> selectAll() throws Exception {
        String sql = "SELECT h.hotel_id, h.chain_id, h.street_number, h.street_name, h.unit_number, h.city, h.state, h.country, h.postal_code, h.rating, h.email, h.category, r.room_number, r.price, r.capacity, r.max_capacity FROM Hotel h JOIN Room r ON h.hotel_id = r.hotel_id;";
        ConnectionDB db = new ConnectionDB();

        try(Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                RoomHotelJoinObject eachObject = new RoomHotelJoinObject(
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
                        rs.getString("category"),
                        rs.getInt("room_number"),
                        rs.getFloat("price"),
                        rs.getInt("capacity"),
                        rs.getInt("max_capacity")
                );
                roomHotelJoinObjects.add(eachObject);
            }
            rs.close();
            stmt.close();
            con.close();
            db.close();

            return roomHotelJoinObjects;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public List<RoomHotelJoinObject> getAll() throws Exception {
        String sql = "SELECT * FROM Hotel_Room_Join;";

        ConnectionDB db = new ConnectionDB();

        List<RoomHotelJoinObject> myObjects = new ArrayList<>();

        try (Connection con = db.getConnection()) {
            // code
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                RoomHotelJoinObject eachObject = new RoomHotelJoinObject(
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
                        rs.getString("category"),
                        rs.getInt("room_number"),
                        rs.getDouble("price"),
                        rs.getInt("capacity"),
                        rs.getInt("max_capacity")
                );
                myObjects.add(eachObject);
            }
            rs.close();
            stmt.close();
            con.close();
            db.close();

            return myObjects;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public static String create(RoomHotelJoinObject roomHotelJoinObject) throws Exception {
        //code
        String message = "";
        Connection con = null;

        ConnectionDB db = new ConnectionDB();
        System.out.println(roomHotelJoinObject);
        String attributes = "(hotel_id, chain_id, street_number, street_name, unit_number, city, state, country, postal_code, rating, email, category, room_number, price, capacity, max_capacity)";
        String insertedValues = "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String insertHotelChainQuery = "INSERT INTO Hotel_Room_Join " + attributes + " VALUES " + insertedValues + ";";

        try {
            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(insertHotelChainQuery);

            stmt.setString(1, roomHotelJoinObject.getHotelID());
            stmt.setString(2, roomHotelJoinObject.getChainID());
            stmt.setInt(3, roomHotelJoinObject.getStreetNumber());
            stmt.setString(4, roomHotelJoinObject.getStreetName());
            stmt.setInt(5, roomHotelJoinObject.getUnitNumber());
            stmt.setString(6, roomHotelJoinObject.getCity());
            stmt.setString(7, roomHotelJoinObject.getState());
            stmt.setString(8, roomHotelJoinObject.getCountry());
            stmt.setString(9, roomHotelJoinObject.getPostalCode());
            stmt.setInt(10, roomHotelJoinObject.getRating());
            stmt.setString(11, roomHotelJoinObject.getEmail());
            stmt.setString(12, roomHotelJoinObject.getCategory());
            stmt.setInt(13, roomHotelJoinObject.getRoomNumber());
            stmt.setDouble(14, roomHotelJoinObject.getPrice());
            stmt.setInt(15, roomHotelJoinObject.getCapacity());
            stmt.setInt(16, roomHotelJoinObject.getMaxCapacity());

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

    public List<RoomHotelJoinObject> searchQuery(String city, int capacity, double price, String chainId, int rating, String hotelId) throws Exception {
        System.out.println("Searching");
        //code
        List<RoomHotelJoinObject> myObjects = searchWithJava(city, capacity, price, chainId, rating, hotelId);
        List<RoomHotelJoinObject> returnedObjects = new ArrayList<>();
        for (RoomHotelJoinObject each : myObjects) {
            create(each);
        }

        ConnectionDB db = new ConnectionDB();
        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM Hotel_Room_Join");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                RoomHotelJoinObject eachObject = new RoomHotelJoinObject(
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
                        rs.getString("category"),
                        rs.getInt("room_number"),
                        rs.getFloat("price"),
                        rs.getInt("capacity"),
                        rs.getInt("max_capacity")
                );
                returnedObjects.add(eachObject);
            }
            rs.close();
            stmt.close();
            con.close();
            db.close();
            return returnedObjects;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public List<RoomHotelJoinObject> searchWithJava(String city, int capacity, double price, String chain_id, int rating, String hotel_id) throws Exception {
        List<RoomHotelJoinObject> desiredObjects = new ArrayList<>();
        for (RoomHotelJoinObject each : selectAll()) {
            String eachCity =  each.getCity();
            String eachHotelId = each.getHotelID();
            int eachCapacity = each.getCapacity();
            double eachPrice = each.getPrice();
            String eachChainId = each.getChainID();
            int eachRating = each.getRating();
            if (eachCity.equals(city) && eachCapacity == capacity && eachPrice <= price && eachChainId.equals(chain_id) && eachRating == rating) {
                desiredObjects.add(each);
            } else if (eachCity.equals(city)) {
                if (eachChainId.equals(chain_id)) {
                    if (eachRating == rating) {
                        desiredObjects.add(each);
                    } else if (eachCapacity == capacity) {
                        desiredObjects.add(each);
                    } else if (eachPrice <= price) {
                        desiredObjects.add(each);
                    }
                }
            } else if (eachHotelId.equals(hotel_id)) {
                desiredObjects.add(each);
            }
        }
        return desiredObjects;
    }



    public void deleteAll() throws Exception {
        String message = "";
        Connection con = null;
        ConnectionDB db = new ConnectionDB();

        String deleteQuery = "DELETE FROM Hotel_Room_Join;";

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
        System.out.println(message);
    }
}