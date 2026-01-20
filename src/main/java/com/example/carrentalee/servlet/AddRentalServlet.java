package com.example.carrentalee.servlet;

import com.example.carrentalee.enums.CarStatus;
import com.example.carrentalee.enums.RentalStatus;
import com.example.carrentalee.enums.UserRole;
import com.example.carrentalee.model.Car;
import com.example.carrentalee.model.Customer;
import com.example.carrentalee.model.Rental;
import com.example.carrentalee.model.User;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/addRental")
public class AddRentalServlet extends HttpServlet {

    private RentalService rentalService = new RentalService();
    private CarService carService = new CarService();
    private CustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        User currentUser = (User) req.getSession().getAttribute("user");

        if (currentUser == null) {
            resp.sendRedirect("/login");
            return;
        }

        if (currentUser.getRole() == UserRole.ADMIN) {
            req.setAttribute("cars", carService.getAvailableCars());
            req.setAttribute("customers", customerService.getAllCustomers());
        } else {
            int carId = Integer.parseInt(req.getParameter("id"));
            Car car = carService.getCarById(carId);

            List<Car> cars = new ArrayList<>();
            cars.add(car);

            req.setAttribute("cars", cars);
        }

        req.getRequestDispatcher("WEB-INF/addRental.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        User currentUser = (User) req.getSession().getAttribute("user");

        int carId = Integer.parseInt(req.getParameter("car_id"));
        Date startDate = Date.valueOf(req.getParameter("start_date"));
        Date endDate = Date.valueOf(req.getParameter("end_date"));

        Car car = carService.getCarById(carId);
        Customer customer;

        if (currentUser.getRole() == UserRole.ADMIN) {
            int customerId = Integer.parseInt(req.getParameter("customer_id"));
            customer = customerService.getCustomerById(customerId);
        } else {
            customer = customerService.getCustomerByName(currentUser.getName());

            if (customer == null) {
                customer = new Customer();
                customer.setName(currentUser.getName());
                customer.setSurname("User");
                customer.setEmail(currentUser.getName());
                customer.setPhone("N/A");
                customer.setLicenseNumber(0);

                customerService.addCustomer(customer);
            }
        }

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
