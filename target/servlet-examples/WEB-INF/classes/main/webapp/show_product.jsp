<%@ page import="WebStore.DataManager" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    DataManager dm = (DataManager) application.getAttribute(DataManager.ATTRIBUTE_NAME);
    DataManager.Product product =  dm.getProductInfo(request.getParameter("id"));
%>
<html>
<head>
    <title><%=product.name%></title>
</head>
<body>
<h1><%= product.name %></h1>
<img src="<%="/store-images/"+product.imageFileName%>" alt="<%=product.name%>">

<form action="WebStore" method="post">
    $<%=product.productPrice%> <input name="productID" type="hidden" value="<%= product.productid %>"/>
    <input type="submit" value="Add to cart"/>
</form>
</body>
</html>
