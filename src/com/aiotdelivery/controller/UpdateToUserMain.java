package com.aiotdelivery.controller;

import com.aiotdelivery.DAO.DeliveryDAO;
import com.aiotdelivery.bean.OrderListBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdateToUserMain")
public class UpdateToUserMain extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // set character encoding
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        // UPDATE
        OrderListBean ord = new OrderListBean();
        ord.setOrderId(request.getParameter("orderId"));
        ord.setArriveTime(request.getParameter("arriveTime"));
        ord.setDestAddr(request.getParameter("destAddr"));

        DeliveryDAO dao = new DeliveryDAO();
        dao.updateOrderUser(ord);

        // forward to jsp
        request.getRequestDispatcher("UserMain").forward(request, response);
    } // end of doGet()

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    } // end of doPost()
} // end of class GetAllMembers
