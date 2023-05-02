<%@page import="java.util.List"%>
<%@page import="com.entity.cart"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
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
	<%
	// Check if the user is already logged in
	if (session.getAttribute("userobj") == null) {
		response.sendRedirect("./login.jsp");
	}
	%>
	<%@include file="all_component/navbar.jsp"%>

	<script>
		function confirmDelete(bookId) {
			if (confirm("Are you sure you want to delete this book?")) {
				window.location.href = "./Delete_book?cid=" + bookId;
			}
		}
	</script>
	<div class="container ">
		<%
		String errorMsg = (String) session.getAttribute("error");
		if (errorMsg != null && !errorMsg.isEmpty()) {
		%>
		<div class="alert alert-danger text-center"><%=errorMsg%></div>
		<%
		session.removeAttribute("error");
		}
		%>
		<%
		String errorMs = (String) session.getAttribute("succ");
		if (errorMs != null && !errorMs.isEmpty()) {
		%>
		<div class="alert alert-success text-center"><%=errorMs%></div>
		<%
		session.removeAttribute("succ");
		}
		%>
		<div class="row p-2">
			<div class="col-md-6 ">
				<div class="card bg-white border ">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Item:</h3>
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
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								user u = (user) session.getAttribute("userobj");
								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
								List<cart> cart = dao.getBookByUser(u.getId());
								Double totalPrice = 0.0;

								for (cart c : cart) {
									totalPrice = c.getTotalPrice();
								%>
								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td scope="row"><%=c.getAuthor()%></td>
									<td scope="row"><%=c.getPrice()%></td>
									<th scope="row">
										<button onclick="confirmDelete(<%=c.getCid()%>)"
											class="btn btn-sm btn-danger" type="button">Remove</button>
									</th>
								</tr>
								<%
								}
								%>
								<tr>
									<th class="text-danger">Total Price</th>
									<td></td>
									<td></td>
									<th class="text-success"><%=totalPrice%></th>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card p-3 border ">
					<div class="card-body "></div>
					<h3 class="text-center text-success">Your Details for Order</h3>
					<form method="post" action="order">
						<input type="hidden" value="${userobj.id }" name="id">
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="">Name</label> <input type="text"
									class="form-control" name="name" value="${userobj.name }"
									required>
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">E-Mail</label> <input type="email"
									class="form-control" name="email" value="${userobj.email }"
									required>
							</div>
						</div>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">Mobile No.</label> <input type="number"
									class="form-control" name="phno" value="${userobj.pno }"
									required>
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">Address</label> <input type="text"
									class="form-control" name="address" required>
							</div>
						</div>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">Landmark</label> <input type="text"
									class="form-control" name="landmark" required>
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">City</label> <input type="text"
									class="form-control" name="city" required>
							</div>
						</div>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">State</label> <input type="text"
									class="form-control" name="state" required>
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">Pincode</label> <input type="number"
									class="form-control" name="pin" required>
							</div>
						</div>
						<div class="form-group">
							<label>Payment Mode</label> <select class="form-control"
								name="payment" required>
								<option value="">--Select--</option>
								<option value="cod">Cash On Delivery</option>
							</select>
						</div>
						<div class="text-center">
							<button class="btn btn-warning">Order Now</button>
							<a href="index.jsp" class="btn btn-success">Continue Shopping</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>