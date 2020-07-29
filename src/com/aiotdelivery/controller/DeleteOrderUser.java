package com.aiotdelivery.controller;

import com.aiotdelivery.DAO.DeliveryDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteOrderUser")
public class DeleteOrderUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // DELETE
        String orderId = request.getParameter("orderId");
        DeliveryDAO dao = new DeliveryDAO();
        dao.deleteOrder(orderId);

        // forward to jsp
        request.getRequestDispatcher("UserMain").forward(request, response);

    } // end of doGet()

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    } // end of doPost()
} // end of class GetAllMembers
