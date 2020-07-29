package com.aiotdelivery.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aiotdelivery.DAO.DeliveryDAO;
import com.aiotdelivery.bean.CustomerBean;

@WebServlet("/UpdateToCustomer")
public class UpdateToCustomer extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // set character encoding
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        // UPDATE
        CustomerBean customer = new CustomerBean();
        customer.setId(request.getParameter("customerId"));
        customer.setName(request.getParameter("customerName"));
        customer.setPhone(request.getParameter("customerPhone"));
        customer.setEmail(request.getParameter("customerEmail"));
        customer.setPayment(request.getParameter("customerPayment"));

        DeliveryDAO dao = new DeliveryDAO();
        dao.updateCustomer(customer);

        // forward to jsp
        request.getRequestDispatcher("Customer").forward(request, response);
    } // end of doGet()

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    } // end of doPost()
} // end of class GetAllMembers
