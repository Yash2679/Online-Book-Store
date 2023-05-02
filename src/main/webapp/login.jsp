<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
	<div class="container">
		<br>
		<hr>
		<div class="card bg-light">
			<article class="card-body mx-auto" style="max-width: 400px;">
				<h4 class="card-title mt-3 text-center">Login</h4>
				<p class="text-center">Enter E-mail and Password</p>

				<p class="divider-text">
					<span></span>
				</p>
				<form action="login" method="post">
					<%
					String errorMsg = (String) session.getAttribute("error");
					if (errorMsg != null && !errorMsg.isEmpty()) {
					%>
					<p class="text-center text-danger"><%=errorMsg%></p>
					<%
					session.removeAttribute("error");
					}
					%>
					<%
					String errorMs = (String) session.getAttribute("succMsg");
					if (errorMs != null && !errorMs.isEmpty()) {
					%>
					<p class="text-center text-danger"><%=errorMs%></p>
					<%
					session.removeAttribute("succMsg");
					}
					%>
					<!-- form-group// -->
					<div class="form-group input-group">
						<input class="form-control" placeholder="Email address"
							type="email" name="email" required>
					</div>


					<!-- form-group end.// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-lock"></i>
							</span>
						</div>
						<input class="form-control" placeholder="Password" type="password"
							required name="password">
					</div>
					<!-- form-group// -->
					<!-- form-group// -->
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-block">
							Sign-In</button>
					</div>
					<!-- form-group// -->
					<p class="text-center">
						Dont't have an account? <a href="Register.jsp">Create Account</a>
					</p>
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