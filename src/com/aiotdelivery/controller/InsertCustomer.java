package com.aiotdelivery.controller;

import com.aiotdelivery.DAO.DeliveryDAO;
import com.aiotdelivery.bean.CustomerBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/InsertCustomer")
public class InsertCustomer extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // set character encoding
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        // create new DAO
        DeliveryDAO dao = new DeliveryDAO();

        // create new Bean
        CustomerBean customerBean = new CustomerBean();

        // set data in new Bean
        customerBean.setId(request.getParameter("cusId"));
        customerBean.setName(request.getParameter("cusName"));
        customerBean.setPhone(request.getParameter("cusPhone"));
        customerBean.setEmail(request.getParameter("cusEmail"));
        customerBean.setPayment(request.getParameter("cusPay"));

        // set Bean in DAO
        dao.insertCustomer(customerBean);

        // forward to jsp
        request.getRequestDispatcher("Customer")
                .forward(request, response);
    } // end of doGet()

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    } // end of doPost()
} // end of class GetAllMembers
