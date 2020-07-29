package com.aiotdelivery.server;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ServerLogin")
public class ServerLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // check Identity, set attribute identity
        // 1:admin, 2:customer, 0:others
        request.getRequestDispatcher("/CheckIdentity")
                .include(request, response);

        int identity = (int) request.getSession().getAttribute("identity");

        // check identity
        if (identity == 1) { // admin
            // Get User Info, set attribute user
            request.getRequestDispatcher("/GetAdminInfo")
                    .include(request, response);

            // forward to user main page
            request.getRequestDispatcher("/ServerMain")
                    .forward(request, response);
        } else {
            request.getRequestDispatcher("admin_login.jsp")
                    .forward(request, response);
        }

    } // end of doGet()

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    } // end of doPost()
} // end of class GetAllMembers
