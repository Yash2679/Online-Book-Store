<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
		function confirmDelete(bookId) {
			if (confirm("Are you sure you want to delete this book?")) {
				window.location.href = "../Delete_email?user_email=" + bookId;
			}
		}
	</script>
	<div class="container">
		<h2 class="text-center">Subscribers</h2>
		<% 
				String succMsg = (String) session.getAttribute("success");
				if (succMsg != null && !succMsg.isEmpty()) {
				%>
				<p class="text-center text-success"><%=succMsg%></p>
				<%
				session.removeAttribute("success");
				}
				%>
				<%
				String failMsg = (String) session.getAttribute("error");
				if (failMsg != null && !failMsg.isEmpty()) {
				%>
				<p class="text-center text-danger"><%=failMsg%></p>
				<%
				session.removeAttribute("error");
				}
				%>
		<table class="table table-striped">

			<thead>
				<tr>
					<th>Serial No.</th>
					<th>User Mail</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
				List<String> list2 = dao.getSubscribers();
				int i = 1;
				for (String b : list2) {
				%>
				<tr>
					<th><%=i%></th>
					<th><%=b%></th>
					<th><button class="btn btn-sm btn-danger" name="delete" type="submit"
						onclick="confirmDelete('<%=b%>')">Delete</button></th>
				</tr>
				<%
				i++;
				}
				%>
			</tbody>
		</table>
		<form method="get" action="../storeEmail">
		<button class="btn btn-sm btn-primary float-right"  name="update" type="submit"
						>Update E-mails</button>
						</form>
	</div>
</body>
</html>