<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>

<h1>Your cart</h1>

<table>
    <tr>
        <th class="center">Quantity</th>
        <th class="center">Description</th>
        <th class="center">Price</th>
        <th class="center">Amount</th>
        <th></th>
    </tr>

    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <c:forEach var="item" items="${cart.items}">
        <tr>
            <td>
                <form action="cart" method="post">
                    <input type="hidden" name="productCode" value="${item.product.code}">
                    <input type="number" name="quantity" value="${item.quantity}" min="1" max="999" id="quantity"
                    oninput="if(this.value>999) this.value = 999; else if(this.value < 1) this.value = 1;">
                    <input type="submit" value="Update">
                </form>
            </td>
            <td>${item.product.description}</td>
            <td>${item.product.priceCurrencyFormat}</td>
            <td>${item.totalCurrencyFormat}</td>
            <td>
              <form action="cart" method="post">
                <input type="hidden" name="productCode"
                       value="${item.product.code}">
                <input type="hidden" name="quantity"
                       value="0">
                <input type="submit" value="Remove Item">
              </form>
            </td>
        </tr>
    </c:forEach>
    <tr>
        <th colspan="3" class="center">Amount Cart:</th>
        <td colspan="2" class="center"><b>${cart.totalCurrencyFormat}</b></td>
    </tr>
</table>

<p><b>To change the quantity</b>, enter the new quantity
    and click on the Update button.</p>

<form action="cart" method="post">
    <input type="hidden" name="action" value="shop">
    <input type="submit" value="Continue Shopping">
</form>

<form action="checkout.jsp" method="post" style="margin-top: 10px;">
    <input type="hidden" name="action" value="checkout">
    <input type="submit" value="Checkout">
</form>

</body>
</html>