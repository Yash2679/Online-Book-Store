 <%@page import="com.entity.user"%>
<script>
function confirmLogout() {
  if (confirm("Are you sure you want to log out?")) {
    window.location.href = "./logout";
  }
}
</script>
<div class="container-fluid"
	style="height: 10px; background-color: #303f9f"></div>

<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3>Ebooks</h3>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search" name="ch">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>

		<%
		if (session.getAttribute("userobj") != null) {
		%>
		<div class="col-md-3">
			<a href="cart.jsp" class="btn btn-success"><i
				class="fas fa-cart-plus"></i></a> <a href="login.jsp"
				class="btn btn-success"><i class="fas fa-user-plus mr-2"></i>${userobj.name}</a>
				<a
				 class="mr-2"><button class="btn btn-primary" onclick="confirmLogout()"
					type="submit">
					<i class="fas fa-sign-out"></i> Logout
				</button></a>

		</div>
		<%
		} else {
		%>
		<div class="col-md-3">
			<a href="login.jsp" class="btn btn-success">Login</a> <a
				href="Register.jsp" class="btn btn-primary">Register</a>
		</div>
		<%
		}
		%>
	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="navbar-brand"
				href="index.jsp"><i class="fas fa-home"></i> Home</a> <span
				class="sr-only">(current)</span></li>
			
			<li class="nav-item active"><a class="nav-link active"
				href="all_new_book.jsp"><i class="fas fa-book"></i> New Editions</a></li>
			<li class="nav-item active"><a class="nav-link disabled"
				href="all_old_book.jsp"><i class="fas fa-book"></i> Old Editions</a></li>
		</ul>
		<form class="H form-inline my-2 my-lg-0">
			<a class="btn btn-light my-2 my-sm-0" type="submit" href="setting.jsp">
				<i class="fas fa-cog"></i>Setting
			</a>
			<button class="btn btn-light my-2 my-sm-0 ml-1" type="submit">
				<i class="fas fa-phone-square-alt"></i> Contact Us
			</button>
		</form>
	</div>
</nav>