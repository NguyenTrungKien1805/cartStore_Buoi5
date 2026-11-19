<%@ page import="java.util.ArrayList, murach.business.Product, murach.data.ProductIO" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    if (session.getAttribute("products") == null) {
        String path = application.getRealPath("/WEB-INF/products.txt");
        ArrayList<Product> products = ProductIO.getProducts(path);
        session.setAttribute("products", products);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>

<h1>CD list</h1>
<table>
    <tr>
        <th class="center">Description</th>
        <th class="center">Price</th>
        <th>&nbsp;</th>
    </tr>
    <c:forEach var="product" items="${products}">
        <tr>
            <td>${product.description}</td>
            <td class="center">${product.priceCurrencyFormat}</td>
            <td class="center">
                <form action="cart" method="post">
                    <input type="hidden" name="productCode" value="${product.code}">
                    <input type="submit" value="Add To Cart">
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

<form action="cart.jsp" method="get" style="margin-top: 15px">
    <input type="submit" value="View Cart">
</form>

</body>
</html>