package com.CSI2132_Project;

public class Hotel {
    private String hotel_id;
    private String chain_id;
    private int street_number;
    private String street_name;
    private int unit_number;
    private String city;
    private String state;
    private String country;
    private String postal_code;
    private int rating;
    private String email;
    private String category;

    public Hotel(
            String hotel_id,
            String chain_id,
            int street_number,
            String street_name,
            int unit_number,
            String city,
            String state,
            String country,
            String postal_code,
            int rating,
            String email,
            String category
    ) {
        this.hotel_id = hotel_id;
        this.chain_id = chain_id;
        this.street_number = street_number;
        this.street_name = street_name;
        this.unit_number = unit_number;
        this.city = city;
        this.state = state;
        this.country = country;
        this.postal_code = postal_code;
        this.rating = rating;
        this.email = email;
        this.category = category;
    }

    public String getHotelID() {
        return hotel_id;
    }

    public String getChainID() {
        return chain_id;
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

    public int getRating() {
        return rating;
    }

    public String getEmail() {
        return email;
    }

    public String getCategory() {
        return category;
    }

    public String toString() {
        return "Hotel\n"
                +
                "Hotel ID: " + hotel_id
                +
                "\nChain ID: " + chain_id
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
                "\nPostal Code: " + postal_code
                +
                "\nRating: " + rating
                +
                "\nEmail: " + email
                +
                "\nCategory: " + category;
    }
}
