<%@ page import="com.example.carrentalee.model.Car" %>
<%@ page import="com.example.carrentalee.model.Customer" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.carrentalee.enums.UserRole" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Create New Rental</title>
</head>
<body>
<%@ include file="header.jsp" %>

<h2>Book a Car</h2>

<form action="<%=request.getContextPath()%>/addRental" method="POST">

    <label>Vehicle:</label>
    <select name="car_id" required>
        <% List<Car> cars = (List<Car>) request.getAttribute("cars");
            for (Car car : cars) { %>
        <option value="<%=car.getId()%>">
            <%=car.getBrand()%> <%=car.getModel()%> (<%=car.getYear()%>)
        </option>
        <% } %>
    </select>

    <% if (currentUser.getRole() == UserRole.ADMIN) { %>
    <label>Customer:</label>
    <select name="customer_id" required>
        <% List<Customer> customers = (List<Customer>) request.getAttribute("customers");
            for (Customer c : customers) { %>
        <option value="<%=c.getId()%>">
            <%=c.getName()%> <%=c.getSurname()%>
        </option>
        <% } %>
    </select>
    <% } %>

    <label>Start Date:</label>
    <input type="date" name="start_date" required>

    <label>End Date:</label>
    <input type="date" name="end_date" required>

    <% if (currentUser.getRole() == UserRole.ADMIN) { %>
    <label>Status:</label>
    <select name="status">
        <option value="RESERVED">Reserved</option>
        <option value="ACTIVE">Active</option>
    </select>
    <% } else { %>
    <input type="hidden" name="status" value="RESERVED">
    <% } %>

    <button type="submit">Confirm Rental</button>
</form>

</body>
</html>
