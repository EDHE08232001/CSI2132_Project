<%@ page import="com.CSI2132_Project.RoomHotelJoinObject" %>
<%@ page import="com.CSI2132_Project.RoomHotelJoin" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    RoomHotelJoin myJoinService = new RoomHotelJoin();
    List<RoomHotelJoinObject> desiredObjects = null;

    try {
        desiredObjects = myJoinService.getAll();
        myJoinService.deleteAll();
    } catch (Exception e) {
        e.printStackTrace();
    }

    if (request.getParameter("generalSearch") != null) {
        if (request.getParameter("city") != null && request.getParameter("capacity") != null && request.getParameter("price") != null && request.getParameter("chainId") != null && request.getParameter("rating") != null && request.getParameter("hotelId") != null) {
            // value from user prompt text box
            String city = request.getParameter("city");
            int capacity = Integer.parseInt(request.getParameter("capacity"));
            double price = Double.parseDouble(request.getParameter("price"));
            String chainId = request.getParameter("chainId");
            int rating = Integer.parseInt(request.getParameter("rating"));
            String hotelId = request.getParameter("hotelId");
            myJoinService.searchQuery(city, capacity, price, chainId, rating, hotelId);
        } else {
            String hotelId = request.getParameter("hotelId");
            myJoinService.searchQuery("null", -1, -1, "null", -1, hotelId);
        }
        // Refresh the page after deletion to display updated table
        response.sendRedirect(request.getRequestURI());
    }

%>

<!DOCTYPE html>
<html>
  <body style="text-align:center;">
    <p>
        My CSI 2132 Project
    </p>

    <a href="HotelChains.jsp">
        <button type="button">
            Hotel Chains
        </button>
    </a>
    <a href="Hotels.jsp">
        <button type="button">
            Hotels
        </button>
    </a>
    <a href="Rooms.jsp">
        <button type="button">
            Rooms
        </button>
    </a>
    <a href="Persons.jsp">
        <button type="button">
            Persons
        </button>
    </a>
    <a href="Employees.jsp">
        <button type="button">
            Employees
        </button>
    </a>
    <a href="Customers.jsp">
        <button type="button">
            Customers
        </button>
    </a>
    <a href="Bookings.jsp">
        <button type="button">
            Bookings
        </button>
    </a>
    <a href="Rentings.jsp">
        <button type="button">
            Rentings
        </button>
    </a>

    <br>

    <p>
        Search By city, capacity, rating, and chain_id, or to search using a view by hotel_id
    </p>

    <br>
    <form method="post">
        <label for="city">Enter City:</label>
        <input type="text" id="city" name="city">

        <label for="capacity">Enter Capacity:</label>
        <input type="text" id="capacity" name="capacity">

        <label for="price">Enter Price:</label>
        <input type="text" id="price" name="price">

        <label for="rating">Enter Rating:</label>
            <select name="rating_dropdown_update" id="rating_dropdown_update">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>

        <label for="chainId">Enter Chain ID:</label>
        <input type="text" id="chainId" name="chainId">

        <br>
        <br>
        <br>

        <label for="hotelId">Enter Hotel ID:</label>
        <input type="text" id="hotelId" name="hotelId">


        <br>
        <br>
        <br>

        <button type="submit" name="generalSearch">General Search</button>
    </form>

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
                <th>Room Number</th>
                <th>Price</th>
                <th>Capacity</th>
                <th>Max Capacity</th>
            </tr>
        </thead>


        <tbody>
            <!---tbody shows tuples->
            <!--A java for loop-->
            <%
                for (RoomHotelJoinObject each : desiredObjects) {
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
                <td><%= each.getRoomNumber() %></td>
                <td><%= each.getPrice() %></td>
                <td><%= each.getCapacity() %></td>
                <td><%= each.getMaxCapacity() %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <script src="script.js"></script>
  </body>
</html>