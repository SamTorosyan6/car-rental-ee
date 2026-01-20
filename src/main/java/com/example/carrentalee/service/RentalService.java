package com.example.carrentalee.service;

import com.example.carrentalee.db.DBConnectionProvider;
import com.example.carrentalee.enums.RentalStatus;
import com.example.carrentalee.model.Rental;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RentalService {

    private Connection connection = DBConnectionProvider.getInstance().getConnection();
    private CarService carService  = new CarService();
    private CustomerService customerService = new CustomerService();

    public void addRental(Rental rental) {
        String sql = "INSERT INTO rental(car_id, customer_id, start_date, end_date, total_cost, status) VALUES (?, ?, ?, ?, ?, ?)";

        long diffInMillies = Math.abs(rental.getEndDate().getTime() - rental.getStartDate().getTime());
        long days = diffInMillies / (1000 * 60 * 60 * 24);
        if (days == 0) days = 1;

        double totalCost = days * rental.getCar().getDailyRate();
        rental.setTotalCost(totalCost);

        try (PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            statement.setInt(1, rental.getCar().getId());
            statement.setInt(2, rental.getCustomer().getId());
            statement.setDate(3, new java.sql.Date(rental.getStartDate().getTime()));
            statement.setDate(4, new java.sql.Date(rental.getEndDate().getTime()));
            statement.setDouble(5, rental.getTotalCost());
            statement.setString(6, rental.getRentalStatus().name());

            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteRental(int id) {

        String sql = "DELETE FROM rental WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Rental> getRentalsByUserId(int id){

        String sql = "SELECT * FROM rental WHERE customer_id = ?";
        List<Rental> rentals = new ArrayList<>();
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Rental rental = new Rental();
                rental.setId(resultSet.getInt("id"));
                rental.setCar(carService.getCarById(resultSet.getInt("car_id")));
                rental.setCustomer(customerService.getCustomerById(resultSet.getInt("customer_id")));
                rental.setStartDate(resultSet.getDate("start_date"));
                rental.setEndDate(resultSet.getDate("end_date"));
                rental.setTotalCost(resultSet.getDouble("total_cost"));
                rental.setRentalStatus(RentalStatus.valueOf(resultSet.getString("status")));
                rentals.add(rental);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rentals;
    }

    public List<Rental> getAllRentals() {
        String sql = "SELECT * FROM rental";
        List<Rental> rentals = new ArrayList<>();
        try (Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Rental rental = new Rental();
                rental.setId(resultSet.getInt("id"));
                rental.setCar(carService.getCarById(resultSet.getInt("car_id")));
                rental.setCustomer(customerService.getCustomerById(resultSet.getInt("customer_id")));
                rental.setStartDate(resultSet.getDate("start_date"));
                rental.setEndDate(resultSet.getDate("end_date"));
                rental.setTotalCost(resultSet.getDouble("total_cost"));
                rental.setRentalStatus(RentalStatus.valueOf(resultSet.getString("status")));
                rentals.add(rental);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rentals;
    }

    public Rental getRentalById(int id) {
        String sql = "SELECT * FROM rental WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Rental rental = new Rental();
                rental.setId(resultSet.getInt("id"));
                rental.setCar(carService.getCarById(resultSet.getInt("car_id")));
                rental.setCustomer(customerService.getCustomerById(resultSet.getInt("customer_id")));
                rental.setStartDate(resultSet.getDate("start_date"));
                rental.setEndDate(resultSet.getDate("end_date"));
                rental.setTotalCost(resultSet.getDouble("total_cost"));
                rental.setRentalStatus(RentalStatus.valueOf(resultSet.getString("status")));

                return rental;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void changeRental(Rental rental) {

        long days = java.time.temporal.ChronoUnit.DAYS.between(
                ((java.sql.Date) rental.getStartDate()).toLocalDate(),
                ((java.sql.Date) rental.getEndDate()).toLocalDate()
        );

        if (days <= 0) {
            days = 1;
        }

        double newTotalCost = days * rental.getCar().getDailyRate();
        rental.setTotalCost(newTotalCost);

        String sql = "UPDATE rental SET car_id = ?, customer_id = ?, start_date = ?, end_date = ?, total_cost = ?, status = ? WHERE id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, rental.getCar().getId());
            statement.setInt(2, rental.getCustomer().getId());
            statement.setDate(3, new java.sql.Date(rental.getStartDate().getTime()));
            statement.setDate(4, new java.sql.Date(rental.getEndDate().getTime()));
            statement.setDouble(5, rental.getTotalCost());
            statement.setString(6, rental.getRentalStatus().name());
            statement.setInt(7, rental.getId());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
