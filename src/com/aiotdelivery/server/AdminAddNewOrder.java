package com.aiotdelivery.server;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AdminAddNewOrder")
public class AdminAddNewOrder extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/GetCar")
                .include(request, response);

        request.getRequestDispatcher("/GetCustomerList")
                .include(request, response);

        request.getRequestDispatcher("/GetOrderStatus")
                .include(request, response);

        // forward to jsp
        request.getRequestDispatcher("admin_new_order.jsp")
                .forward(request, response);
    } // end of doGet()

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    } // end of doPost()
} // end of class GetAllMembers