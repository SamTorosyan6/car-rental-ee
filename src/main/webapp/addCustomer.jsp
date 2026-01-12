<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer Registration | Car Rental</title>
    <style>
        /* Ֆորմայի կոնտեյները */
        .form-box {
            max-width: 550px;
            margin: 40px auto;
            padding: 30px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }

        .form-header {
            text-align: center;
            margin-bottom: 25px;
        }

        .form-header h2 {
            color: #2c3e50;
            margin: 0;
            font-size: 24px;
        }

        .form-group {
            margin-bottom: 18px;
            text-align: left;
        }

        .form-group label {
            display: block;
            margin-bottom: 7px;
            font-weight: 600;
            color: #34495e;
            font-size: 14px;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #dcdfe6;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 15px;
            transition: border-color 0.2s;
        }

        .form-group input:focus {
            outline: none;
            border-color: #3498db;
            box-shadow: 0 0 5px rgba(52, 152, 219, 0.2);
        }

        /* Գրանցման կոճակը */
        .submit-btn {
            background: #27ae60;
            color: white;
            padding: 14px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            font-weight: bold;
            margin-top: 10px;
            transition: background 0.3s;
        }

        .submit-btn:hover {
            background: #219150;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #7f8c8d;
            text-decoration: none;
            font-size: 14px;
        }

        .back-link:hover {
            color: #34495e;
            text-decoration: underline;
        }
    </style>
</head>
<body>
<%-- Ներառում ենք ընդհանուր մենյուն --%>
<%@ include file="header.jsp" %>

<div class="content-container">
    <div class="form-box">
        <div class="form-header">
            <h2>New Customer Profile</h2>
            <p style="color: #95a5a6; font-size: 14px;">Please fill in the details to register a client.</p>
        </div>

        <form action="<%=path%>/addCustomer" method="POST">
            <div class="form-group">
                <label>First Name</label>
                <input type="text" name="name" placeholder="Enter name" required>
            </div>

            <div class="form-group">
                <label>Last Name</label>
                <input type="text" name="surname" placeholder="Enter surname" required>
            </div>

            <div class="form-group">
                <label>Driver's License Number</label>
                <input type="text" name="license_number" placeholder="e.g. AB123456" required>
            </div>

            <div class="form-group">
                <label>Phone Number</label>
                <input type="tel" name="phone" placeholder="+374 __ ___ ___" required>
            </div>

            <div class="form-group">
                <label>Email Address</label>
                <input type="email" name="email" placeholder="example@mail.com" required>
            </div>

            <button type="submit" class="submit-btn">Register Customer</button>
        </form>

        <a href="<%=path%>/customers" class="back-link">← Cancel and return to list</a>
    </div>
</div>
</body>
</html>