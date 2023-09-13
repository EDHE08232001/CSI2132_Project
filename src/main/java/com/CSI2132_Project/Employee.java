package com.CSI2132_Project;

public class Employee {
    private String employee_id;
    private String supervisor_id;
    private String sin;
    private String hotel_id;
    private double salary;

    public Employee(String employee_id, String supervisor_id, String sin, String hotel_id, double salary) {
        this.employee_id = employee_id;
        this.supervisor_id = supervisor_id;
        this.sin = sin;
        this.hotel_id = hotel_id;
        this.salary = salary;
    }

    public String getEmployeeID() {
        return employee_id;
    }

    public String getSupervisorID() {
        return supervisor_id;
    }

    public String getSIN() {
        return sin;
    }

    public String getHotelID() {
        return hotel_id;
    }


    public double getSalary() {
        return salary;
    }

    public String toString() {
        return "Employee\n"
                +
                "Employee ID: " + employee_id
                +
                "\nSupervisor ID: " + supervisor_id
                +
                "\nSIN: " + sin
                +
                "\nHotel ID: " + hotel_id
                +
                "\nSalary: " + salary;
    }
}
