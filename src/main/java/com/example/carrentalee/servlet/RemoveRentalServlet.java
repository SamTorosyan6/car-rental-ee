package com.example.carrentalee.servlet;

import com.example.carrentalee.service.RentalService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/removeRental")
public class RemoveRentalServlet extends HttpServlet {
    private RentalService rentalService = new RentalService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String idStr = req.getParameter("id");
        if (idStr != null) {
            int id = Integer.parseInt(idStr);
            rentalService.deleteRental(id);
        }

        resp.sendRedirect(req.getContextPath() + "/rentals");
    }
}