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
        <input type="text" id="_y" name="_y" placeholder="(-5 , 3)"><br>

        <label for="_r">R:</label>
        <input type="text" id="_r" name="_r" placeholder="(1 , 4)"><br>

        <input id="b" onclick="funcClick()" class="button" type="button" value="Send">

    </form>

            <div>
                <button onclick="location.reload();">Go to main page</button>
            </div>


        </main>


</body>
</html>