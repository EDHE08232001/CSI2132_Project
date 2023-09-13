<%@ page import="com.CSI2132_Project.Booking" %>
<%@ page import="com.CSI2132_Project.Booking_Service" %>
<%@ page import="java.util.*" %>
<%@page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Booking_Service bookingService = new Booking_Service();

    List<Booking> myBookings = null;

    try {
        myBookings = bookingService.getAll();
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    //Following three block detect click on buttons
    // getParameter("Button ID")
    if (request.getParameter("delete") != null) {
        // value from user prompt text box
        String bookingId = request.getParameter("booking_id_delete");
        bookingService.delete(bookingId);
        // Refresh the page after deletion to display updated table
        response.sendRedirect(request.getRequestURI());
    }

    if (request.getParameter("create") != null) {
        String bookingId = request.getParameter("booking_id_create");
        Date checkInDate = Date.valueOf(request.getParameter("check_in_date_create"));
        Date checkOutDate = Date.valueOf(request.getParameter("check_out_date_create"));
        String roomNumberStr = request.getParameter("room_number_create");
        int roomNumber = Integer.parseInt(roomNumberStr);
        String hotelID = request.getParameter("hotel_ID_create");
        String totalPriceStr = request.getParameter("total_price_create");
        float totalPrice = Float.parseFloat(totalPriceStr);
        Booking newBooking = new Booking(bookingId, checkInDate, checkOutDate, roomNumber, hotelID, totalPrice);
        bookingService.create(newBooking);
        // Refresh the page after deletion to display updated table
        response.sendRedirect(request.getRequestURI());
    }

    if (request.getParameter("update") != null) {
        String bookingId = request.getParameter("booking_id_update");
        Date checkInDate = Date.valueOf(request.getParameter("check_in_date_update"));
        Date checkOutDate = Date.valueOf(request.getParameter("check_out_date_update"));
        String roomNumberStr = request.getParameter("room_number_update");
        int roomNumber = Integer.parseInt(roomNumberStr);
        String hotelID = request.getParameter("hotel_ID_update");
        String totalPriceStr = request.getParameter("total_price_update");
        float totalPrice = Float.parseFloat(totalPriceStr);
        Booking newBooking = new Booking(bookingId, checkInDate, checkOutDate, roomNumber, hotelID, totalPrice);
        bookingService.update(newBooking);
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
            Bookings
        </h1>

        <br> <!--Line Break-->

        <table style="margin-left:auto; margin-right:auto;">
            <thead>
                <!--All Attributes-->
                <tr>
                    <th>Booking ID</th>
                    <th>Check-In Date</th>
                    <th>Check-Out Date</th>
                    <th>Room Number</th>
                    <th>Hotel ID</th>
                    <th>Total Price</th>
                </tr>
            </thead>
            <tbody>
                <!---tbody shows tuples->
                <!--A java for loop-->
                <%
                    for (Booking each : myBookings) {
                %>
                <tr>
                    <td><%= each.getBookingID() %></td>
                    <td><%= each.getCheckInDate() %></td>
                    <td><%= each.getCheckOutDate() %></td>
                    <td><%= each.getRoomNumber() %></td>
                    <td><%= each.getHotelID() %></td>
                    <td><%= each.getTotalPrice() %></td>
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
            <label for="booking_id_create">Enter Booking ID to Create:</label>
            <input type="text" id="booking_id_create" name="booking_id_create">

            <label for="check_in_date_create">Enter Check In Date to Create:</label>
            <input type="text" id="check_in_date_create" name="check_in_date_create">

            <label for="check_out_date_create">Enter Check Out Date to Create:</label>
            <input type="text" id="check_out_date_create" name="check_out_date_create">

            <label for="room_number_create">Enter Room Number to Create:</label>
            <input type="text" id="room_number_create" name="room_number_create">

            <label for="hotel_ID_create">Enter Hotel ID to Create:</label>
            <input type="text" id="hotel_ID_create" name="hotel_ID_create">

            <label for="total_price_create">Enter Total Price to Create:</label>
            <input type="text" id="total_price_create" name="total_price_create">

            <button type="submit" name="create">CREATE</button>
        </form>

        <br>

        <form method="post">
            <label for="booking_id_update">Enter Booking ID to Update:</label>
            <input type="text" id="booking_id_update" name="booking_id_update">

            <label for="check_in_date_update">Enter Check In Date to Update:</label>
            <input type="text" id="check_in_date_update" name="check_in_date_update">

            <label for="check_out_date_update">Enter Check Out Date to Update:</label>
            <input type="text" id="check_out_date_update" name="check_out_date_update">

            <label for="room_number_update">Enter Room Number to Update:</label>
            <input type="text" id="room_number_update" name="room_number_update">

            <label for="hotel_ID_update">Enter Hotel ID to Update:</label>
            <input type="text" id="hotel_ID_update" name="hotel_ID_update">

            <label for="total_price_update">Enter Total Price to Update:</label>
            <input type="text" id="total_price_update" name="total_price_update">

            <button type="submit" name="update">UPDATE</button>
        </form>

        <br>

        <form method="post">
            <label for="booking_id_delete">Enter Booking ID to delete:</label>
            <input type="text" id="booking_id_delete" name="booking_id_delete">
            <button type="submit" name="delete">DELETE</button>
        </form>
    </body>
</html>