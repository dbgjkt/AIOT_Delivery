package com.aiotdelivery.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditOrder")
public class EditOrder extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get dashboard counts, set attribute counts
        request.getRequestDispatcher("/GetOrderList")
                .include(request, response);

        // Get customer list, set attribute customers
        request.getRequestDispatcher("/GetCustomerList")
                .include(request, response);

        // Get order status list, set attribute orderStatus
        request.getRequestDispatcher("/GetOrderStatus")
                .include(request, response);

        request.setAttribute("orderId", request.getParameter("orderId"));
        
        // forward to jsp
        request.getRequestDispatcher("admin_order_edit.jsp")
                .forward(request, response);
    } // end of doGet()

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    } // end of doPost()
} // end of class GetAllMembers
