
<%@page import="com.entity.user"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.bookdetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Books</title>
<%@include file="all_component/Designs.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #f6b93b;
	border-radius: 15px;
	transition: all 0.4s ease 0s;
}

.centered {
	font-size: 40px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.card-hover:hover {
	border: 1px solid red;
	box-shadow: 5px 5px 5px grey;
	transition: all 0.4s ease 0s;
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<script>
    function confirmAddtoCart(bookId, userId) {
        if (confirm("Are you sure you want to add this book?")) {
            window.location.href = "cart?bid=" + bookId + "&&uid=" + userId;
        }
    }
</script>
	<div class="container">
		<h3
			class="text-center mb-5 font-weight-bold text-uppercase rainbow rainbow_text_animated"
			style="font-family: 'Open Sans', sans-serif;">New Book</h3>
		<div class="row">

			<%
			user u = (user) session.getAttribute("userobj");

			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<bookdetails> list2 = dao.getNewBook();
			for (bookdetails b : list2) {
			%>
			<div class="col-md-4">
				<div class="card mb-3 card-hover text-center">
					<img src="book/<%=b.getPhotoName()%>"
						class="card-img-top custom-image mx-auto" alt="Book 1">
					<div class="card-body">
						<h5 class="card-title text-center"><%=b.getBookName()%></h5>
						<p class="card-text text-center"><%=b.getAuthor()%></p>
						<div class="d-flex justify-content-center">
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
							 <a type="button"
								href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-secondary mr-3">View Details</a> <a href=""
								type="button" class="btn btn-success"><i class="fa fa-inr"
								aria-hidden="true"></i><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
	</div>

</body>
</html>