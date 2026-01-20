package com.example.carrentalee.servlet;

import com.example.carrentalee.model.Rental;
import com.example.carrentalee.model.User;
import com.example.carrentalee.service.RentalService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/myRentals")
public class MyRentalCarsServlet extends HttpServlet {

    private RentalService rentalService = new RentalService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        User currentUser = (User) req.getSession().getAttribute("user");

        if (currentUser == null) {
            resp.sendRedirect("/login");
            return;
        }

        List<Rental> userRentals = rentalService.getRentalsByUserId(currentUser.getId());

        req.setAttribute("rentals", userRentals);

        req.getRequestDispatcher("/WEB-INF/rentals.jsp").forward(req, resp);
    }
}
