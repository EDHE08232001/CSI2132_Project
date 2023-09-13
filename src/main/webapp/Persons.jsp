<%@ page import="com.CSI2132_Project.Person" %>
<%@ page import="com.CSI2132_Project.Person_Service" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Person_Service personService = new Person_Service();

    List<Person> people = null;

    try {
        people = personService.getAll();
    } catch (Exception e) {
        e.printStackTrace();
    }

    //Following three block detect click on buttons
    // getParameter("Button ID")
    if (request.getParameter("delete") != null) {
        // value from user prompt text box
        String SIN = request.getParameter("sin_delete");
        personService.delete(SIN);
        // Refresh the page after deletion to display updated table
        response.sendRedirect(request.getRequestURI());
    }

    if (request.getParameter("create") != null) {
        String SIN = request.getParameter("sin_create");
        String firstName = request.getParameter("first_name_create");
        String lastName = request.getParameter("last_name_create");
        String middleName = request.getParameter("middle_name_create");
        String streetNumberStr = request.getParameter("street_number_create");
        int streetNumber = Integer.parseInt(streetNumberStr);
        String streetName = request.getParameter("street_name_create");
        String unitNumberStr = request.getParameter("unit_number_create");
        int unitNumber = Integer.parseInt(unitNumberStr);
        String city = request.getParameter("city_create");
        String state = request.getParameter("state_create");
        String country = request.getParameter("country_create");
        String postalCode = request.getParameter("postalcode_create");
        Person newPerson = new Person(SIN, firstName, lastName, middleName, streetNumber, streetName, unitNumber, city, state, country, postalCode);
        personService.create(newPerson);
        // Refresh the page after deletion to display updated table
        response.sendRedirect(request.getRequestURI());
    }

    if (request.getParameter("update") != null) {
        String SIN = request.getParameter("sin_update");
        String firstName = request.getParameter("first_name_update");
        String lastName = request.getParameter("last_name_update");
        String middleName = request.getParameter("middle_name_update");
        String streetNumberStr = request.getParameter("street_number_update");
        int streetNumber = Integer.parseInt(streetNumberStr);
        String streetName = request.getParameter("street_name_update");
        String unitNumberStr = request.getParameter("unit_number_update");
        int unitNumber = Integer.parseInt(unitNumberStr);
        String city = request.getParameter("city_update");
        String state = request.getParameter("state_update");
        String country = request.getParameter("country_update");
        String postalCode = request.getParameter("postalcode_update");
        Person newPerson = new Person(SIN, firstName, lastName, middleName, streetNumber, streetName, unitNumber, city, state, country, postalCode);
        personService.update(newPerson);
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
            All People
        </h1>

        <br> <!--Line Break-->

        <table style="margin-left:auto; margin-right:auto;">
            <thead>
                <!--All Attributes-->
                <tr>
                    <th>SIN</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Middle Name</th>
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
                    for (Person each : people) {
                %>
                <tr>
                    <td><%= each.getSIN() %></td>
                    <td><%= each.getFirstName() %></td>
                    <td><%= each.getLastName() %></td>
                    <td><%= each.getMiddleName() %></td>
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
            <label for="sin_create">Enter SIN to Create:</label>
            <input type="text" id="sin_create" name="sin_create">

            <label for="first_name_create">Enter First Name to Create:</label>
            <input type="text" id="first_name_create" name="first_name_create">

            <label for="last_name_create">Enter Last Name to Create:</label>
            <input type="text" id="last_name_create" name="last_name_create">

            <label for="middle_name_create">Enter Middle Name to Create:</label>
            <input type="text" id="middle_name_create" name="middle_name_create">

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
            <label for="sin_update">Enter SIN to Update:</label>
            <input type="text" id="sin_update" name="sin_update">

            <label for="first_name_update">Enter First Name to Update:</label>
            <input type="text" id="first_name_update" name="first_name_update">

            <label for="last_name_update">Enter Last Name to Update:</label>
            <input type="text" id="last_name_update" name="last_name_update">

            <label for="middle_name_update">Enter Middle Name to Update:</label>
            <input type="text" id="middle_name_update" name="middle_name_update">

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
            <label for="sin_delete">Enter SIN to delete:</label>
            <input type="text" id="sin_delete" name="sin_delete">
            <button type="submit" name="delete">DELETE</button>
        </form>
    </body>
</html>