<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    pageContext.setAttribute("invoiceCart", session.getAttribute("cart"));

    session.removeAttribute("cart");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Order Invoice - Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>
<h1>Order Invoice</h1>
<p>Thank you for your order! Below is your receipt summary:</p>

<c:choose>
    <c:when test="${not empty invoiceCart and not empty invoiceCart.items}">
        <table>
            <tr>
                <th class="center">Quantity</th>
                <th>Description</th>
                <th class="center">Unit Price</th>
                <th class="center">Amount</th>
            </tr>
            <c:set var="grandTotal" value="0" />
            <c:forEach var="item" items="${invoiceCart.items}">
                <tr>
                    <td class="center">${item.quantity}</td>
                    <td>${item.product.description}</td>
                    <td class="center">${item.product.priceCurrencyFormat}</td>
                    <td class="center">${item.totalCurrencyFormat}</td>
                </tr>
                <c:set var="grandTotal" value="${grandTotal + item.total}" />
            </c:forEach>
            <tr>
                <td colspan="3" style="text-align: right; font-weight: bold;">Total Amount:</td>
                <td class="center" style="font-weight: bold; color: #2c3e50; font-size: 110%;">
                    $${String.format("%.2f", grandTotal)}
                </td>
            </tr>
        </table>
    </c:when>
    <c:otherwise>
        <p><i>Your cart was empty. No items were ordered.</i></p>
    </c:otherwise>
</c:choose>

<form action="index.jsp" method="get" style="margin-top: 15px;">
    <input type="submit" value="Continue Shopping">
</form>
</body>
</html>