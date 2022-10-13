<%@ page import="com.example.web_servlet.data.ResponseData" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>lab2</title>

    <script defer src="<%= request.getContextPath() %>/js/canvasXOY.js"></script>
    <script defer src="<%= request.getContextPath() %>/js/validation.js"></script>

    <title>lab1</title>
</head>
<body>
<header>
    <link rel="stylesheet" href="css/index.css">
    <div id="names-sign">
        Насибуллин&nbspАлан,&nbspP32312
    </div>
    <div id="lab-sign">lab 2<span><br>test</span></div>
    <div id="variant-sign">
        <div>
            Var: 66631219
        </div>
    </div>
</header>

<div class="bordered canvasContainer">
    <canvas  id="graph" width="350" height="350">
            <span>
              <img src="data/XOY.png" alt="Task grpah" width="350" height="350" />
            </span>
    </canvas>

</div>
<main>


    <%
        ServletContext servletContext = request.getServletContext();
        ArrayList<ResponseData> arrayList = ((ArrayList<ResponseData>) servletContext.getAttribute("data"));



    %>
        <%=arrayList.get(arrayList.size()-1)%>



    <div>
        <a href="<%= request.getContextPath() %>/" class="row-fill"><button>Return</button></a>
    </div>


</main>


</body>
</html>
