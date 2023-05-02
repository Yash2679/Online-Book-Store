<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.bookdetails"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="Designs.jsp"%>
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
	<div class="container">
		<h2 class="text-center p-3">Requests to sell Books</h2>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Book Name</th>
					<th>Author Name</th>
					<th>Price</th>
					<th>User E-mail</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());

				List<bookdetails> blist = dao.getBookByConsent();
				for (bookdetails b : blist) {
				%>
				<tr>
					<td scope="row"><%=b.getBookName()%></td>
					<td scope="row"><%=b.getAuthor()%></td>
					<td scope="row"><%=b.getPrice()%></td>
					<td scope="row"><%=b.getEmail()%></td>
					<td>
						<form action="../process_order" method="get"
							onsubmit="return confirm('Do you want to continue?')">
							<input type="hidden" name="bookId" value="<%=b.getBookId()%>">
							<input type="hidden" name="userEmail" value="<%=b.getEmail()%>">
							<button type="submit" class="btn btn-primary" name="buttonType"
								value="Approve">Approve</button>

							<button type="submit" name="buttonType" value="Reject"
								id="rejectbtn" class="btn btn-danger">Reject</button>
						</form>
					</td>
				</tr>
				<%
				}
				%>

			</tbody>
		</table>
	</div>

</body>
</html>