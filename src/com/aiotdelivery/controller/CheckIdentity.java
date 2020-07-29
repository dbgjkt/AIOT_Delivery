package com.aiotdelivery.controller;

import com.aiotdelivery.DAO.DeliveryDAO;
import com.aiotdelivery.tools.MyStringFix;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CheckIdentity")
public class CheckIdentity extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        DeliveryDAO dao = new DeliveryDAO();
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        // cutUserName: user@xxx.com => user
        userName = MyStringFix.cutUserName(userName);

        // identity: 1=admin, 2=customer, 0=others.
        int identity = dao.checkIdentity2(userName, password);

        HttpSession session = request.getSession();
        session.setAttribute("identity", identity);
    } // end of doGet()

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        doGet(request, response);
    } // end of doPost()
} // end of class GetAllMembers
