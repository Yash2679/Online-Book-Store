<%@page import="com.entity.user"%>
<%@page import="com.entity.bookdetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<%@include file="all_component/Designs.jsp"%>

</head>
<body style="background-color: #f0f1f2;">
<script>
    function confirmAddtoCart(bookId, userId) {
        if (confirm("Are you sure you want to add this book?")) {
            window.location.href = "cart?bid=" + bookId + "&&uid=" + userId;
        }
    }
</script>
	<%@include file="all_component/navbar.jsp"%>
	<%

	user u = (user) session.getAttribute("userobj");
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	bookdetails b = dao.getBookById(bid);
	%>
	<div class="container p-3">

		<div class="row">
			<div class="col-md-6 d-flex flex-column align-items-center text-center p-2 border bg-white">
				<img src="book/<%=b.getPhotoName()%>"
					style="height: 250px; width: 230px"
					class="rounded border border-dark  border-width-2"> 
					
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookName()%></h2>
				<%
				if ("Old".equals(b.getBookCategory())) {
				%>
				<h5 class="text-primary">Contact to seller</h5>
				<h5 class="text-primary">
					<i class="fas fa-envelope"></i>E-Mail:<%=b.getEmail()%></h5>

				<%
				}
				%>
				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>
				<%
				if ("Old".equals(b.getBookCategory())) {
				%>
				
				<div class="text-center p-4">
					<a href="" class="btn btn-primary "><i class="fas fa-cart-plus"></i>Continue
						Shopping</a> <a href="" class="btn btn-danger"><i
						class="fas fa-inr"></i>200</a>
				</div>
				<%
				} else {
				%>
				<div class="text-center p-4">
					<%
					if (u == null) {
					%>
					<a href="login.jsp" type="button" class="btn btn-primary mr-3"><i
						class="fas fa-cart-plus"></i>Add to Cart</a>
					<%
					} else {
					%>
					<button
						onclick="confirmAddtoCart(<%=b.getBookId()%>, <%=u.getId()%>)"
						type="button" class="btn btn-primary mr-3">
						<i class="fas fa-cart-plus"></i> Add to Cart
					</button>
					<%
					}
					%>
				 <a href="" class="btn btn-danger"><i
						class="fas fa-inr"></i>200</a>
						<h5 class="mt-3">
					Book Name:<span class="text-success"><%=b.getBookName()%></span>
				</h5>
				<h5>
					Author Name:<span class="text-success"><%=b.getAuthor()%></span>
				</h5>
				<h5>
					Description:
				</h5>
				<p><%=b.getDescription() %></p>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>
</body>
</html>