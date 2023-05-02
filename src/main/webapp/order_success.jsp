<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/Designs.jsp"%>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>
	<div class="container text-center mt-3">
		<i class="fas fa-check-circle fa-5x text-success">
			<h1>Thank You</h1>
			<h2>Your Order Successfully Placed.</h2>
			<h5>With in 7 days your product will be Deliverd In your Address</h5>
			<a href="index.jsp" class="btn btn-primary mt-3">Home</a>
			<a href="user_order.jsp" class="btn btn-danger mt-3">View Order</a>
		</i>
	</div>
</body>
</html>