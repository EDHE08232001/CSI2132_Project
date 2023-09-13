package com.CSI2132_Project;

public class Hotel_Chain {
    private String chain_id;
    private String name;
    private int street_number;
    private String street_name;
    private int unit_number;
    private String city;
    private String state;
    private String country;
    private String postal_code;

    public Hotel_Chain(
            String chain_id,
            String name,
            int street_number,
            String street_name,
            int unit_number,
            String city,
            String state,
            String country,
            String postal_code
    ) {
        this.chain_id = chain_id;
        this.name = name;
        this.street_number = street_number;
        this.street_name = street_name;
        this.unit_number = unit_number;
        this.city = city;
        this.state = state;
        this.country = country;
        this.postal_code = postal_code;
    }

    public String getChainID() {
        return chain_id;
    }

    public String getName() {
        return name;
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
        return "Hotel Chain\n"
                +
                "Chain ID: " + chain_id
                +
                "\nName: " + name
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
