<%@ page import="WebStore.DataManager" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="WebStore.ShoppingCart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    BigDecimal total = new BigDecimal(0);
    ShoppingCart cart = (ShoppingCart) session.getAttribute(ShoppingCart.ATTRIBUTE_NAME);
    DataManager dm = (DataManager) application.getAttribute(DataManager.ATTRIBUTE_NAME);
    ArrayList<DataManager.Product> products = dm.getProductsList(cart.getProductIDs());
%>
<html>
<head>
    <title>Shopping Cart</title>
</head>
<body>
<h1>Shopping Cart</h1>

<form action="WebStore" method="post">
    <ul>
        <%
            for (DataManager.Product product : products) {
                int quantityOfItems = cart.getQuantityOf(product.productid);
                total = total.add(product.productPrice.multiply(new BigDecimal(quantityOfItems)));
                out.print("<li> <input type ='number' value='" + quantityOfItems + "' name='" + product.productid + "'>"
                        + product.name + ", " + product.productPrice + "</li>");
            }
        %>
    </ul>
    Total: $ <%= total %> <input type="submit" value="Update Cart"/>
</form>
<a href="student_store.jsp">Continue shopping</a>
</body>
</html>
