package com.example.carrentalee.service;

import com.example.carrentalee.db.DBConnectionProvider;
import com.example.carrentalee.enums.CarStatus;
import com.example.carrentalee.model.Car;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CarService {

    private Connection connection = DBConnectionProvider.getInstance().getConnection();

    public void addCar(Car car) {
        String sql = "INSERT INTO car(brand,model,year,daily_rate,status) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, car.getBrand());
            statement.setString(2, car.getModel());
            statement.setInt(3, car.getYear());
            statement.setDouble(4, car.getDailyRate());
            statement.setString(5, String.valueOf(car.getStatus()));
            statement.execute();
            ResultSet resultSet = statement.getGeneratedKeys();
            if (resultSet.next()) {
                car.setId(resultSet.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void deleteCar(int id) {

        String sql = "DELETE FROM car WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Car> getAllCars() {
        String sql = "SELECT * FROM car";
        List<Car> cars = new ArrayList<>();
        try (Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Car car = new Car();
                car.setId(resultSet.getInt("id"));
                car.setBrand(resultSet.getString("brand"));
                car.setModel(resultSet.getString("model"));
                car.setYear(resultSet.getInt("year"));
                car.setDailyRate(resultSet.getDouble("daily_rate"));
                car.setStatus(CarStatus.valueOf(resultSet.getString("status")));
                cars.add(car);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cars;
    }

    public Car getCarById(int id) {
        String sql = "SELECT * FROM car WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Car car = new Car();
                car.setId(resultSet.getInt("id"));
                car.setBrand(resultSet.getString("brand"));
                car.setModel(resultSet.getString("model"));
                car.setYear(resultSet.getInt("year"));
                car.setDailyRate(resultSet.getDouble("daily_rate"));
                car.setStatus(CarStatus.valueOf(resultSet.getString("status")));

                return car;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void changeCar(Car car) {
        String sql = "UPDATE car SET brand = ?, model = ?, year = ?, daily_rate = ?, status = ? WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, car.getBrand());
            statement.setString(2, car.getModel());
            statement.setInt(3, car.getYear());
            statement.setDouble(4, car.getDailyRate());
            statement.setString(5, String.valueOf(car.getStatus()));
            statement.setInt(6, car.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Car> getAvailableCars() {

        List<Car> cars = new ArrayList<>();

        String sql = "SELECT * FROM car WHERE status = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, CarStatus.AVAILABLE.name());

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Car car = new Car();
                car.setId(resultSet.getInt("id"));
                car.setBrand(resultSet.getString("brand"));
                car.setModel(resultSet.getString("model"));
                car.setYear(resultSet.getInt("year"));
                car.setDailyRate(resultSet.getDouble("daily_rate"));
                car.setStatus(CarStatus.valueOf(resultSet.getString("status")));

                cars.add(car);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cars;

    }
}
