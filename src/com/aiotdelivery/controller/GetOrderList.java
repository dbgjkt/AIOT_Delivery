package com.aiotdelivery.controller;

import com.aiotdelivery.DAO.DeliveryDAO;
import com.aiotdelivery.bean.ViewOrderListBean;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet("/GetOrderList")
public class GetOrderList extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        DeliveryDAO dao = new DeliveryDAO();
        List<ViewOrderListBean> ords;
        ords = dao.getOrderListAll();
        request.setAttribute("ords", ords);
    } // end of doGet()

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        doGet(request, response);
    } // end of doPost()
} // end of class GetAllMembers
