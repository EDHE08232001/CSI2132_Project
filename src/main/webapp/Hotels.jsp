<%@ page import="com.CSI2132_Project.Hotel" %>
<%@ page import="com.CSI2132_Project.Hotel_Service" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Hotel_Service hotelService = new Hotel_Service();

    List<Hotel> myHotels = null;

    try {
        myHotels = hotelService.getAll();
    } catch (Exception e) {
        e.printStackTrace();
    }

    //Following three block detect click on buttons
    // getParameter("Button ID")
    if (request.getParameter("delete") != null) {
        // value from user prompt text box
        String hotelID = request.getParameter("hotel_id_delete");
        hotelService.delete(hotelID);
        // Refresh the page after deletion to display updated table
        response.sendRedirect(request.getRequestURI());
    }

    if (request.getParameter("create") != null) {
        String hotelID = request.getParameter("hotel_id_create");
        String chainID = request.getParameter("chain_id_create");
        String streetNumberStr = request.getParameter("street_number_create");
        int streetNumber = Integer.parseInt(streetNumberStr);
        String streetName = request.getParameter("street_name_create");
        String unitNumberStr = request.getParameter("unit_number_create");
        int unitNumber = Integer.parseInt(unitNumberStr);
        String city = request.getParameter("city_create");
        String state = request.getParameter("state_create");
        String country = request.getParameter("country_create");
        String postalCode = request.getParameter("postalcode_create");
        String ratingStr = request.getParameter("rating_dropdown_create");
        int rating = Integer.parseInt(ratingStr);
        String email = request.getParameter("email_create");
        String category = request.getParameter("category_dropdown_create");
        Hotel newHotel = new Hotel(hotelID, chainID, streetNumber, streetName, unitNumber, city, state, country, postalCode, rating, email, category);
        hotelService.create(newHotel);
        // Refresh the page after deletion to display updated table
        response.sendRedirect(request.getRequestURI());
    }

    if (request.getParameter("update") != null) {
        String hotelID = request.getParameter("hotel_id_update");
        String chainID = request.getParameter("chain_id_update");;
        String streetNumberStr = request.getParameter("street_number_update");
        int streetNumber = Integer.parseInt(streetNumberStr);
        String streetName = request.getParameter("street_name_update");
        String unitNumberStr = request.getParameter("unit_number_update");
        int unitNumber = Integer.parseInt(unitNumberStr);
        String city = request.getParameter("city_update");
        String state = request.getParameter("state_update");
        String country = request.getParameter("country_update");
        String postalCode = request.getParameter("postalcode_update");
        String ratingStr = request.getParameter("rating_dropdown_update");
        int rating = Integer.parseInt(ratingStr);
        String email = request.getParameter("email_update");
        String category = request.getParameter("category_dropdown_update");
        Hotel newHotel = new Hotel(hotelID, chainID, streetNumber, streetName, unitNumber, city, state, country, postalCode, rating, email, category);
        hotelService.create(newHotel);
        // Refresh the page after deletion to display updated table
        response.sendRedirect(request.getRequestURI());
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <style>
            table, th, td {border: 1px solid black;}
        </style>
    </head>
    <!--The webpage body-->
    <body>
        <h1 style="text-align:center;">
            <!--Heading-->
            Hotels
        </h1>

        <br> <!--Line Break-->

        <table style="margin-left:auto; margin-right:auto;">
            <thead>
                <!--All Attributes-->
                <tr>
                    <th>Hotel ID</th>
                    <th>Chain ID</th>
                    <th>Street Number</th>
                    <th>Street Name</th>
                    <th>Unit Number</th>
                    <th>City</th>
                    <th>State</th>
                    <th>Country</th>
                    <th>Postal Code</th>
                    <th>Rating</th>
                    <th>Email</th>
                    <th>Category</th>
                </tr>
            </thead>
            <tbody>
                <!---tbody shows tuples->
                <!--A java for loop-->
                <%
                    for (Hotel each : myHotels) {
                %>
                <tr>
                    <td><%= each.getHotelID() %></td>
                    <td><%= each.getChainID() %></td>
                    <td><%= each.getStreetNumber() %></td>
                    <td><%= each.getStreetName() %></td>
                    <td><%= each.getUnitNumber() %></td>
                    <td><%= each.getCity() %></td>
                    <td><%= each.getState() %></td>
                    <td><%= each.getCountry() %></td>
                    <td><%= each.getPostalCode() %></td>
                    <td><%= each.getRating() %></td>
                    <td><%= each.getEmail() %></td>
                    <td><%= each.getCategory() %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <br>

        <!--
            Following three form blocks are button and their labels
            each button has an id, that is needed in the java click detecting blocks
            input tag is for user input
        -->
        <form method="post">
            <label for="hotel_id_create">Enter Hotel ID to Create:</label>
            <input type="text" id="hotel_id_create" name="hotel_id_create">

            <label for="chain_id_create">Enter Chain ID to Create:</label>
            <input type="text" id="chain_id_create" name="chain_id_create">

            <label for="street_number_create">Enter Street Number to Create:</label>
            <input type="text" id="street_number_create" name="street_number_create">

            <label for="street_name_create">Enter Street Name to Create:</label>
            <input type="text" id="street_name_create" name="street_name_create">

            <label for="unit_number_create">Enter Unit Number to Create:</label>
            <input type="text" id="unit_number_create" name="unit_number_create">
            
            <label for="city_create">Enter City to Create:</label>
            <input type="text" id="city_create" name="city_create">

            <label for="state_create">Enter State Create:</label>
            <input type="text" id="state_create" name="state_create">

            <label for="country_create">Enter Country Name to Create:</label>
            <input type="text" id="country_create" name="country_create">

            <label for="postalcode_create">Enter Postal Code to Create:</label>
            <input type="text" id="postalcode_create" name="postalcode_create">

            <label for="rating_create">Enter Rating to Create:</label>
            <select name="rating_dropdown_create" id="rating_dropdown_create">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>

            <label for="email_create">Enter Email to Create:</label>
            <input type="text" id="email_create" name="email_create">

            <label for="category_create">Enter category to Create:</label>
            <select name="category_dropdown_create" id="category_dropdown_create">
                <option value="Casino Hotel">Casino</option>
                <option value="Business Hotel">Business</option>
                <option value="Luxury Hotel">Luxury</option>
            </select>

            <button type="submit" name="create">CREATE</button>
        </form>

        <br>

        <form method="post">
            <label for="hotel_id_update">Enter Hotel ID to Update:</label>
            <input type="text" id="hotel_id_update" name="hotel_id_update">

            <label for="chain_id_update">Enter Chain ID to Update:</label>
            <input type="text" id="chain_id_update" name="chain_id_update">

            <label for="street_number_update">Enter Street Number to Update:</label>
            <input type="text" id="street_number_update" name="street_number_update">

            <label for="street_name_update">Enter Street Name to Update:</label>
            <input type="text" id="street_name_update" name="street_name_update">

            <label for="unit_number_update">Enter Unit Number to Update:</label>
            <input type="text" id="unit_number_update" name="unit_number_update">
            
            <label for="city_update">Enter City to Update:</label>
            <input type="text" id="city_update" name="city_update">

            <label for="state_update">Enter State Update:</label>
            <input type="text" id="state_update" name="state_update">

            <label for="country_update">Enter Country Name to Update:</label>
            <input type="text" id="country_update" name="country_update">

            <label for="postalcode_update">Enter Postal Code to Update:</label>
            <input type="text" id="postalcode_update" name="postalcode_update">

            <label for="rating_update">Enter Rating to Update:</label>
            <select name="rating_dropdown_update" id="rating_dropdown_update">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>

            <label for="email_update">Enter Email to Update:</label>
            <input type="text" id="email_update" name="email_update">

            <label for="category_update">Enter Category to Update:</label>
            <select name="category_dropdown_update" id="category_dropdown_update">
                <option value="Casino Hotel">Casino</option>
                <option value="Business Hotel">Business</option>
                <option value="Luxury Hotel">Luxury</option>
            </select>

            <button type="submit" name="update">UPDATE</button>
        </form>

        <br>

        <form method="post">
            <label for="hotel_id_delete">Enter Hotel ID to delete:</label>
            <input type="text" id="hotel_id_delete" name="hotel_id_delete">
            <button type="submit" name="delete">DELETE</button>
        </form>
    </body>
</html>