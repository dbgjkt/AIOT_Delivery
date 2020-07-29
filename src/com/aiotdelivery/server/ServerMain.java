package com.aiotdelivery.server;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ServerMain")
public class ServerMain extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get dashboard counts, set attribute counts
        request.getRequestDispatcher("/GetDashBoardCounts")
                .include(request, response);

        // Get dashboard pie chart data, set attribute pie
        request.getRequestDispatcher("/GetDashBoardPie")
                .include(request, response);

        // forward to jsp
        request.getRequestDispatcher("admin_main.jsp")
                .forward(request, response);
    } // end of doGet()

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    } // end of doPost()
} // end of class GetAllMembers
