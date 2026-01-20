package com.example.carrentalee.filter;


import com.example.carrentalee.model.User;
import com.example.carrentalee.enums.UserRole;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter(urlPatterns = {
        "/addCar",
        "/addCustomer",
        "/adminPage",
        "/changeCar",
        "/changeCustomer",
        "/changeRental",
        "/customers",
        "/deleteCar",
        "/deleteCustomer",
        "/deleteCar",
        "/removeRental",
        "/deleteCar",
        "/deleteCar"
})
public class AdminAuthFilter implements Filter {


    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        if (servletRequest instanceof HttpServletRequest request) {
            User user = (User) request.getSession().getAttribute("user");
            if (user != null && user.getRole() == UserRole.ADMIN) {
                filterChain.doFilter(servletRequest, servletResponse);
            } else {
                ((HttpServletResponse) servletResponse).sendRedirect("/");
            }
        }
    }
}