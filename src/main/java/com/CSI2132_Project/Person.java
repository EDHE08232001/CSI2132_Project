package com.CSI2132_Project;

public class Person {
    private String sin;
    private String first_name;
    private String last_name;
    private String middle_name;
    private int street_number;
    private String street_name;
    private int unit_number;
    private String city;
    private String state;
    private String country;
    private String postal_code;

    public Person(
            String sin,
            String first_name,
            String last_name,
            String middle_name,
            int street_number,
            String street_name,
            int unit_number,
            String city,
            String state,
            String country,
            String postal_code
    ) {
        this.sin = sin;
        this.first_name = first_name;
        this.last_name = last_name;
        this.middle_name = middle_name;
        this.street_number = street_number;
        this.street_name = street_name;
        this.unit_number = unit_number;
        this.city = city;
        this.state = state;
        this.country = country;
        this.postal_code = postal_code;
    }

    public String getSIN() {
        return sin;
    }

    public String getFirstName() {
        return first_name;
    }

    public String getLastName() {
        return last_name;
    }

    public String getMiddleName() {
        return middle_name;
    }

    public int getStreetNumber() {
        return street_number;
    }

    public String getStreetName() {
        return street_name;
    }

    public int getUnitNumber() {
        return unit_number;
    }

    public String getCity() {
        return city;
    }

    public String getState() {
        return state;
    }

    public String getCountry() {
        return country;
    }

    public String getPostalCode() {
        return postal_code;
    }

    public String toString() {
        return "Person\n"
                +
                "SIN: " + sin
                +
                "\nFirst Name: " + first_name
                +
                "\nLast Name: " + last_name
                +
                "\nMiddle Name: " + middle_name
                +
                "\nStreet Number: " + street_number
                +
                "\nStreet Name: " + street_name
                +
                "\nUnit Number: " + unit_number
                +
                "\nCity: " + city
                +
                "\nState: " + state
                +
                "\nCountry: " + country
                +
                "\nPostal Code: " + postal_code;
    }
}
