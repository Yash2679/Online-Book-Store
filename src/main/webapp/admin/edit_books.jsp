<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.*"%>
<%@page import="com.DB.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Book Details</title>
<%@include file="Designs.jsp"%>
<style type="text/css">
.divider-text {
	position: relative;
	text-align: center;
	margin-top: 15px;
	margin-bottom: 15px;
}

.divider-text span {
	padding: 7px;
	font-size: 12px;
	position: relative;
	z-index: 2;
}

.divider-text:after {
	content: "";
	position: absolute;
	width: 100%;
	border-bottom: 1px solid #ddd;
	top: 55%;
	left: 0;
	z-index: 1;
}

.btn-facebook {
	background-color: #405D9D;
	color: #fff;
}

.btn-twitter {
	background-color: #42AEEC;
	color: #fff;
}
</style>
</head>
<body>
<script>
  // Get a reference to the textarea element
  var descriptionTextArea = document.querySelector('textarea[name="description"]');

  // Use the value of the textarea
  var descriptionValue = descriptionTextArea.value;
  console.log(descriptionValue); // logs the text entered by the user
</script>
	<%@include file="navbar.jsp"%>
	<%
	// Check if the user is already logged in
	if (session.getAttribute("userobj") == null) {
		response.sendRedirect("../login.jsp");
	}
	%>
	<div class="container">
		<br>
		<hr>
		<div class="card bg-light ">
			<article class="card-body mx-auto w-75" style="max-width: 400px;">
				<h4 class="card-title mt-3 text-center">Update Book Details</h4>
				<p class="divider-text">
					<span></span>
				</p>
				<% 
				String succMsg = (String) session.getAttribute("succ");
				if (succMsg != null && !succMsg.isEmpty()) {
				%>
				<p class="text-center text-success"><%=succMsg%></p>
				<%
				session.removeAttribute("succ");
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

				<%
				String bookId = request.getParameter("id");
				String bookName = "";
				String authorName="";
				String description="";
					double price=0;
					 String category="";
					 String status="";
				Connection connection = DBConnect.getConn();
				Statement statement = connection.createStatement();
				String query = "SELECT * FROM book_details WHERE id = " + bookId;
				ResultSet resultSet = statement.executeQuery(query);
				if (resultSet.next()) {
				    bookName = resultSet.getString("book_name");
				     authorName = resultSet.getString("author_name");
				    price = resultSet.getDouble("price");
				     category = resultSet.getString("category");
				     status = resultSet.getString("status");
				     description = resultSet.getString("description");

				    // Use the fetched data to pre-fill the input fields in the edit form
				    // ...
				}
				
				%>

				<form action="../edit_books" method="post"
					>
					<input type="hidden" name="id" value="<%=bookId %>">

					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-book"></i>
							</span>
						</div>
						<input name="bname" class="form-control" placeholder="Book name"
							type="text" required value="<%=bookName%>">
					</div>
					<!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-user"></i>
							</span>
						</div>
						<input name="aname" class="form-control" placeholder="Author Name"
							type="text" required value="<%=authorName%>">
					</div>
					<!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i
								class="fa fa-inr"></i>
							</span>
						</div>
						<input name="price" class="form-control" placeholder="Price"
							type="text" required value="<%=price%>">
					</div>
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-th-list"></i>
							</span>
						</div>

						<select class="form-control " id="fiction" name="status">
							<option><%=status%></option>
							<%if(status.equalsIgnoreCase("active")) {%>
							<option>Inactive</option>
							<%}else{ %>
							<option>Active</option>
							<%}%>

						</select>
					</div>
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i
								class="fa fa-caret-right"></i>
							</span>
						</div>
						
							<textarea class="form-control" id="exampleFormControlTextarea1" name="description"
							rows="3"><%=description%></textarea>
					</div>
				
					<div class="form-group text-center">
						<button type="submit" class="btn btn-primary">Update</button>
					</div>

				</form>
			</article>
		</div>
		<!-- card.// -->

	</div>
	<!--container end.//-->

	<br>
	<br>
</body>
</html>