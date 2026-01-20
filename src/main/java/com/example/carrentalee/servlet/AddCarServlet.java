package com.example.carrentalee.servlet;

import com.example.carrentalee.enums.CarStatus;
import com.example.carrentalee.model.Car;
import com.example.carrentalee.service.CarService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/addCar")
public class AddCarServlet extends HttpServlet {

    private CarService carService = new CarService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/addCar.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String brand = req.getParameter("brand");
        String model = req.getParameter("model");
        int year = Integer.parseInt(req.getParameter("year"));
        double dailyRate = Double.parseDouble(req.getParameter("dailyRate"));
        CarStatus status = CarStatus.valueOf(req.getParameter("status"));
        Car car = new Car();
        car.setBrand(brand);
        car.setModel(model);
        car.setYear(year);
        car.setDailyRate(dailyRate);
        car.setStatus(status);
        carService.addCar(car);
        resp.sendRedirect("/cars");
    }
}
