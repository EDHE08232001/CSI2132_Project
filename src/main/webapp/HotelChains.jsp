<%@ page import="com.CSI2132_Project.Hotel_Chain" %>
<%@ page import="com.CSI2132_Project.Hotel_Chain_Service" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //chainService object: used to get information and make change to table Hotel_Chain
    Hotel_Chain_Service chainService = new Hotel_Chain_Service();

    // A list of Hotel_Chain objects
    List<Hotel_Chain> myChains = null;

    try {
        myChains = chainService.getAll();
    } catch (Exception e) {
        e.printStackTrace();
    }

    //Following three block detect click on buttons
    // getParameter("Button ID")
    if (request.getParameter("delete") != null) {
        // value from user prompt text box
        String chainID = request.getParameter("chain_id_delete");
        chainService.delete(chainID);
        // Refresh the page after deletion to display updated table
        response.sendRedirect(request.getRequestURI());
    }

    if (request.getParameter("create") != null) {
        String chainID = request.getParameter("chain_id_create");
        String name = request.getParameter("name_create");
        String streetNumberStr = request.getParameter("street_number_create");
        int streetNumber = Integer.parseInt(streetNumberStr);
        String streetName = request.getParameter("street_name_create");
        String unitNumberStr = request.getParameter("unit_number_create");
        int unitNumber = Integer.parseInt(unitNumberStr);
        String city = request.getParameter("city_create");
        String state = request.getParameter("state_create");
        String country = request.getParameter("country_create");
        String postalCode = request.getParameter("postalcode_create");
        Hotel_Chain newHotelChain = new Hotel_Chain(chainID, name, streetNumber, streetName, unitNumber, city, state, country, postalCode);
        chainService.create(newHotelChain);
        // Refresh the page after deletion to display updated table
        response.sendRedirect(request.getRequestURI());
    }

    if (request.getParameter("update") != null) {
        String chainID = request.getParameter("chain_id_update");
        String name = request.getParameter("name_update");
        String streetNumberStr = request.getParameter("street_number_update");
        int streetNumber = Integer.parseInt(streetNumberStr);
        String streetName = request.getParameter("street_name_update");
        String unitNumberStr = request.getParameter("unit_number_update");
        int unitNumber = Integer.parseInt(unitNumberStr);
        String city = request.getParameter("city_update");
        String state = request.getParameter("state_update");
        String country = request.getParameter("country_update");
        String postalCode = request.getParameter("postalcode_update");
        Hotel_Chain newHotelChain = new Hotel_Chain(chainID, name, streetNumber, streetName, unitNumber, city, state, country, postalCode);
        chainService.create(newHotelChain);
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
            Hotel Chains
        </h1>

        <br> <!--Line Break-->

        <table style="margin-left:auto; margin-right:auto;">
            <!--A table that shows all tuples in table Hotel_Chain-->
            <thead>
                <!--All Attributes-->
                <tr>
                    <th>Chain ID</th>
                    <th>Name</th>
                    <th>Street Number</th>
                    <th>Street Name</th>
                    <th>Unit Number</th>
                    <th>City</th>
                    <th>State</th>
                    <th>Country</th>
                    <th>Postal Code</th>
                </tr>
            </thead>
            <tbody>
                <!---tbody shows tuples->
                <!--A java for loop-->
                <%
                    for (Hotel_Chain each : myChains) {
                %>
                <tr>
                    <td><%= each.getChainID() %></td>
                    <td><%= each.getName() %></td>
                    <td><%= each.getStreetNumber() %></td>
                    <td><%= each.getStreetName() %></td>
                    <td><%= each.getUnitNumber() %></td>
                    <td><%= each.getCity() %></td>
                    <td><%= each.getState() %></td>
                    <td><%= each.getCountry() %></td>
                    <td><%= each.getPostalCode() %></td>

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

            <label for="chain_id_create">Enter Chain ID to Create:</label>
            <input type="text" id="chain_id_create" name="chain_id_create">

            <label for="name_create">Enter name to Create:</label>
            <input type="text" id="name_create" name="name_create">

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

            <button type="submit" name="create">CREATE</button>
        </form>

        <br>

        <form method="post">
            <label for="chain_id_update">Enter Chain ID to Update:</label>
            <input type="text" id="chain_id_update" name="chain_id_update">

            <label for="name_update">Enter name to Update:</label>
            <input type="text" id="name_update" name="name_update">

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

            <button type="submit" name="update">UPDATE</button>
        </form>

        <br>

        <form method="post">
            <label for="chain_id_delete">Enter Chain ID to delete:</label>
            <input type="text" id="chain_id_delete" name="chain_id_delete">
            <button type="submit" name="delete">DELETE</button>
        </form>
    </body>
</html>