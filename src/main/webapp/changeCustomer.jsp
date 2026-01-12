<%@ page import="com.example.carrentalee.model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Customer | Car Rental</title>
    <style>
        .form-box { max-width: 550px; margin: 40px auto; padding: 30px; background: #fff; border-radius: 12px; box-shadow: 0 10px 25px rgba(0,0,0,0.1); }
        .form-header { text-align: center; margin-bottom: 25px; }
        .form-header h2 { color: #2c3e50; margin: 0; font-size: 24px; }
        .form-group { margin-bottom: 18px; text-align: left; }
        .form-group label { display: block; margin-bottom: 7px; font-weight: 600; color: #34495e; font-size: 14px; }
        .form-group input { width: 100%; padding: 12px; border: 1px solid #dcdfe6; border-radius: 6px; box-sizing: border-box; font-size: 15px; }
        .form-group input:focus { outline: none; border-color: #3498db; box-shadow: 0 0 5px rgba(52, 152, 219, 0.2); }
        .update-btn { background: #3498db; color: white; padding: 14px 20px; border: none; border-radius: 6px; cursor: pointer; width: 100%; font-size: 16px; font-weight: bold; margin-top: 10px; transition: 0.3s; }
        .update-btn:hover { background: #2980b9; }
        .back-link { display: block; text-align: center; margin-top: 20px; color: #7f8c8d; text-decoration: none; font-size: 14px; }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>

<div class="content-container">
    <% Customer customer = (Customer) request.getAttribute("customer"); %>

    <div class="form-box">
        <div class="form-header">
            <h2>Update Customer Profile</h2>
            <p style="color: #95a5a6; font-size: 14px;">Modify information for <%=customer.getName()%>.</p>
        </div>

        <form action="<%=path%>/changeCustomer" method="POST">
            <input type="hidden" name="id" value="<%=customer.getId()%>">

            <div class="form-group">
                <label>First Name</label>
                <input type="text" name="name" value="<%=customer.getName()%>" required>
            </div>

            <div class="form-group">
                <label>Last Name</label>
                <input type="text" name="surname" value="<%=customer.getSurname()%>" required>
            </div>

            <div class="form-group">
                <label>License Number</label>
                <input type="text" name="license_number" value="<%=customer.getLicenseNumber()%>" required>
            </div>

            <div class="form-group">
                <label>Phone Number</label>
                <input type="text" name="phone" value="<%=customer.getPhone()%>" required>
            </div>

            <div class="form-group">
                <label>Email Address</label>
                <input type="email" name="email" value="<%=customer.getEmail()%>" required>
            </div>

            <button type="submit" class="update-btn">Update Customer</button>
        </form>

        <a href="<%=path%>/customers" class="back-link">← Cancel and return to list</a>
    </div>
</div>
</body>
</html>