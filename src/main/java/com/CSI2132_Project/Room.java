package com.CSI2132_Project;

public class Room {
    private int room_number;
    private String hotel_id;
    private double price;
    private int capacity;
    private int max_capacity;

    public Room(int room_number, String hotel_id, double price, int capacity, int max_capacity) {
        this.room_number = room_number;
        this.hotel_id = hotel_id;
        this.price = price;
        this.capacity = capacity;
        this.max_capacity = max_capacity;
    }

    public int getRoomNumber() {
        return room_number;
    }

    public String getHotelID() {
        return hotel_id;
    }

    public double getPrice() {
        return price;
    }

    public int getCapacity() {
        return capacity;
    }

    public int getMaxCapacity() {
        return max_capacity;
    }

    public String toString() {
        return "Room\n"
                +
                "\nRoom Number: " + room_number
                +
                "\nHotel ID: " + hotel_id
                +
                "\nPrice: " + price
                +
                "\nCapacity: " + capacity
                +
                "\nMax Capacity: " + max_capacity;
    }
}