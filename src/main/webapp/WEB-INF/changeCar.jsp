<%@ page import="com.example.carrentalee.model.Car" %>
<%@ page import="com.example.carrentalee.enums.CarStatus" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Car Details</title>
    <style>
        .form-box { max-width: 500px; margin: 0 auto; padding: 20px; }
        .form-group { margin-bottom: 15px; text-align: left; }
        .form-group label { display: block; margin-bottom: 5px; font-weight: bold; color: #444; }
        .form-group input, .form-group select {
            width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; box-sizing: border-box;
        }
        .update-btn {
            background: #3498db; color: white; padding: 12px 20px; border: none;
            border-radius: 5px; cursor: pointer; width: 100%; font-size: 16px; font-weight: bold;
        }
        .update-btn:hover { background: #2980b9; }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>

<div class="content-container">
    <% Car car = (Car) request.getAttribute("car"); %>

    <div class="form-box">
        <h2 style="text-align: center;">Edit Vehicle Info</h2>
        <form action="<%=path%>/changeCar" method="POST">
            <input type="hidden" name="id" value="<%=car.getId()%>">

            <div class="form-group">
                <label>Brand:</label>
                <input type="text" name="brand" value="<%=car.getBrand()%>" required>
            </div>

            <div class="form-group">
                <label>Model:</label>
                <input type="text" name="model" value="<%=car.getModel()%>" required>
            </div>

            <div class="form-group">
                <label>Year:</label>
                <input type="number" name="year" value="<%=car.getYear()%>" required>
            </div>

            <div class="form-group">
                <label>Daily Rate ($):</label>
                <input type="number" step="0.01" name="dailyRate" value="<%=car.getDailyRate()%>" required>
            </div>

            <div class="form-group">
                <label>Status:</label>
                <select name="status">
                    <option value="AVAILABLE" <%= car.getStatus() == CarStatus.AVAILABLE ? "selected" : "" %>>AVAILABLE</option>
                    <option value="RENTED" <%= car.getStatus() == CarStatus.RENTED ? "selected" : "" %>>RENTED</option>
                    <option value="MAINTENANCE" <%= car.getStatus() == CarStatus.MAINTENANCE ? "selected" : "" %>>MAINTENANCE</option>
                    <option value="INACTIVE" <%= car.getStatus() == CarStatus.INACTIVE ? "selected" : "" %>>INACTIVE</option>
                </select>
            </div>

            <input type="submit" value="Update Car Details" class="update-btn">
        </form>
        <a href="<%=path%>/cars" style="display: block; text-align: center; margin-top: 15px; color: #777; text-decoration: none;">
            ← Cancel and Back to List
        </a>
    </div>
</div>
</body>
</html>