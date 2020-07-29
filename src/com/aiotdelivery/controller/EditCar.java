package com.aiotdelivery.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditCar")
public class EditCar extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // get car list, set attribute cars
        request.getRequestDispatcher("/GetCarInfo")
                .include(request, response);

        // get car status, set attribute carStatus
        request.getRequestDispatcher("/GetCarStatus")
                .include(request, response);
        
        request.setAttribute("carId", request.getParameter("carId"));

        // forward to jsp
        request.getRequestDispatcher("admin_car_edit.jsp")
                .forward(request, response);
    } // end of doGet()

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    } // end of doPost()
} // end of class GetAllMembers
