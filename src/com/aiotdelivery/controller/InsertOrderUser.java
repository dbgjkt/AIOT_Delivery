package com.aiotdelivery.controller;

import com.aiotdelivery.DAO.DeliveryDAO;
import com.aiotdelivery.bean.CustomerBean;
import com.aiotdelivery.bean.ViewOrderListBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/InsertOrderUser")
public class InsertOrderUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // set character encoding
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        

        // new DAO
        DeliveryDAO dao = new DeliveryDAO();
        // new Bean
        ViewOrderListBean orderListBean = new ViewOrderListBean();

        // set data in new Bean
        orderListBean.setCustomerName(request.getParameter("user_name"));
        orderListBean.setDestAddr(request.getParameter("deli_addr"));
        orderListBean.setArriveTime(request.getParameter("deli_time"));
        System.out.println("addr:");
        System.out.println(request.getParameter("deli_addr"));

        // set userId 
        CustomerBean user = (CustomerBean) request.getSession().getAttribute("customer");
        String userId = user.getId();

        // INSERT: execute dao.func();
        dao.insertOrderByUser(orderListBean, userId);

        // forward to jsp
        request.getRequestDispatcher("UserMain").forward(request, response);
    } // end of doGet()

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    } // end of doPost()
} // end of class GetAllMembers
