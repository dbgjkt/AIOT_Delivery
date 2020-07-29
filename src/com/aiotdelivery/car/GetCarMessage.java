package com.aiotdelivery.car;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aiotdelivery.DAO.DeliveryDAO;

@WebServlet("/GetCarMessage")
public class GetCarMessage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String distance = request.getParameter("distace");
        String id = "1";
        
        DeliveryDAO dao = new DeliveryDAO();
        dao.updateCarMessage(id, distance);
        
        String message = (Double.valueOf(distance)>20.0) ? "Safe!" : "Too close, watch out!";
        System.out.println(message);
        request.setAttribute("message", message);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
