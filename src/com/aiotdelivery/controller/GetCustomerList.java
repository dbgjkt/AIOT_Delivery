package com.aiotdelivery.controller;

import com.aiotdelivery.DAO.DeliveryDAO;
import com.aiotdelivery.bean.CustomerBean;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet("/GetCustomerList")
public class GetCustomerList extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        DeliveryDAO dao = new DeliveryDAO();
        List<CustomerBean> customers;
        customers = dao.getCustomerListAll();
        request.setAttribute("customers", customers);
    } // end of doGet()

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        doGet(request, response);
    } // end of doPost()
} // end of class GetAllMembers
