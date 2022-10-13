package com.example.web_servlet;

import java.io.*;
import java.util.ArrayList;

import com.example.web_servlet.data.ResponseData;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(urlPatterns = "", loadOnStartup = 0, name = "tttt")
public class ControllerServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {

        getServletContext().setAttribute("data",new ArrayList<ResponseData>());

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // if есть параметры в запросе
        // отправить на area check
        //else

        ArrayList<ResponseData> arrayList = (ArrayList<ResponseData>) getServletContext().getAttribute("data");
        if (request.getParameter("_x") != null && request.getParameter("_y") != null && request.getParameter("_r") != null) {
            if(arrayList ==null){
                getServletContext().setAttribute("data",new ArrayList<ResponseData>());
            }
            getServletContext().getRequestDispatcher("/result_check").forward(request, response);
        } else if (request.getParameter("clear") != null){
            if(arrayList !=null){
                arrayList.clear();
            }else {
                getServletContext().setAttribute("data",new ArrayList<ResponseData>());
            }

            getServletContext().getRequestDispatcher("/main.jsp").forward(request, response);
        }
        else {
            request.getRequestDispatcher("/main.jsp").forward(request, response);
        }
//
    }


}