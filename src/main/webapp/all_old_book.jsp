<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.bookdetails"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Old Books</title>
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
	<div class="container">
		<h3
			class="text-center mb-5 font-weight-bold text-uppercase rainbow rainbow_text_animated"
			style="font-family: 'Open Sans', sans-serif;">Old Book</h3>
		<div class="row">
			<div class="container">
				<div class="row">
					<%
					BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
					List<bookdetails> list3 = dao3.getAllOldBook();
					for (bookdetails b : list3) {
						if(b.getConsent()==1 || b.getEmail().equalsIgnoreCase("admin") ){	
					%>
					<div class="col-md-4 ">
						<div class="card mb-3 card-hover text-center">
							<img src="book/<%=b.getPhotoName()%>"
								class="card-img-top custom-image mx-auto" alt="Book 1">
							<div class="card-body">
								<h5 class="card-title"><%=b.getBookName()%></h5>
								<p class="card-text"><%=b.getAuthor()%></p>

								<div class="d-flex justify-content-center">
									 <a type="button"
										href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-secondary mr-3">View Details</a> <a
										href="" type="button" class="btn btn-success"><%=b.getPrice()%></a>
								</div>

							</div>
						</div>
					</div>
					<%
					}}
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>