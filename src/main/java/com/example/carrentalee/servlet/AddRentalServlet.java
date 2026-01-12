package com.example.carrentalee.servlet;

import com.example.carrentalee.enums.CarStatus;
import com.example.carrentalee.enums.RentalStatus;
import com.example.carrentalee.model.Car;
import com.example.carrentalee.model.Customer;
import com.example.carrentalee.model.Rental;
import com.example.carrentalee.service.CarService;
import com.example.carrentalee.service.CustomerService;
import com.example.carrentalee.service.RentalService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.time.temporal.ChronoUnit;

@WebServlet("/addRental")
public class AddRentalServlet extends HttpServlet {

    private RentalService rentalService = new RentalService();
    private CarService carService = new CarService();
    private CustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setAttribute("cars", carService.getAvailableCars());
        req.setAttribute("customers", customerService.getAllCustomers());
        req.getRequestDispatcher("addRental.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        int carId = Integer.parseInt(req.getParameter("car_id"));
        int customerId = Integer.parseInt(req.getParameter("customer_id"));
        Date startDate = Date.valueOf(req.getParameter("start_date"));
        Date endDate = Date.valueOf(req.getParameter("end_date"));

        Car car = carService.getCarById(carId);
        Customer customer = customerService.getCustomerById(customerId);

        long days = ChronoUnit.DAYS.between(startDate.toLocalDate(), endDate.toLocalDate());
        if (days <= 0) {
            days = 1;
        }

        double totalCost = days * car.getDailyRate();

        Rental rental = new Rental();
        rental.setCar(car);
        rental.setCustomer(customer);
        rental.setStartDate(startDate);
        rental.setEndDate(endDate);
        rental.setTotalCost(totalCost);

        String statusParam = req.getParameter("status");
        rental.setRentalStatus(statusParam != null ? RentalStatus.valueOf(statusParam) : RentalStatus.RESERVED);

        rentalService.addRental(rental);

        car.setStatus(CarStatus.RENTED);
        carService.changeCar(car);


        resp.sendRedirect(req.getContextPath() + "/rentals");
    }
}
