package com.example.carrentalee.servlet;

import com.example.carrentalee.model.Customer;
import com.example.carrentalee.service.CustomerService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/addCustomer")
public class AddCustomerServlet extends HttpServlet {

    private CustomerService customerService = new CustomerService();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/addCustomer.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            String name = req.getParameter("name");
            String surname = req.getParameter("surname");
            int licenseNumber = Integer.parseInt(req.getParameter("license_number"));
            String phone = req.getParameter("phone");
            String email = req.getParameter("email");

            Customer customer = new Customer();
            customer.setName(name);
            customer.setSurname(surname);
            customer.setLicenseNumber(licenseNumber);
            customer.setPhone(phone);
            customer.setEmail(email);

            customerService.addCustomer(customer);

            resp.sendRedirect(req.getContextPath() + "/customers");

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/addCustomer?error=true");
        }
    }
}