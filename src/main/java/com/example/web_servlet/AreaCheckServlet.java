package com.example.web_servlet;

import com.example.web_servlet.data.ResponseData;
import com.example.web_servlet.data.Validator;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.awt.*;
import java.awt.geom.Area;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.ArrayList;

@WebServlet(urlPatterns = "/result_check")
public class AreaCheckServlet extends HttpServlet {
    private final Validator validator = new Validator(-2D,2D,-5D,3D,1D,4D);
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        final long start = System.nanoTime();

        double x, y, r;

        try {
            x = Double.parseDouble(request.getParameter("_x"));
            y = Double.parseDouble(request.getParameter("_y"));
            r = Double.parseDouble(request.getParameter("_r"));
        } catch (NullPointerException | NumberFormatException e) {
            response.sendError(400, "Invalid coordinates\n" + e);
            return;
        }

        if (validator.validate(x,y,r)) {
            response.sendError(400, "Invalid value");
            return;
        }



        final long end = System.nanoTime();
        ResponseData responseData = new ResponseData(x,y,r, LocalDateTime.now(),end-start,true);

        ServletContext servletContext = request.getServletContext();
        if(servletContext.getAttribute("data") == null){
            servletContext.setAttribute("data",new ArrayList<ResponseData>());

        }
        ArrayList<ResponseData> arrayList = ((ArrayList<ResponseData>) servletContext.getAttribute("data"));

        arrayList.add(responseData);
        request.getRequestDispatcher( "result.jsp").forward(request,response);

    }
}
