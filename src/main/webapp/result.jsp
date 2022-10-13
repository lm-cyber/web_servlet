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

    <%= (String)request.getParameter("x") + " "%>
    <%= (String)request.getParameter("y") + " "%>
    <%= (String)request.getParameter("r") + " "%>
</div>

</body>
</html>
