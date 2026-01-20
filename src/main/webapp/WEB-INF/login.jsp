<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: url('https://images.unsplash.com/photo-1485291571150-772bcfc10da5?auto=format&fit=crop&w=1920&q=80') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-overlay {
            position: absolute;
            top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1;
        }

        .login-card {
            position: relative;
            z-index: 2;
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.3);
            width: 100%;
            max-width: 350px;
            text-align: center;
        }

        .login-card h2 {
            margin-bottom: 25px;
            color: #333;
            font-size: 24px;
        }

        .login-card input {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 16px;
        }

        .login-card input[type="submit"] {
            background-color: #f39c12;
            color: white;
            border: none;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .login-card input[type="submit"]:hover {
            background-color: #e67e22;
        }

        .error-msg {
            color: #e74c3c;
            margin-bottom: 15px;
            font-size: 14px;
            background: #fdeaea;
            padding: 8px;
            border-radius: 4px;
        }

        .back-home {
            display: inline-block;
            margin-top: 15px;
            color: #777;
            text-decoration: none;
            font-size: 14px;
        }

        .back-home:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="login-overlay"></div>

<div class="login-card">
    <h2>Admin Access</h2>

    <%-- Եթե սխալ տվյալներ են ներմուծվել --%>
    <% if (request.getParameter("error") != null) { %>
    <div class="error-msg">Invalid Username or Password!</div>
    <% } %>

    <form action="<%=path%>/login" method="POST">
        <input type="text" name="name" placeholder="Username" required autofocus>
        <input type="password" name="password" placeholder="Password" required>
        <input type="submit" value="Sign In">
    </form>

    <a href="<%=path%>/" class="back-home">← Back to Website</a>
</div>

</body>
</html>