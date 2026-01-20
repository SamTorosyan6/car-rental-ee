<%@ page import="com.example.carrentalee.model.User" %>
<%@ page import="com.example.carrentalee.enums.UserRole" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    User currentUser = (User) session.getAttribute("user");
    String path = request.getContextPath();

    if (currentUser == null) {
        response.sendRedirect(path + "/login");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Dashboard | Car Rental</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #f4f6f8;
        }

        .navbar {
            background: #2c3e50;
            padding: 15px;
            display: flex;
            justify-content: space-between;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
            font-weight: bold;
        }

        .navbar a:hover {
            color: #f39c12;
        }

        .container {
            padding: 40px;
            text-align: center;
        }

        .card {
            background: white;
            padding: 30px;
            border-radius: 10px;
            max-width: 500px;
            margin: auto;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }

        h1 {
            color: #2c3e50;
        }

        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 25px;
            background: #f39c12;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            transition: 0.3s;
        }

        .btn:hover {
            background: #e67e22;
        }

        .role-badge {
            margin-top: 10px;
            color: #888;
            font-size: 14px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <div>
        <a href="<%=path%>/">Home</a>
        <a href="<%=path%>/cars">Available Cars</a>
    </div>
    <div>
        <a href="<%=path%>/logout">Logout</a>
    </div>
</div>

<div class="container">
    <div class="card">
        <h1>Welcome, <%= currentUser.getName() %> 👋</h1>
        <p>Here you can view only your car rentals.</p>

        <a href="<%=path%>/myRentals" class="btn">My Rentals</a>

        <p>
            You can view all cars below.
        </p>

        <a href="<%=path%>/cars" class="btn">View All Cars</a>

        <div class="role-badge">
            Role: <%= currentUser.getRole() %>
        </div>
    </div>
</div>

</body>
</html>
