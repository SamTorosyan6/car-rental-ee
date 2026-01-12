<%@ page import="com.example.carrentalee.model.Rental" %>
<%@ page import="com.example.carrentalee.enums.RentalStatus" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modify Rental</title>
    <style>
        .form-box input, .form-box select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            display: block;
        }
        .form-group { margin-bottom: 15px; }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>

<div class="content-container">
    <%
        Rental rental = (Rental) request.getAttribute("rental");
        if (rental != null) {
    %>
    <div class="form-box">
        <h2 style="text-align: center;">Modify Rental Details</h2>

        <form action="<%=path%>/changeRental" method="POST">
            <input type="hidden" name="id" value="<%=rental.getId()%>">

            <div class="form-group">
                <label>Vehicle:</label>
                <input type="text" value="<%=rental.getCar().getBrand()%> <%=rental.getCar().getModel()%>" readonly style="background:#eee;">
            </div>

            <div class="form-group">
                <label>Customer:</label>
                <input type="text" value="<%=rental.getCustomer().getName()%> <%=rental.getCustomer().getSurname()%>" readonly style="background:#eee;">
            </div>

            <div class="form-group">
                <label>Start Date:</label>
                <input type="date" name="start_date" value="<%=rental.getStartDate()%>" required>
            </div>

            <div class="form-group">
                <label>End Date:</label>
                <input type="date" name="end_date" value="<%=rental.getEndDate()%>" required>
            </div>

            <div class="form-group">
                <label>Status:</label>
                <select name="status">
                    <% for (RentalStatus status : RentalStatus.values()) { %>
                    <option value="<%=status.name()%>" <%= (rental.getRentalStatus() == status) ? "selected" : "" %>>
                        <%=status.name()%>
                    </option>
                    <% } %>
                </select>
            </div>

            <button type="submit" class="update-btn" style="width:100%; background:#27ae60; color:white; padding:12px; border:none; border-radius:5px; cursor:pointer;">
                Save Changes
            </button>
        </form>
    </div>
    <% } %>
</div>
</body>
</html>