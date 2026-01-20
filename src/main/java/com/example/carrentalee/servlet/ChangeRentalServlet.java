package com.example.carrentalee.servlet;

import com.example.carrentalee.enums.CarStatus;
import com.example.carrentalee.enums.RentalStatus;
import com.example.carrentalee.model.Car;
import com.example.carrentalee.model.Rental;
import com.example.carrentalee.service.CarService;
import com.example.carrentalee.service.RentalService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;

@WebServlet("/changeRental")
public class ChangeRentalServlet extends HttpServlet {

    private RentalService rentalService = new RentalService();
    private CarService carService = new CarService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        req.setAttribute("rental", rentalService.getRentalById(id));
        req.getRequestDispatcher("WEB-INF/changeRental.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        Rental rental = rentalService.getRentalById(id);

        rental.setRentalStatus(RentalStatus.valueOf(req.getParameter("status")));
        rental.setEndDate(Date.valueOf(req.getParameter("end_date")));

        rentalService.changeRental(rental);
        if (rental.getRentalStatus() == RentalStatus.FINISHED || rental.getRentalStatus() == RentalStatus.CANCELED) {

            Car car = rental.getCar();
            car.setStatus(CarStatus.AVAILABLE);
            carService.changeCar(car);
        }
        resp.sendRedirect("/rentals");
    }
}
