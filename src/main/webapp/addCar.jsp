<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Car</title>
    <style>
        .form-box { max-width: 500px; margin: 0 auto; padding: 20px; }
        .form-group { margin-bottom: 15px; text-align: left; }
        .form-group label { display: block; margin-bottom: 5px; font-weight: bold; color: #444; }
        .form-group input, .form-group select {
            width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; box-sizing: border-box;
        }
        .submit-btn {
            background: #2ecc71; color: white; padding: 12px 20px; border: none;
            border-radius: 5px; cursor: pointer; width: 100%; font-size: 16px; font-weight: bold;
        }
        .submit-btn:hover { background: #27ae60; }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>

<div class="content-container">
    <div class="form-box">
        <h2 style="text-align: center;">Add New Vehicle</h2>
        <form action="<%=path%>/addCar" method="POST">

            <div class="form-group">
                <label>Brand Name:</label>
                <input type="text" name="brand" placeholder="e.g. Mercedes" required>
            </div>

            <div class="form-group">
                <label>Model:</label>
                <input type="text" name="model" placeholder="e.g. S-Class" required>
            </div>

            <div class="form-group">
                <label>Year of Manufacture:</label>
                <input type="number" name="year" placeholder="2024" required>
            </div>

            <div class="form-group">
                <label>Daily Rental Rate ($):</label>
                <input type="number" step="0.01" name="dailyRate" placeholder="100.00" required>
            </div>

            <div class="form-group">
                <label>Status:</label>
                <select name="status">
                    <option value="AVAILABLE">Available</option>
                    <option value="RENTED">Rented</option>
                    <option value="MAINTENANCE">In Maintenance</option>
                    <option value="INACTIVE">Inactive</option>
                </select>
            </div>

            <input type="submit" value="Save Vehicle to Database" class="submit-btn">
        </form>
        <a href="<%=path%>/adminPage" style="display: block; text-align: center; margin-top: 15px; color: #777; text-decoration: none;">
            ← Back to Dashboard
        </a>
    </div>
</div>
</body>
</html>