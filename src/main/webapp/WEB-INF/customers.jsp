<%@ page import="com.example.carrentalee.model.Customer" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customers Management</title>
</head>
<body>
<%-- Ներառում ենք հեդերը: currentUser և path փոփոխականները գալիս են այստեղից --%>
<%@ include file="header.jsp" %>

<div class="content-container">
    <%
        List<Customer> customers = (List<Customer>) request.getAttribute("customers");
    %>

    <div style="display: flex; justify-content: space-between; align-items: center;">
        <h2>Customers List</h2>
        <% if (currentUser != null) { %>
        <a href="<%=path%>/addCustomer" style="background:#2ecc71; color:white; padding:10px; border-radius:5px; text-decoration:none;">+ Add Customer</a>
        <% } %>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Surname</th>
            <th>License</th>
            <th>Phone</th>
            <th>Email</th>
            <% if (currentUser != null) { %>
            <th>Actions</th>
            <% } %>
        </tr>
        <% for (Customer customer : customers) { %>
        <tr>
            <td><%=customer.getId()%></td>
            <td><%=customer.getName()%></td>
            <td><%=customer.getSurname()%></td>
            <td><%=customer.getLicenseNumber()%></td>
            <td><%=customer.getPhone()%></td>
            <td><%=customer.getEmail()%></td>
            <% if (currentUser != null) { %>
            <td>
                <a href="<%=path%>/changeCustomer?id=<%=customer.getId()%>" class="btn-admin change">Edit</a>
                <a href="<%=path%>/deleteCustomer?id=<%=customer.getId()%>" class="btn-admin delete">Delete</a>
            </td>
            <% } %>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>