<%@ page import="com.example.carrentalee.model.Car" %>
<%@ page import="com.example.carrentalee.model.Customer" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create New Rental</title>
    <style>
        .form-box { max-width: 600px; margin: 0 auto; padding: 20px; }
        .form-group { margin-bottom: 20px; text-align: left; }
        .form-group label { display: block; margin-bottom: 8px; font-weight: bold; color: #444; }
        .form-group select, .form-group input {
            width: 100%; padding: 12px; border: 1px solid #ccc; border-radius: 6px; box-sizing: border-box; font-size: 15px;
        }
        .submit-btn {
            background: #f39c12; color: white; padding: 15px; border: none;
            border-radius: 6px; cursor: pointer; width: 100%; font-size: 17px; font-weight: bold; transition: 0.3s;
        }
        .submit-btn:hover { background: #e67e22; }
        .info-text { font-size: 0.9rem; color: #7f8c8d; margin-top: 5px; }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>

<div class="content-container">
    <div class="form-box">
        <h2 style="text-align: center; color: #2c3e50;">Book a Car</h2>
        <form action="<%=path%>/addRental" method="POST">

            <div class="form-group">
                <label>Select Vehicle:</label>
                <select name="car_id" required>
                    <option value="">-- Choose a Car --</option>
                    <% List<Car> cars = (List<Car>) request.getAttribute("cars");
                        for (Car car : cars) { %>
                    <option value="<%=car.getId()%>">
                        <%=car.getBrand()%> <%=car.getModel()%> (<%=car.getYear()%>) - $<%=car.getDailyRate()%>/day
                    </option>
                    <% } %>
                </select>
            </div>

            <div class="form-group">
                <label>Select Customer:</label>
                <select name="customer_id" required>
                    <option value="">-- Choose a Customer --</option>
                    <% List<Customer> customers = (List<Customer>) request.getAttribute("customers");
                        for (Customer customer : customers) { %>
                    <option value="<%=customer.getId()%>">
                        <%=customer.getName()%> <%=customer.getSurname()%> [ID: <%=customer.getId()%>]
                    </option>
                    <% } %>
                </select>
            </div>

            <div style="display: flex; gap: 15px;">
                <div class="form-group" style="flex: 1;">
                    <label>Start Date:</label>
                    <input type="date" name="start_date" required>
                </div>
                <div class="form-group" style="flex: 1;">
                    <label>End Date:</label>
                    <input type="date" name="end_date" required>
                </div>
            </div>

            <div class="form-group">
                <label>Initial Rental Status:</label>
                <select name="status">
                    <option value="RESERVED">Reserved</option>
                    <option value="ACTIVE">Active</option>
                </select>
            </div>

            <input type="submit" value="Confirm Rental Agreement" class="submit-btn">
        </form>
        <a href="<%=path%>/rentals" style="display: block; text-align: center; margin-top: 20px; color: #34495e; text-decoration: none;">
            ← View All Rentals
        </a>
    </div>
</div>
</body>
</html>