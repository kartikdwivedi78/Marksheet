<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>

<html>
<head>
<title>Show Error Page</title></head>
<body>
<p>Sorry,an error occurred</p>
<%exception.printStackTrace(response.getWriter()); %>
</body>
</html>