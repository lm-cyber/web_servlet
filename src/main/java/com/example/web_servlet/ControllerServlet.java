package com.example.web_servlet;

import java.io.*;

import com.example.web_servlet.attemptsmanagers.AttemptsManager;
import com.example.web_servlet.models.*;
import com.example.web_servlet.attemptsmanagers.SessionAttemptsManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(urlPatterns = "", loadOnStartup = 0)
public class ControllerServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // if есть параметры в запросе
        // отправить на area check
        //else

        final AttemptsManager am = new SessionAttemptsManager(request.getSession());
        request.setAttribute("attemptsManager", am);
        request.setAttribute("checker", checker);
        request.setAttribute("formManager", fm);

        if (request.getParameter("x") != null && request.getParameter("y") != null && request.getParameter("r") != null) {
            getServletContext().getRequestDispatcher("/check_point").forward(request, response);
            return;
        }
        request.getRequestDispatcher("/main.jsp").forward(request, response);
        if (request.getParameter("show-attempt") != null) {
            PointAttempt attemptToShow;
            try {
                attemptToShow = am.getAttempts().get(Integer.parseInt(request.getParameter("show-attempt")));
            } catch (NumberFormatException | IndexOutOfBoundsException e) {
                attemptToShow = null;
            }

            request.setAttribute("attemptToShow", attemptToShow);
            getServletContext().getRequestDispatcher("/WEB-INF/result.jsp").forward(request, response);
            return;
        }

        final String requestedPath = request.getRequestURI().substring(request.getContextPath().length());

        if (requestedPath.equals("/")) {
            getServletContext().getRequestDispatcher("/WEB-INF/main.jsp").forward(request, response);
        } else if (requestedPath.equals("/getBitmap")) {
            response.getWriter().print(bitmapB64);
        } else if (requestedPath.startsWith("/static")) {
            getServletContext().getNamedDispatcher("default").forward(request, response);
        } else {
            response.sendError(404, "Not found");
        }
    }

    public void destroy() {
    }
}