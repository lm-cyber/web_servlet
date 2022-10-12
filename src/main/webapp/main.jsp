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
    <table>
    <tr id="id_params" class="params">
        <td>X</td>
        <td>Y</td>
        <td>R</td>
    </tr>
    <tr>
        <td>
            <p>
                <select id="X" name="X">
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
            </p>
        </td>
        <td>
            <input id="Y" name="Y" type="text" placeholder="(-5 , 3)">
        </td>
        <td>
            <input id="R" name="R" type="text" placeholder="(1 , 4)">
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <input id="butt" onclick="funcClick()" class="button" type="button" value="Send">
            <input id="butt1" onclick="window.location='?clear'"  style="float:right;" class="button" type="button" value="Clear">
        </td>
    </tr>
    </table>

    <div>
                <table id="result-table">
                    <thead>
                        <tr>
                            <th>X</th>
                            <th>Y</th>
                            <th>R</th>
                            <th>Result</th>
                        </tr>
                    </thead>
                    <tbody>
<%--                    <c:forEach var="entry" items="${results}">--%>
<%--                        <tr>--%>
<%--                            <td>${entry.x}</td>--%>
<%--                            <td>${entry.y}</td>--%>
<%--                            <td>${entry.r}</td>--%>
<%--                            <c:if test="${entry.hitResult}"><td style="color: #3b993b">${entry.hitResult}</td></c:if>--%>
<%--                            <c:if test="${not entry.hitResult}"><td style="color: #cf1a1a">${entry.hitResult}</td></c:if>--%>
<%--                        </tr>--%>
<%--                    </c:forEach>--%>
                    </tbody>
                </table>
            </div>
            <div>
                <button onclick="location.reload();">Go to main page</button>
            </div>
        </main>


<h1><%= "Hello World!" %>
</h1>
<a href="result_check">Hello Servlet</a>
</body>
</html>