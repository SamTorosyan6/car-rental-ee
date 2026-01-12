<%@ page import="com.example.carrentalee.model.Car" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Our Fleet</title>
</head>
<body>
<%@ include file="header.jsp" %>

<div class="content-container">
    <%
        // Այստեղից ջնջվել են User currentUser և String path տողերը
        List<Car> cars = (List<Car>) request.getAttribute("cars");
    %>

    <div style="display: flex; justify-content: space-between; align-items: center;">
        <h2>Available Cars</h2>
        <% if (currentUser != null) { %>
        <a href="<%=path%>/addCar" style="background:#2ecc71; color:white; padding:10px; border-radius:5px; text-decoration:none;">+ Add Car</a>
        <% } %>
    </div>

    <table>
        <tr>
            <th>Brand</th><th>Model</th><th>Year</th><th>Daily Rate</th><th>Status</th>
            <% if (currentUser != null) { %> <th>Actions</th> <% } %>
        </tr>
        <% for (Car car : cars) { %>
        <tr>
            <td><%=car.getBrand()%></td>
            <td><%=car.getModel()%></td>
            <td><%=car.getYear()%></td>
            <td>$<%=car.getDailyRate()%></td>
            <td><strong><%=car.getStatus()%></strong></td>
            <% if (currentUser != null) { %>
            <td>
                <a href="<%=path%>/changeCar?id=<%=car.getId()%>" class="btn-admin change">Change</a>
                <a href="<%=path%>/deleteCar?id=<%=car.getId()%>" class="btn-admin delete">Delete</a>
            </td>
            <% } %>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>