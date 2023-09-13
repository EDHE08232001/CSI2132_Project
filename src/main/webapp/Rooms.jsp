<%@ page import="com.CSI2132_Project.Room" %>
<%@ page import="com.CSI2132_Project.Room_Service" %>
<%@ page import="com.CSI2132_Project.RoomsByCity" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Room_Service roomService = new Room_Service();
    RoomsByCity roomsByCity = new RoomsByCity();

    List<Room> myRooms = null;
    List<Room> myRoomsByCity = null;

    try {
        myRoomsByCity = roomsByCity.getAll();
        roomsByCity.deleteAll();
    } catch (Exception e) {
        e.printStackTrace();
    }

    try {
        myRooms = roomService.getAll();
    } catch (Exception e) {
        e.printStackTrace();
    }

    //Following three block detect click on buttons
    // getParameter("Button ID")
    if (request.getParameter("delete") != null) {
        // value from user prompt text box
        String roomNumberStr = request.getParameter("room_number_delete");
        int roomNum = Integer.parseInt(roomNumberStr);

        roomService.delete(roomNum);
        // Refresh the page after deletion to display updated table
        response.sendRedirect(request.getRequestURI());
    }

    if (request.getParameter("create") != null) {
        String roomNumberStr = request.getParameter("room_number_create");
        int roomNumber = Integer.parseInt(roomNumberStr);
        String hotelID = request.getParameter("hotel_id_create");
        String priceStr = request.getParameter("price_create");
        double price = Double.parseDouble(priceStr);
        String capacityStr = request.getParameter("capacity_create");
        int capacity = Integer.parseInt(capacityStr);
        String maxCapacityStr = request.getParameter("max_capacity_create");
        int maxCapacity = Integer.parseInt(maxCapacityStr);
        Room newRoom = new Room(roomNumber, hotelID, price, capacity, maxCapacity);
        roomService.create(newRoom);
        // Refresh the page after deletion to display updated table
        response.sendRedirect(request.getRequestURI());
    }

    if (request.getParameter("update") != null) {
        String roomNumberStr = request.getParameter("room_number_update");
        int roomNumber = Integer.parseInt(roomNumberStr);
        String hotelID = request.getParameter("hotel_id_update");
        String priceStr = request.getParameter("price_update");
        double price = Double.parseDouble(priceStr);
        String capacityStr = request.getParameter("capacity_update");
        int capacity = Integer.parseInt(capacityStr);
        String maxCapacityStr = request.getParameter("max_capacity_update");
        int maxCapacity = Integer.parseInt(maxCapacityStr);
        Room newRoom = new Room(roomNumber, hotelID, price, capacity, maxCapacity);
        roomService.update(newRoom);
        // Refresh the page after deletion to display updated table
        response.sendRedirect(request.getRequestURI());
    }

    if (request.getParameter("search") != null) {
        String myCity = request.getParameter("searchByCityInput");
        try {
            roomService.searchRooms(myCity);
            myRoomsByCity = roomsByCity.getAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
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
            Rooms
        </h1>

        <br> <!--Line Break-->

        <table style="margin-left:auto; margin-right:auto;">
            <thead>
                <!--All Attributes-->
                <tr>
                    <th>Room Number</th>
                    <th>Hotel ID</th>
                    <th>Price</th>
                    <th>Capacity</th>
                    <th>Max Capacity</th>
                    <th>Available</th>
                </tr>
            </thead>
            <tbody>
                <!---tbody shows tuples->
                <!--A java for loop-->
                <%
                    for (Room each : myRooms) {
                %>
                <tr>
                    <td><%= each.getRoomNumber() %></td>
                    <td><%= each.getHotelID() %></td>
                    <td><%= each.getPrice() %></td>
                    <td><%= each.getCapacity() %></td>
                    <td><%= each.getMaxCapacity() %></td>
                    <td><%= roomService.available(each) %></td>
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
            <label for="room_number_create">Enter Room Number to Create:</label>
            <input type="text" id="room_number_create" name="room_number_create">

            <label for="hotel_id_create">Enter Hotel ID to Create:</label>
            <input type="text" id="hotel_id_create" name="hotel_id_create">

            <label for="price_create">Enter Price to Create:</label>
            <input type="text" id="price_create" name="price_create">

            <label for="capacity_create">Enter Capacity to Create:</label>
            <input type="text" id="capacity_create" name="capacity_create">

            <label for="max_capacity_create">Enter Max Capacity to Create:</label>
            <input type="text" id="max_capacity_create" name="max_capacity_create">

            <button type="submit" name="create">CREATE</button>
        </form>

        <br>

        <form method="post">
            <label for="room_number_update">Enter Room Number to Update:</label>
            <input type="text" id="room_number_update" name="room_number_update">

            <label for="hotel_id_update">Enter Hotel ID to Update:</label>
            <input type="text" id="hotel_id_update" name="hotel_id_update">

            <label for="price_update">Enter Price to Update:</label>
            <input type="text" id="price_update" name="price_update">

            <label for="capacity_update">Enter Capacity to Update:</label>
            <input type="text" id="capacity_update" name="capacity_update">

            <label for="max_capacity_update">Enter Max Capacity to Update:</label>
            <input type="text" id="max_capacity_update" name="max_capacity_update">

            <button type="submit" name="update">UPDATE</button>
        </form>

        <br>

        <form method="post">
            <label for="room_number_delete">Enter Room Number to delete:</label>
            <input type="text" id="room_number_delete" name="room_number_delete">
            <button type="submit" name="delete">DELETE</button>
        </form>

        <br>

        <form method="post">
            <label for="SearchByCity">Enter City To Search:</label>
            <input type="text" id="searchByCityInput" name="searchByCityInput">
            <button type="submit" name="search">Search By City</button>
        </form>

        <br>

        <table style="margin-left:auto; margin-right:auto;">
            <thead>
                <tr>
                    <th>Room Number</th>
                    <th>Hotel ID</th>
                    <th>Price</th>
                    <th>Capacity</th>
                    <th>Max Capacity</th>
                    <th>Available</th>
                </tr>
            </thead>
            <tbody>
                <!---tbody shows tuples->
                <!--A java for loop-->
                <%
                    if (myRoomsByCity != null) {
                        for (Room each : myRoomsByCity) {
                %>
                <tr>
                    <td><%= each.getRoomNumber() %></td>
                    <td><%= each.getHotelID() %></td>
                    <td><%= each.getPrice() %></td>
                    <td><%= each.getCapacity() %></td>
                    <td><%= each.getMaxCapacity() %></td>
                    <td><%= roomService.available(each) %></td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </body>
</html>