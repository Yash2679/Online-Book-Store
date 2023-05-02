<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.OrderBookImpl"%>
<%@page import="com.entity.user"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:All orders</title>

<%@include file="Designs.jsp"%>
<style>
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
	<script>
		const urlParams = new URLSearchParams(window.location.search);
		const status = urlParams.get('status');
		const approveBtn = document.getElementById('rejectbtn');
		console.log(approveBtn)
		if (status === 'rejected') {
			approveBtn.textContent = 'Rejected';
			approveBtn.disabled = true;
		}
	</script>
	<div class="container-fluid" style="width: 100%;">
		<h2 class="text-center">Order Details</h2>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Order ID</th>
					<th>Name</th>
					<th>Email</th>
					<th>Address</th>
					<th>Phone No</th>
					<th>Book Name</th>
					<th>Author</th>
					<th>Price</th>
					<th>Payment Type</th>
					<th>Action</th>


				</tr>
			</thead>
			<tbody>
				<%
				OrderBookImpl dao = new OrderBookImpl(DBConnect.getConn());
				List<Book_Order> blist = dao.getAllOrder();
				for (Book_Order b : blist) {
					
				%>
				<tr>
					<td scope="row"><%=b.getOrderId()%></td>
					<td scope="row"><%=b.getUserName()%></td>
					<td scope="row"><%=b.getEmail()%></td>
					<td scope="row"><%=b.getFulladd()%></td>
					<td scope="row"><%=b.getPhno()%></td>
					<td scope="row"><%=b.getBookName()%></td>
					<td scope="row"><%=b.getAuthor()%></td>
					<td scope="row"><%=b.getPrice()%></td>
					<td scope="row"><%=b.getPaymentType()%></td>
					
					<td class=>
						<form action="../approve_order" method="get"
							onsubmit="return confirm('Do you want to continue?')">
							<%if(b.getStatus()!=1) {%>
							<input type="hidden" name="bookId" value="<%=b.getId()%>">
							<input type="hidden" name="userEmail" value="<%=b.getEmail()%>">
							<button type="submit" class="btn btn-primary" name="buttonType"
								value="Approve">Approve</button>
							<button type="submit" name="buttonType" value="Reject"
								id="rejectbtn" class="btn btn-danger">Reject</button>
						</form>
					</td>
				</tr>
				<%
				}else{
				%>
				<button type="submit" class="btn btn-primary" name="buttonType"
								value="Approve" disabled	>Approved</button>
								<%}} %>
			</tbody>
		</table>
	</div>
</body>
</html>