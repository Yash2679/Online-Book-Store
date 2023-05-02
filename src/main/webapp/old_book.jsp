<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.bookdetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
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
	<script>
		function confirmDeleteBook(email,id) {
			if (confirm("Are you sure you want to delete this book?")) {
				window.location.href = "./delete_old_book?em=" + email + "&id=" + id;
			}
		}
	</script>
	<div class="container pt-3">
		<h2 class="text-center">Status for Selling Books</h2>
		<%
		String errorMsg = (String) session.getAttribute("failedMsg");
		if (errorMsg != null && !errorMsg.isEmpty()) {
		%>
		<p class="text-center text-danger"><%=errorMsg%></p>
		<%
		session.removeAttribute("failedMsg");
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
		<table class="table table-striped">
			<thead class="bg-primary">
				<tr>

					<th>Book Name</th>
					<th>Author Name</th>
					<th>Price</th>
					<th>Category</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				user u = (user) session.getAttribute("userobj");
				String email = u.getEmail();
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
				List<bookdetails> list = dao.getBookByOld(email, "Old");
				for (bookdetails c : list) {
				%>
				<tr>
					<th scope="row"><%=c.getBookName()%></th>
					<td scope="row"><%=c.getAuthor()%></td>
					<td scope="row"><%=c.getPrice()%></td>
					<td scope="row"><%=c.getBookCategory()%></td>
					<th scope="row">
						<button onclick="confirmDeleteBook('<%=c.getEmail()%>', '<%=c.getBookId()%>')"
							class="btn btn-sm btn-danger" type="button">Remove</button>
					<%if(c.getConsent()==-1) {%>
					<button 
							class="btn btn-sm btn-danger" type="button" disabled>Rejected</button>
							<%} %>
							<%if(c.getConsent()==1) {%>
					<button 
							class="btn btn-sm btn-success" type="button" disabled>Approved</button>
							<%} %>
					</th>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

</body>
</html>