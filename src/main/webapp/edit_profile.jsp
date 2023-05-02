
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-Book:Registration</title>
<%@include file="all_component/Designs.jsp"%>
<style type="text/css">
.divider-text {
	position: relative;
	text-align: center;
	margin-top: 15px;
	margin-bottom: 15px;
}

.divider-text span {
	padding: 7px;
	font-size: 12px;
	position: relative;
	z-index: 2;
}

.divider-text:after {
	content: "";
	position: absolute;
	width: 100%;
	border-bottom: 1px solid #ddd;
	top: 55%;
	left: 0;
	z-index: 1;
}

.btn-facebook {
	background-color: #405D9D;
	color: #fff;
}

.btn-twitter {
	background-color: #42AEEC;
	color: #fff;
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
<%
	// Check if the user is already logged in
	if (session.getAttribute("userobj") == null) {
		response.sendRedirect("./login.jsp");
	}
	%>
	<div class="container">
		<br>
		<hr>
		<div class="card bg-light">
			<article class="card-body mx-auto" style="width: 400px;">
				<h4 class="card-title mt-3 text-center">Update Details</h4>
				
				<%
				String succMsg = (String) session.getAttribute("succMsg");
				if (succMsg != null && !succMsg.isEmpty()) {
				%>
				<p class="text-center text-success"><%=succMsg%></p>
				<%
				session.removeAttribute("succMsg");
				}
				%>
				<%
				String failMsg = (String) session.getAttribute("failedMsg");
				if (failMsg != null && !failMsg.isEmpty()) {
				%>
				<p class="text-center text-danger"><%=failMsg%></p>
				<%
				session.removeAttribute("failedMsg");
				}
				%>

				<p class="divider-text" >
					<span></span>
				</p>
				<form action="update_profile" method="post">
				<input type="hidden" value="${userobj.id}" name="id">
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-user"></i>
							</span>
						</div>
						<input name="fname" class="form-control" placeholder="Full name"
							type="text" required value="${userobj.name}">
					</div>
					<!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-envelope"></i>
							</span>
						</div>
						<input name="email" class="form-control"
							placeholder="Email address" type="email" required value="${userobj.email}">
					</div>
					<!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-phone"></i>
							</span>
						</div>
						 <input name="phno" class="form-control"
							placeholder="Phone number" type="text" required value="${userobj.pno}">
					</div>
					<!-- form-group// -->

					<!-- form-group end.// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-lock"></i>
							</span>
						</div>
						<input class="form-control" placeholder="Create password"
							type="password" required name="password">
					</div>
					<!-- form-group// -->
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-block">
							Update</button>
					</div>
					
				</form>
			</article>
		</div>
		<!-- card.// -->

	</div>
	<!--container end.//-->

	<br>
	<br>
</body>
</html>