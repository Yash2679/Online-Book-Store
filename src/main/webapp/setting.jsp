<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/Designs.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}

.card:hover {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	transition: box-shadow 0.2s ease-in-out;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="all_component/navbar.jsp"%>
	<%
	// Check if the user is already logged in
	if (session.getAttribute("userobj") == null) {
		response.sendRedirect("./login.jsp");
	}
	%>
	<div class="container">
		<h3 class="text-center"></h3>
		<div class="row p-5">
			<div class="col-md-6">
				<a href="sell_books.jsp">

					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-book-open fa-3x"></i>

							</div>
							<h3>Sell Old Book</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6">
				<a href="edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-edit fa-3x"></i>
							</div>
							<h3>Edit Profile</h3>
						</div>
					</div>
				</a>
			</div>
		<!--  	<div class="col-md-4 mt-3">
				<a href="user_address.jsp">
					<div class="card">
						<div class="card-body  text-center">
							<div class="text-primary text-warning">
								<i class=" fas fa-map-marker-alt fa-3x"></i>
							</div>
							<h3>Your Address</h3>
							<p>Edit Address</p>
						</div>
					</div>
				</a>
			</div>-->
			<div class="col-md-6 mt-3">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body  text-center">
							<div class="text-primary text-danger">
								<i class=" fas fa-box-open fa-3x"></i>
							</div>
							<h3>My Order</h3>
							<p>Track your Order</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6 mt-3">
				<a href="">
					<div class="card">
						<div class="card-body  text-center">
							<div class="text-primary text-primary">
								<i class=" fa fa-phone-square fa-3x"></i>
							</div>
							<h3>Help Center</h3>
							<p>24*7</p>
						</div>
					</div>
				</a>
			</div>
			
				<div class="col-md-6 mt-3 mx-auto">
					<a href="old_book.jsp">
						<div class="card">
							<div class="card-body text-center">
								<div class="text-primary text-danger">
									<i class="fas fa-book-open fa-3x"></i>
								</div>
								<h3>Old Books</h3>
								<p>View/Delete Books</p>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	
</body>
</html>