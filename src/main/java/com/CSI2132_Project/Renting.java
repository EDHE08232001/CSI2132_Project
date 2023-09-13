package com.CSI2132_Project;

import java.sql.Date;

public class Renting {
    private String booking_id;
    private int cc_number;
    private Date expiry_date;

    public Renting(String booking_id, int cc_number, Date expiry_date) {
        this.booking_id = booking_id;
        this.cc_number = cc_number;
        this.expiry_date = expiry_date;
    }

    public String getBooking_id() {
        return booking_id;
    }

    public int getCcNumber() {
        return cc_number;
    }

    public Date getExpiryDate() {
        return expiry_date;
    }

    public String toString() {
        return "Employee\n"
                +
                "Booking ID: " + booking_id
                +
                "\nCC Number: " + cc_number
                +
                "\nExpiry Date: " + expiry_date;
    }
}
