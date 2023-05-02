<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.OrderBookImpl"%>
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
	<%
	// Check if the user is already logged in
	if (session.getAttribute("userobj") == null) {
		response.sendRedirect("./login.jsp");
	}
	%>
	<h2 class="text-center">Placed Orders</h2>
	<table class="table table-striped mx-auto w-75 mt-3">

		<thead class="">
			<tr>
				<th>Order Id</th>
				<th>Name</th>
				<th>Book Name</th>
				<th>Author</th>
				<th>Price</th>
				<th>Payment Type</th>
				<th>Status</th>
			</tr>
		</thead>
		<tbody>
			<%
			user u = (user) session.getAttribute("userobj");
			OrderBookImpl dao = new OrderBookImpl(DBConnect.getConn());
			List<Book_Order> blist = dao.getBook(u.getEmail());
			
			for (Book_Order b : blist) {
			%>
			<tr>
				<td scope="row"><%=b.getOrderId()%></td>
				<td scope="row"><%=b.getUserName()%></td>
				<td scope="row"><%=b.getBookName()%></td>
				<td scope="row"><%=b.getAuthor()%></td>
				<td scope="row"><%=b.getPrice()%></td>
				<td scope="row"><%=b.getPaymentType()%></td>
				<%
				if (b.getStatus() == 1) {
				%>
				<td><button type="submit" class="btn btn-success"
						name="buttonType" value="Approve" disabled>Approved</button></td>
				<%
				} else {
				%>
				<td><button class="btn btn-warning" disabled>Pending</button></td>
				<%
				}
				%>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>

</body>
</html>