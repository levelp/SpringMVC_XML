<%@ page pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
<h1>Таблица умножения</h1>

<%
    int[][] m = (int[][]) request.getAttribute("m");
%>
<table border="1">
        <% for (int[] line : m) { %>
    <tr>
        <% for (int v : line) { %>
        <td><%=v %>
        </td>
        <% }%>
    </tr>
        <% } %>
</body>
</html>