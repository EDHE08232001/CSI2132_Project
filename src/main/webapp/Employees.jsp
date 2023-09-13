<%@ page import="com.CSI2132_Project.Employee" %>
<%@ page import="com.CSI2132_Project.Employee_Service" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Employee_Service employeeService = new Employee_Service();

    List<Employee> myEmployees = null;

    try {
        myEmployees = employeeService.getAll();
    } catch (Exception e) {
        e.printStackTrace();
    }

    //Following three block detect click on buttons
    // getParameter("Button ID")
    if (request.getParameter("delete") != null) {
        // value from user prompt text box
        String employeeID = request.getParameter("employee_id_delete");
        employeeService.delete(employeeID);
        // Refresh the page after deletion to display updated table
        response.sendRedirect(request.getRequestURI());
    }

    if (request.getParameter("create") != null) {
        String employeeID = request.getParameter("employee_id_create");
        String supervisorID = request.getParameter("supervisor_id_create");
        String SIN = request.getParameter("sin_create");
        String hotelID = request.getParameter("hotel_id_create");
        String salaryStr = request.getParameter("salary_create");
        double salary = Double.parseDouble(salaryStr);
        Employee newEmployee = new Employee(employeeID, supervisorID, SIN, hotelID, salary);
        employeeService.create(newEmployee);
        // Refresh the page after deletion to display updated table
        response.sendRedirect(request.getRequestURI());
    }

    if (request.getParameter("update") != null) {
        String employeeID = request.getParameter("employee_id_update");
        String supervisorID = request.getParameter("supervisor_id_update");
        String SIN = request.getParameter("sin_update");
        String hotelID = request.getParameter("hotel_id_update");
        String salaryStr = request.getParameter("salary_update");
        double salary = Double.parseDouble(salaryStr);
        Employee newEmployee = new Employee(employeeID, supervisorID, SIN, hotelID, salary);
        employeeService.update(newEmployee);
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
            All Employees
        </h1>

        <br> <!--Line Break-->

        <table style="margin-left:auto; margin-right:auto;">
            <thead>
                <!--All Attributes-->
                <tr>
                    <th>Employee ID</th>
                    <th>Supervisor ID</th>
                    <th>SIN</th>
                    <th>Hotel ID</th>
                    <th>Salary</th>
                </tr>
            </thead>
            <tbody>
                <!---tbody shows tuples->
                <!--A java for loop-->
                <%
                    for (Employee each : myEmployees) {
                %>
                <tr>
                    <td><%= each.getEmployeeID() %></td>
                    <td><%= each.getSupervisorID() %></td>
                    <td><%= each.getSIN() %></td>
                    <td><%= each.getHotelID() %></td>
                    <td><%= each.getSalary() %></td>
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

            <label for="employee_id_create">Enter Employee ID to Create:</label>
            <input type="text" id="employee_id_create" name="employee_id_create">

            <label for="supervisor_id_create">Enter Supervisor ID to Create:</label>
            <input type="text" id="supervisor_id_create" name="supervisor_id_create">

            <label for="sin_create">Enter SIN to Create:</label>
            <input type="text" id="sin_create" name="sin_create">

            <label for="hotel_id_create">Enter Hotel ID to Create:</label>
            <input type="text" id="hotel_id_create" name="hotel_id_create">

            <label for="salary_create">Enter Salary to Create:</label>
            <input type="text" id="salary_create" name="salary_create">

            <button type="submit" name="create">CREATE</button>
        </form>

        <br>

        <form method="post">
             
            <label for="employee_id_update">Enter Employee ID to Update:</label>
            <input type="text" id="employee_id_update" name="employee_id_update">

            <label for="supervisor_id_update">Enter Supervisor ID to Update:</label>
            <input type="text" id="supervisor_id_update" name="supervisor_id_update">

            <label for="sin_update">Enter SIN to Update:</label>
            <input type="text" id="sin_update" name="sin_update">

            <label for="hotel_id_update">Enter Hotel ID to Update:</label>
            <input type="text" id="hotel_id_update" name="hotel_id_update">

            <label for="salary_update">Enter Salary to Update(Must be hight than 15$):</label>
            <input type="text" id="salary_update" name="salary_update">

            <button type="submit" name="update">UPDATE</button>
        </form>

        <br>

        <form method="post">
            <label for="employee_id_delete">Enter Employee ID to delete:</label>
            <input type="text" id="employee_id_delete" name="employee_id_delete">
            <button type="submit" name="delete">DELETE</button>
        </form>
    </body>
</html>