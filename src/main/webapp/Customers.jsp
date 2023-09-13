<%@ page import="com.CSI2132_Project.Customer" %>
<%@ page import="com.CSI2132_Project.Customer_Service" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Customer_Service customerService = new Customer_Service();

    List<Customer> myCustomers = null;

    try {
        myCustomers = customerService.getAll();
    } catch (Exception e) {
        e.printStackTrace();
    }

    //Following three block detect click on buttons
    // getParameter("Button ID")
    if (request.getParameter("delete") != null) {
        // value from user prompt text box
        String SIN = request.getParameter("sin_delete");
        customerService.delete(SIN);
        // Refresh the page after deletion to display updated table
        response.sendRedirect(request.getRequestURI());
    }

    if (request.getParameter("create") != null) {
        String SIN = request.getParameter("sin_create");
        Date registrationDate = Date.valueOf(request.getParameter("registration_date_create"));
        Customer newCustomer = new Customer(SIN, registrationDate);
        customerService.create(newCustomer);
        // Refresh the page after deletion to display updated table
        response.sendRedirect(request.getRequestURI());
    }

    if (request.getParameter("update") != null) {
        String SIN = request.getParameter("sin_update");
        Date registrationDate = Date.valueOf(request.getParameter("registration_date_update"));
        Customer newCustomer = new Customer(SIN, registrationDate);
        customerService.update(newCustomer);
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
            All Customers
        </h1>

        <br> <!--Line Break-->

        <table style="margin-left:auto; margin-right:auto;">
            <thead>
                <!--All Attributes-->
                <tr>
                    <th>SIN</th>
                    <th>Registration Date</th>
                </tr>
            </thead>
            <tbody>
                <!---tbody shows tuples->
                <!--A java for loop-->
                <%
                    for (Customer each : myCustomers) {
                %>
                <tr>
                    <td><%= each.getSIN() %></td>
                    <td><%= each.getRegistrationDate() %></td>
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

            <label for="registration_date_create">Enter Registration Date to Create:</label>
            <input type="text" id="registration_date_create" name="registration_date_create">

            <button type="submit" name="create">CREATE</button>
        </form>

        <br>

        <form method="post">
            <label for="sin_update">Enter SIN to Update:</label>
            <input type="text" id="sin_update" name="sin_update">

            <label for="registration_date_update">Enter Registration Date to Update:</label>
            <input type="text" id="registration_date_update" name="registration_date_update">

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