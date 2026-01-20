<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Dashboard</title>
</head>
<body>
<%@ include file="header.jsp" %>

<div class="content-container" style="text-align: center;">
    <h1 style="color: #333;">Admin Dashboard</h1>
    <p style="color: #666; font-size: 1.2rem;">Welcome dear, <%= currentUser.getName() %></p>
    <hr style="margin: 30px 0; border: 0; border-top: 1px solid #eee;">

    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px; margin-top: 20px;">
        <a href="<%=path%>/cars" style="padding: 30px; background: #3498db; color: white; text-decoration: none; border-radius: 10px; font-weight: bold;">
            🚗 Manage Cars
        </a>
        <a href="<%=path%>/customers" style="padding: 30px; background: #2ecc71; color: white; text-decoration: none; border-radius: 10px; font-weight: bold;">
            👥 Manage Customers
        </a>
        <a href="<%=path%>/rentals" style="padding: 30px; background: #f39c12; color: white; text-decoration: none; border-radius: 10px; font-weight: bold;">
            📑 View Rentals
        </a>
        <a href="<%=path%>/addCar" style="padding: 30px; background: #9b59b6; color: white; text-decoration: none; border-radius: 10px; font-weight: bold;">
            ➕ Add New Car
        </a>
    </div>
</div>
</body>
</html>