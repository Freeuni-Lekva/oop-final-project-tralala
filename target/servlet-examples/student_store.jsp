<%@ page import="WebStore.DataManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Store</title>
</head>
<body>
    <h1>Student Store</h1>
    <p>Item available:</p>
    <ul>
        <%
            DataManager dm = (DataManager) application.getAttribute(DataManager.ATTRIBUTE_NAME);
            for (DataManager.Product p : dm.getProductsList()) {
        %>
            <li><a href="show_product.jsp?id=<%=p.productid%>"><%=p.name%></a></li>
        <%
            }
        %>
    </ul>
</body>
</html>
