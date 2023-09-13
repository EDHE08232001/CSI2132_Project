package com.CSI2132_Project;

import java.sql.Date;

public class Booking {
    private String booking_id;
    private Date check_in_date;
    private Date check_out_date;
    private int room_number;
    private String hotel_id;
    private float total_price;

    public Booking(String booking_id, Date check_in_date, Date check_out_date, int room_number, String hotel_id, float total_price) {
        this.booking_id = booking_id;
        this.check_in_date = check_in_date;
        this.check_out_date = check_out_date;
        this.room_number = room_number;
        this.hotel_id = hotel_id;
        this.total_price = total_price;
    }

    public String getBookingID() {
        return booking_id;
    }

    public Date getCheckInDate() {
        return check_in_date;
    }

    public Date getCheckOutDate() {
        return check_out_date;
    }

    public int getRoomNumber() {
        return room_number;
    }

    public String getHotelID() {
        return hotel_id;
    }

    public float getTotalPrice() {
        return total_price;
    }

    public String toString() {
        return "Employee\n"
                +
                "Booking ID: " + booking_id
                +
                "\nCheck-In-Date: " + check_in_date
                +
                "\nCheck-Out-Date: " + check_out_date
                +
                "\nRoom Number: " + room_number
                +
                "\nHotel ID: " + hotel_id
                +
                "Total Price: " + total_price;
    }
}