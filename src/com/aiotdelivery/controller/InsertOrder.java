package com.aiotdelivery.controller;

import com.aiotdelivery.DAO.DeliveryDAO;
import com.aiotdelivery.bean.OrderListBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/InsertOrder")
public class InsertOrder extends HttpServlet {
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
        OrderListBean orderListBean = new OrderListBean();

        // set data in new Bean

        orderListBean.setCarId(request.getParameter("orderCarId"));
        orderListBean.setCustomerId(request.getParameter("orderCustomerId"));
        orderListBean.setArriveTime(request.getParameter("arriveTime"));
        orderListBean.setStartAddr("新北市板橋區民族路168號");
        orderListBean.setDestAddr(request.getParameter("destAddr"));
        orderListBean.setStatus(request.getParameter("orderStatus"));

        // set Bean in DAO
        dao.insertOrder(orderListBean);

        // forward to jsp
        request.getRequestDispatcher("Order")
                .forward(request, response);
    } // end of doGet()

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    } // end of doPost()
} // end of class GetAllMembers
