<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User: Home</title>
<%@include file="all_component/Designs.jsp" %>
</head>
<body>
<%@include file="all_component/navbar.jsp" %>
<h1>User home</h1>
<c:if test="${not empty userobj }">
<h1>Nmae:${userobj.name }</h1>
<h1>Nmae:${userobj.email }</h1>
</c:if>
</body>
</html>