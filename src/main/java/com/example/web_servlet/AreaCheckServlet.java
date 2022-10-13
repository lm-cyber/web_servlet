package com.example.web_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/result_check")
public class AreaCheckServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // if есть параметры в запросе
        // отправить на area check
        //else
//        response.setContentType("text/html");//setting the content type
//        PrintWriter pw=response.getWriter();//get the stream to write the data
//
//        pw.println("<html><body>");
//        pw.println("Welcome to servlet");
//        pw.println("</body></html>");
//
//        pw.close();//closing the stream


        request.getRequestDispatcher( "result.jsp").forward(request,response);
    }
}
