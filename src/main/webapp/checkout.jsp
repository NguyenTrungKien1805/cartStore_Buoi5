<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    session.removeAttribute("cart");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>
<h1>Thank you for your order!</h1>
<p>Your order has been processed and your shopping cart is now empty.</p>

<form action="index.jsp" method="get" style="margin-top: 15px;">
    <input type="submit" value="Continue Shopping">
</form>
</body>
</html>