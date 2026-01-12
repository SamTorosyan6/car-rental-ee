package com.example.carrentalee.servlet;

import com.example.carrentalee.model.User;
import com.example.carrentalee.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserService userService = new UserService();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String password = req.getParameter("password");

        User user = userService.getUserByUsernameAndPassword(name, password);

        if (user != null) {
            req.getSession().setAttribute("user", user);
            resp.sendRedirect("/adminPage");
        } else {
            resp.sendRedirect("/login?error=Invalid credentials");
        }
    }
}