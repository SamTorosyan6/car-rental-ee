<%@ page import="com.example.carrentalee.model.User" %>
<%@ page import="com.example.carrentalee.enums.UserRole" %>
<%
    User currentUser = (User) session.getAttribute("user");
    String path = request.getContextPath();
%>
<style>
    body {
        margin: 0;
        font-family: 'Segoe UI', Arial, sans-serif;
        background: #f4f4f4;
    }
    .page-header {
        background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)),
        url('https://images.unsplash.com/photo-1494976388531-d1058494cdd8?auto=format&fit=crop&w=1920&q=80');
        background-size: cover;
        background-position: center;
        height: 250px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        color: white;
        text-align: center;
    }
    .navbar {
        background: rgba(0,0,0,0.8);
        padding: 15px;
        display: flex;
        justify-content: center;
        gap: 20px;
    }
    .navbar a {
        color: white;
        text-decoration: none;
        font-weight: bold;
        transition: 0.3s;
    }
    .navbar a:hover { color: #f39c12; }
    .content-container {
        padding: 40px;
        max-width: 1000px;
        margin: auto;
        background: white;
        min-height: 400px;
        box-shadow: 0 0 20px rgba(0,0,0,0.1);
        margin-top: -50px;
        border-radius: 8px;
    }
    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
    th, td { padding: 12px; border: 1px solid #ddd; text-align: left; }
    th { background-color: #333; color: white; }
    tr:nth-child(even) { background-color: #f9f9f9; }
    .btn-admin { padding: 5px 10px; border-radius: 4px; text-decoration: none; font-size: 13px; }
    .delete { background: #e74c3c; color: white; }
    .change { background: #3498db; color: white; }
</style>

<div class="navbar">
    <a href="<%=path%>/">Home</a>
    <a href="<%=path%>/cars">Cars</a>
    <% if (currentUser != null && (currentUser.getRole() == UserRole.ADMIN)) { %>
    <a href="<%=path%>/customers">Customers</a>
    <a href="<%=path%>/rentals">Rentals</a>
    <a href="<%=path%>/adminPage" style="color: #f39c12;">Admin Panel</a>
    <a href="<%=path%>/logout" style="color: #e74c3c;">Logout</a>
    <% } else { %>
    <a href="<%=path%>/login">Login</a>
    <% } %>
</div>

<div class="page-header">
    <h1>Car Rental Service</h1>
    <p>Premium cars for your comfort</p>
</div>