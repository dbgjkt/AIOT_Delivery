package com.aiotdelivery.controller;

import com.aiotdelivery.DAO.DeliveryDAO;
import com.aiotdelivery.bean.ViewDashBoardCountBean;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/GetDashBoardCounts")
public class GetDashBoardCounts extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        DeliveryDAO dao = new DeliveryDAO();
        ViewDashBoardCountBean dbc = dao.getDashBoardCounts();

        HttpSession session = request.getSession();
        session.setAttribute("counts", dbc);
    } // end of doGet()

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        doGet(request, response);
    } // end of doPost()
} // end of class GetAllMembers
