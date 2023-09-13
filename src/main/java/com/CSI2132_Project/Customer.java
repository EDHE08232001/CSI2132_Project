package com.CSI2132_Project;

import java.sql.Date;

public class Customer {
    private String sin;

    private Date registration_date;

    public Customer(String sin, Date registration_date) {
        this.sin = sin;
        this.registration_date = registration_date;
    }

    public String getSIN() {
        return sin;
    }

    public Date getRegistrationDate() {
        return registration_date;
    }

    public String toString() {
        return "Customer\n"
                +
                "\nSIN: " + sin
                +
                "\nRegistration Date: " + registration_date;
    }
}