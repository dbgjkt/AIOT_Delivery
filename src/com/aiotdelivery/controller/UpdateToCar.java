package com.aiotdelivery.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aiotdelivery.DAO.DeliveryDAO;
import com.aiotdelivery.bean.CarBean;

@WebServlet("/UpdateToCar")
public class UpdateToCar extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // set character encoding
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        // UPDATE
        CarBean car = new CarBean();
        car.setCarId(request.getParameter("carId"));
        car.setStatus(request.getParameter("status"));
        car.setCarLocation(request.getParameter("Location"));

        DeliveryDAO dao = new DeliveryDAO();
        dao.updateCar(car);

        // forward to jsp
        request.getRequestDispatcher("Car").forward(request, response);
    } // end of doGet()

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    } // end of doPost()
} // end of class GetAllMembers
