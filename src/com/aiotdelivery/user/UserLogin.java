package com.aiotdelivery.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // check Identity, set attribute identity
        // 1:admin, 2:customer, 0:others
        request.getRequestDispatcher("/CheckIdentity")
                .include(request, response);

        int identity = (int) request.getSession().getAttribute("identity");

        // check identity
        switch (identity) {
            case 1: // admin
                // Get User Info, set attribute user
                request.getRequestDispatcher("/GetAdminInfo")
                        .include(request, response);

                // forward to user main page
                request.getRequestDispatcher("/UserMain")
                        .forward(request, response);
                break;

            case 2: // customer
                // Get User Info, set attribute user
                request.getRequestDispatcher("/GetUserInfo")
                        .include(request, response);

                // forward to user main page
                request.getRequestDispatcher("/UserMain")
                        .forward(request, response);
                break;

            default: // others
                request.getRequestDispatcher("user_login.jsp")
                        .forward(request, response);
                break;
        }

    } // end of doGet()

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    } // end of doPost()
} // end of class GetAllMembers
