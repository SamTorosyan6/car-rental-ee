<%@ page import="com.example.carrentalee.model.User" %>
<%@ page import="com.example.carrentalee.enums.UserRole" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    User currentUser = (User) session.getAttribute("user");
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Car Rental Service | Welcome</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?auto=format&fit=crop&w=1920&q=80') no-repeat center center fixed;
            background-size: cover;
            color: white;
        }

        .overlay {
            background: rgba(0, 0, 0, 0.6);
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .navbar {
            position: absolute;
            top: 0;
            width: 100%;
            padding: 20px;
            display: flex;
            justify-content: space-around;
            background: rgba(0, 0, 0, 0.3);
            z-index: 10;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            margin: 0 15px;
            transition: 0.3s;
        }

        .navbar a:hover {
            color: #f39c12;
        }

        h1 {
            font-size: 4rem;
            margin-bottom: 10px;
        }

        p {
            font-size: 1.5rem;
            margin-bottom: 30px;
        }

        .btn {
            padding: 15px 30px;
            font-size: 1.2rem;
            color: white;
            background: #f39c12;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            transition: 0.3s;
            display: inline-block;
        }

        .btn:hover {
            background: #e67e22;
            transform: scale(1.05);
        }

        .admin-badge {
            background: #e74c3c;
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 0.9rem;
            margin-top: 15px;
            display: block;
            width: fit-content;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>

<div class="navbar">
    <div>
        <a href="<%=path%>/">Home</a>
        <a href="<%=path%>/cars">Available Cars</a>
    </div>
    <div>
        <% if (currentUser != null && !currentUser.getRole().equals(UserRole.ADMIN)) { %>
        <a href="<%=path%>/userPage">Car rental service</a>
        <a href="<%=path%>/adminPage" style="color: #f39c12;">Admin Dashboard</a>
        <%}%>
        <% if (currentUser == null) { %>
        <a href="<%=path%>/login">Login</a>
        <a href="<%=path%>/register">Register</a>
        <% } else { %>
        <a href="<%=path%>/logout">Logout</a>
        <% } %>
    </div>
</div>

<div class="overlay">
    <h1>Drive Your Dream Car</h1>
    <p>The best car rental service in the city. Fast, easy, and reliable.</p>

    <div>
        <a href="<%=path%>/cars" class="btn">View Our Fleet</a>

        <% if (currentUser != null) { %>
        <div class="admin-badge">Logged in as: <%= currentUser.getName() %>
        </div>
        <% } %>
    </div>
</div>

</body>
</html>