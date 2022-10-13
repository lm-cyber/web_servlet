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
        <form id="input-form" action="<%= request.getContextPath() %>/result_check" method="GET">
            <fieldset>
                <legend><span id="legend-text">Проверьте вашу точку</span></legend>
                <table id="input-form-table">
                    <!-- X-input field -->
                    <tr class="label-col">
                        <td rowspan="2" class="input-grid-label">
                            <label class="bold-label">X[-5..3]: </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input name="x" id="xtextinput" type="text" class="number1" data-min="-5" data-max="3"
                                   data-separator=".">
                        </td>
                    </tr>

                    <!-- Y-input field -->
                    <tr class="label-col">
                        <td rowspan="2" class="input-grid-label">
                            <label class="bold-label">Y: </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <!-- There are a few checkbox fields that contained in one row of a table -->
                            <table>
                                <tr>
                                    <td class="r-checkbox">
                                        <label>
                                            <input type="checkbox" class="y-input-checkbox" id="ycheckbox1"
                                                   value="-2">
                                            <span>-2</span>
                                        </label>
                                    </td>
                                    <td class="r-checkbox">
                                        <label>
                                            <input type="checkbox" class="y-input-checkbox" id="ycheckbox2"
                                                   value="-1,5">
                                            <span>-1,5</span>
                                        </label>
                                    </td>
                                    <td class="r-checkbox">
                                        <label>
                                            <input type="checkbox" class="y-input-checkbox" id="ycheckbox3"
                                                   value="-1">
                                            <span>-1</span>
                                        </label>
                                    </td>
                                    <td class="r-checkbox">
                                        <label>
                                            <input type="checkbox" class="y-input-checkbox" id="ycheckbox4"
                                                   value="-0,5">
                                            <span>-0,5</span>
                                        </label>
                                    </td>
                                    <td class="r-checkbox">
                                        <label>
                                            <input type="checkbox" class="y-input-checkbox" id="ycheckbox5" value="0">
                                            <span>0</span>
                                        </label>
                                    </td>
                                    <td class="r-checkbox">
                                        <label>
                                            <input type="checkbox" class="y-input-checkbox" id="ycheckbox6"
                                                   value="0,5">
                                            <span>0,5</span>
                                        </label>
                                    </td>
                                    <td class="r-checkbox">
                                        <label>
                                            <input type="checkbox" class="y-input-checkbox" id="ycheckbox7" value="1">
                                            <span>1</span>
                                        </label>
                                    </td>
                                    <td class="r-checkbox">
                                        <label>
                                            <input type="checkbox" class="y-input-checkbox" id="ycheckbox8"
                                                   value="1,5">
                                            <span>1,5</span>
                                        </label>
                                    </td>
                                    <td class="r-checkbox">
                                        <label>
                                            <input type="checkbox" class="y-input-checkbox" id="ycheckbox9" value="2">
                                            <span>2</span>
                                        </label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <!-- R-input field -->
                    <tr class="label-col">
                        <td rowspan="2" class="input-grid-label">
                            <label class="bold-label">R: </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <!-- There are a few checkbox fields that contained in one row of a table -->
                            <table>
                                <tr>
                                    <td class="r-checkbox">
                                        <label>
                                            <input type="checkbox" class="r-input-checkbox" id="rcheckbox1"
                                                   value="1">
                                            <span>1</span>
                                        </label>
                                    </td>
                                    <td class="r-checkbox">
                                        <label>
                                            <input type="checkbox" class="r-input-checkbox" id="rcheckbox2"
                                                   value="2">
                                            <span>2</span>
                                        </label>
                                    </td>
                                    <td class="r-checkbox">
                                        <label>
                                            <input type="checkbox" class="r-input-checkbox" id="rcheckbox3"
                                                   value="3">
                                            <span>3</span>
                                        </label>
                                    </td>
                                    <td class="r-checkbox">
                                        <label>
                                            <input type="checkbox" class="r-input-checkbox" id="rcheckbox4"
                                                   value="4">
                                            <span>4</span>
                                        </label>
                                    </td>
                                    <td class="r-checkbox">
                                        <label>
                                            <input type="checkbox" class="r-input-checkbox" id="rcheckbox5" value="5"
                                                   checked>
                                            <span>5</span>
                                        </label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <input name='form' id="forsubmit" class="button-form" type="button" value="Проверить"
                       onclick="startPHP()">
                <input id="forreset" class="button-form" type="reset" value="Сбросить">
            </fieldset>
        </form>

    <form id="input_f" action="<%= request.getContextPath() %>/result_check" method="GET">
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

    </form>
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
                <button onclick="location.reload();">Go to main page</button>
            </div>


    <form method="GET" action="<%= request.getContextPath() %>">

        <label for="x">X:</label>
        <input type="text" id="_x" name="x"><br>

        <label for="y">Y:</label>
        <input type="text" id="_y" name="y"><br>

        <label for="r">R:</label>
        <input type="text" id="_r" name="r"><br>


        <button type="submit">Create Account</button>
    </form>
        </main>


<h1><%= "Hello World!" %>
</h1>
<a href="result_check">Hello Servlet</a>
</body>
</html>