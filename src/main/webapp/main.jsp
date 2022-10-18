<%@ page import="com.example.web_servlet.data.ResponseData" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Random" %>
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
            <%
                for (int i=0; i < arrayList.size(); i++) {
            %>
                {
                    x: <%= arrayList.get(i).getX() %>,
                    y: <%= arrayList.get(i).getY() %>,
                    r: <%= arrayList.get(i).getR() %>,
                },
            <%
                }
            %>
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


    <form id="input-form" method="GET" action="<%= request.getContextPath() %>">

        <label for="_x">X:</label>
                <select id="_x" name="_x">
                    <option value="-2">-2</option>
                    <option value="-1.5">-1.5</option>
                    <option value="-1">-1</option>
                    <option value="-0.5">-0.5</option>
                    <option value="0">0</option>
                    <option value="0.5">0.5</option>
                    <option value="1">1</option>
                    <option value="1.5">1.5</option>
                    <option value="2">2</option>
                </select>
        <br>

        <label for="_y">Y:</label>
        <input type="text" id="_y" name="_y" placeholder="(-5 , 3)" maxlength="10"><br>

        <label for="_r">R:</label>
        <input type="text" id="_r" name="_r" placeholder="(1 , 4)" maxlength="10" value="2"><br>

        <input id="send" onclick="funcClick()" class="button" type="button" value="Send">

    </form>

    <form id="clear_form" action="<%= request.getContextPath()%>" method="GET">
        <button name="clear" id="clear" value="clear">clear</button>
    </form>




     <div id="results" class="panel">
            <h1>Results</h1>
            <div class="table-wrapper">
                <table>
                    <tbody>
                        <tr>
                            <th>Attempt #</th>
                            <th>X</th>
                            <th>Y</th>
                            <th>R</th>
                            <th>Result</th>
                            <th>Attempt time</th>
                            <th>Processing time</th>
                        </tr>
                        <% StringBuilder info = new StringBuilder();
                            Integer i=1;
                            for (ResponseData responseData: arrayList) {
                            info.append("<tr>"+"<td>"+i+"</td>"+responseData.block()+"</tr>");
                            i++;

                        }%>
                        <%=info.toString()%>
                    </tbody>
                </table>
            </div>
         <div>
                <button onclick="location.reload();">Go to main page</button>
         </div>
     </div>
</main>


</body>
</html>