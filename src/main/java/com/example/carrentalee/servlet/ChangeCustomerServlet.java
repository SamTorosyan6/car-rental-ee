package com.example.carrentalee.servlet;

import com.example.carrentalee.model.Customer;
import com.example.carrentalee.service.CustomerService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/changeCustomer")
public class ChangeCustomerServlet extends HttpServlet {

    private CustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        Customer customer = customerService.getCustomerById(id);

        req.setAttribute("customer", customer);
        req.getRequestDispatcher("changeCustomer.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        Customer customer = new Customer();
        customer.setId(Integer.parseInt(req.getParameter("id")));
        customer.setName(req.getParameter("name"));
        customer.setSurname(req.getParameter("surname"));
        customer.setLicenseNumber(Integer.parseInt(req.getParameter("license_number")));
        customer.setPhone(req.getParameter("phone"));
        customer.setEmail(req.getParameter("email"));

        customerService.changeCustomer(customer);
        resp.sendRedirect("/customers");
    }
}
