package com.example.carrentalee.servlet;

import com.example.carrentalee.model.Customer;
import com.example.carrentalee.service.CustomerService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(value = "/customers")

public class CustomerServlet extends HttpServlet {

    private CustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Customer> allCustomers = customerService.getAllCustomers();
        req.setAttribute("customers",allCustomers);
        req.getRequestDispatcher("customers.jsp").forward(req,resp);
    }
}
