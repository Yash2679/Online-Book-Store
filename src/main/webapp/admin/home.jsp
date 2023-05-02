<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Home</title>
<%@include file="Designs.jsp"%>
<style>
.card {
	border-radius: 5px;
	box-shadow: 2px 2px 5px #ccc;
	margin-right: 20px;
	text-align: center;
}

.card i {
	font-size: 48px;
	margin-bottom: 10px;
}

.card-title {
	font-size: 24px;
	margin-bottom: 10px;
}

.card-text {
	font-size: 16px;
	margin-bottom: 10px;
}

.btn {
	font-size: 16px;
	padding: 10px 20px;
	background-color: #007bff;
	border: none;
	border-radius: 5px;
	color: #fff;
	cursor: pointer;
	transition: all 0.3s ease;
}

.btn:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%
	// Check if the user is already logged in
	if (session.getAttribute("userobj") == null) {
		response.sendRedirect("../login.jsp");
	}
	%>
	<div class="container">
		<div class="row p-5 justify-content-center">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<i class="fas fa-plus"></i>
						<h5 class="card-title"></h5>
						<a href="add_books.jsp"><button class="btn">Add
								Books</button></a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<i class="fas fa-list text-danger"></i>
						<h5 class="card-title"></h5>
						<a href="all_books.jsp"><button class="btn">List of
								Books</button></a>

					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<i class="fas fa-box-open fa-3x text-warning"></i>
						<h5 class="card-title"></h5>
						<a href="all_order.jsp"><button class="btn">Order
								Log</button></a>
					</div>
				</div>
			</div>
			<div class="col-md-4 p-4">
				<div class="card">
					<div class="card-body">
						<i class="fa fa-envelope fa-3x text-warning"></i>
						<h5 class="card-title"></h5>
						<a href="subscribers.jsp"><button class="btn">NewsLetter Subscribers
								</button></a>
					</div>
				</div>
			</div>
			<div class="col-md-4 p-4">
				<div class="card">
					<div class="card-body">
						<i class="fa fa-envelope fa-3x text-warning"></i>
						<h5 class="card-title"></h5>
						<a href="old_book_requests.jsp"><button class="btn">Requests
								</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>