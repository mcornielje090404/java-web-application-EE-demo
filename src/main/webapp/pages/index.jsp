<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<p />
<a href="${pageContext.request.contextPath}/api/hello-world">Hello Servlet</a>
<a href="calculator.jsp">Calculator</a>
</body>
</html>