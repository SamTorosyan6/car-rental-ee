<%@ page import="com.example.carrentalee.model.Rental" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Rentals Management | Car Rental</title>
    <style>
        .content-container { padding: 20px; max-width: 1200px; margin: 0 auto; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; background: white; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        th, td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #34495e; color: white; }
        tr:hover { background-color: #f9f9f9; }

        .status-badge { padding: 5px 10px; border-radius: 20px; font-size: 12px; font-weight: bold; text-transform: uppercase; }
        .status-active { background: #e8f5e9; color: #2e7d32; }
        .status-reserved { background: #fff3e0; color: #ef6c00; }

        .price-text { font-weight: bold; color: #27ae60; font-size: 1.1em; }

        .btn-admin { padding: 6px 12px; border-radius: 4px; text-decoration: none; font-size: 13px; margin-right: 5px; display: inline-block; }
        .change { background: #3498db; color: white; }
        .change:hover { background: #2980b9; }
        .delete { background: #e74c3c; color: white; }
        .delete:hover { background: #c0392b; }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>

<div class="content-container">
    <%
        List<Rental> rentals = (List<Rental>) request.getAttribute("rentals");
    %>

    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
        <h2 style="color: #2c3e50;">Current Car Rentals</h2>
        <% if (currentUser != null) { %>
        <a href="<%=path%>/addRental" style="background:#2ecc71; color:white; padding:12px 20px; border-radius:5px; text-decoration:none; font-weight:bold; transition: 0.3s;">
            + Create New Booking
        </a>
        <% } %>
    </div>

    <table>
        <thead>
        <tr>
            <th>Vehicle</th>
            <th>Customer</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Total Cost</th> <th>Status</th>
            <% if (currentUser != null) { %>
            <th style="text-align: center;">Actions</th>
            <% } %>
        </tr>
        </thead>
        <tbody>
        <% if (rentals != null && !rentals.isEmpty()) {
            for (Rental rental : rentals) { %>
        <tr>
            <td>
                <strong><%=rental.getCar().getBrand()%></strong> <%=rental.getCar().getModel()%>
            </td>
            <td><%=rental.getCustomer().getName()%> <%=rental.getCustomer().getSurname()%></td>
            <td><%=rental.getStartDate()%></td>
            <td><%=rental.getEndDate()%></td>

            <td class="price-text">$<%= String.format("%.2f", rental.getTotalCost()) %></td>

            <td>
                        <span class="status-badge <%= rental.getRentalStatus().name().toLowerCase().equals("active") ? "status-active" : "status-pending" %>">
                            <%=rental.getRentalStatus()%>
                        </span>
            </td>

            <% if (currentUser != null) { %>
            <td style="text-align: center;">
                <a href="<%=path%>/changeRental?id=<%=rental.getId()%>" class="btn-admin change">Manage</a>

                <a href="<%=path%>/removeRental?id=<%=rental.getId()%>"
                   class="btn-admin delete"
                   onclick="return confirm('Are you sure you want to cancel this rental agreement? This action cannot be undone.');">
                    Cancel
                </a>
            </td>
            <% } %>
        </tr>
        <% }
        } else { %>
        <tr>
            <td colspan="<%= (currentUser != null) ? 7 : 6 %>" style="text-align: center; padding: 20px; color: #7f8c8d;">
                No rental records found.
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>