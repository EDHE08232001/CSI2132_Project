<%@ page import="com.CSI2132_Project.Renting" %>
<%@ page import="com.CSI2132_Project.Renting_Service" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Renting_Service rentingService = new Renting_Service();

    List<Renting> myRentings = null;

    try {
        myRentings = rentingService.getAll();
    } catch (Exception e) {
        e.printStackTrace();
    }

    // Following three blocks detect click on buttons
    // Block 1: Code for deleting a Renting record
    // Check if "delete" button is clicked
    if (request.getParameter("delete") != null) {
        // Get Booking ID value entered by user in the text box
        String bookingId = request.getParameter("booking_id_delete");
        // Call Renting_Service method to delete the record from the database table
        rentingService.delete(bookingId);
        // Refresh the page after deletion to display updated table
        response.sendRedirect(request.getRequestURI());
    }

    // Block 2: Code for creating a new Renting record
    // Check if "create" button is clicked
    if (request.getParameter("create") != null) {
        // Get values entered by user in the text boxes
        String bookingId = request.getParameter("booking_id_create");
        String ccNumStr = request.getParameter("cc_number_create");
        int ccNum = Integer.parseInt(ccNumStr);
        Date expiryDate = Date.valueOf(request.getParameter("expiry_date_create"));
        // Create a new Renting object with the entered values
        Renting newRenting = new Renting(bookingId, ccNum, expiryDate);
        // Call Renting_Service method to insert the record into the database table
        rentingService.create(newRenting);
        // Refresh the page after deletion to display updated table
        response.sendRedirect(request.getRequestURI());
    }

    // Block 3: Code for updating an existing Renting record
    // Check if "update" button is clicked
    if (request.getParameter("update") != null) {
        // Get values entered by user in the text boxes
        String bookingId = request.getParameter("booking_id_update");
        String ccNumStr = request.getParameter("cc_number_update");
        int ccNum = Integer.parseInt(ccNumStr);
        Date expiryDate = Date.valueOf(request.getParameter("expiry_date_update"));
        // Create a new Renting object with the entered values
        Renting newRenting = new Renting(bookingId, ccNum, expiryDate);
        // Call Renting_Service method to update the record in the database table
        rentingService.update(newRenting);
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
            Rentings
        </h1>

        <br> <!--Line Break-->

        <table style="margin-left:auto; margin-right:auto;">
            <thead>
                <!--All Attributes-->
                <tr>
                    <th>Booking ID</th>
                    <th>CC Number</th>
                    <th>Expiry Date</th>
                </tr>
            </thead>
            <tbody>
                <!---tbody shows tuples->
                <!--A java for loop-->
                <%
                    for (Renting each : myRentings) {
                %>
                <tr>
                    <td><%= each.getBooking_id() %></td>
                    <td><%= each.getCcNumber() %></td>
                    <td><%= each.getExpiryDate() %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <br>

        <!--
            Following Forms:

            The first form is used for creating a new booking record, where the user enters the booking ID, credit card
            number, and expiry date. Upon submission, this data would be sent to the backend system to create the new
            record.

            The second form is used for updating an existing booking record. The user enters the booking ID for the
            record they want to update, as well as the updated credit card number and expiry date. Upon submission,
            this data would be sent to the backend system to update the specified record.

            The third form is used for deleting an existing booking record. The user enters the booking ID for the
            record they want to delete, and upon submission, the backend system would delete the specified record.
        -->

        <!-- Form for creating a new booking record -->
        <form method="post">
            <label for="booking_id_create">Enter Booking ID to Create:</label>
            <input type="text" id="booking_id_create" name="booking_id_create">

            <label for="cc_number_create">Enter CC Number to Create:</label>
            <input type="text" id="cc_number_create" name="cc_number_create">

            <label for="expiry_date_create">Enter Expiry Date to Create:</label>
            <input type="text" id="expiry_date_create" name="expiry_date_create">

            <button type="submit" name="create">CREATE</button>
        </form>

        <br>

        <!-- Form for updating an existing booking record -->
        <form method="post">
            <label for="booking_id_update">Enter Booking ID to Update:</label>
            <input type="text" id="booking_id_update" name="booking_id_update">

            <label for="cc_number_create">Enter CC Number to Update:</label>
            <input type="text" id="cc_number_update" name="cc_number_update">

            <label for="expiry_date_update">Enter Expiry Date to Update:</label>
            <input type="text" id="expiry_date_update" name="expiry_date_update">

            <button type="submit" name="update">UPDATE</button>
        </form>

        <br>

        <!-- Form for deleting an existing booking record -->
        <form method="post">
            <label for="booking_id_delete">Enter Booking ID to delete:</label>
            <input type="text" id="booking_id_delete" name="booking_id_delete">
            <button type="submit" name="delete">DELETE</button>
        </form>
    </body>
</html>