<%@ page import="com.example.web_servlet.data.ResponseData" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>lab2</title>

    <%
        ServletContext servletContext = request.getServletContext();
        ArrayList<ResponseData> arrayList = ((ArrayList<ResponseData>) servletContext.getAttribute("data"));



    %>
    <script>
        const POINTS = [
            {
                x: <%= arrayList.get(arrayList.size()-1).getX() %>,
                y: <%= arrayList.get(arrayList.size()-1).getY() %>,
                r: <%= arrayList.get(arrayList.size()-1).getR() %>,
            }
        ]

    </script>
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



    <div id="results" class="panel">
        <h1>Results</h1>
        <div class="table-wrapper">
            <table>
                <tbody>
                <tr>
                    <th>X</th>
                    <th>Y</th>
                    <th>R</th>
                    <th>Result</th>
                    <th>Attempt time</th>
                    <th>Processing time</th>
                </tr>
                <%=
                        "<tr>"+arrayList.get(arrayList.size()-1).block()+"</tr>"

                    %>
                </tbody>
            </table>
        </div>
    </div>

    <div>
        <a href="<%= request.getContextPath() %>/" class="row-fill"><button>Return</button></a>
    </div>


</main>


</body>
</html>
