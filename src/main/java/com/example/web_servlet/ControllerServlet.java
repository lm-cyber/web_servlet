package com.example.web_servlet;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(urlPatterns = "", loadOnStartup = 0, name = "tttt")
public class ControllerServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // if есть параметры в запросе
        // отправить на area check
        //else
        if (request.getParameter("_x") != null && request.getParameter("_y") != null && request.getParameter("_r") != null) {
            getServletContext().getRequestDispatcher("/result_check").forward(request, response);
            return;
        }
        else {
            request.getRequestDispatcher("/main.jsp").forward(request, response);
        }
//
    }


}