<%--
  Created by IntelliJ IDEA.
  User: void
  Date: 12.10.2022
  Time: 22:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>

<html>
<head>
    <title>Title</title>
</head>
<body>

<div>
    hello asdasdas

    <%= (String)request.getParameter("_x") + " "%>
    <%= (String)request.getParameter("_y") + " "%>
    <%= (String)request.getParameter("_r") + " "%>
</div>

</body>
</html>
