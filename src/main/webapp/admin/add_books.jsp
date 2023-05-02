<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Books</title>
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
				<h4 class="card-title mt-3 text-center">Add Book</h4>
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
				<form action="../add_books" method="post"
					enctype="multipart/form-data">

					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-book"></i>
							</span>
						</div>
						<input name="bname" class="form-control" placeholder="Book name"
							type="text" required>
					</div>
					<!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-user"></i>
							</span>
						</div>
						<input name="aname" class="form-control" placeholder="Author Name"
							type="text" required>
					</div>
					<!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i
								class="fa fa-caret-right"></i>
							</span>
						</div>
						<input name="price" class="form-control" placeholder="Price"
							type="text" required>
					</div>
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-th-list"></i>
							</span>
						</div>

						<select class="form-control " id="fiction" name="category">
							<option>Book Categories</option>
							<option>Old</option>
							<option>New</option>

						</select>
					</div>
					<!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-th-list"></i>
							</span>
						</div>

						<select class="form-control " id="fiction" name="status">
							<option>Book Status</option>
							<option>Active</option>
							<option>Inactive</option>

						</select>
					</div>
					<div class="form-group">
						<label for="exampleFormControlTextarea1">Add Description of Book: </label>
						<textarea class="form-control" id="exampleFormControlTextarea1" name="description"
							rows="3"></textarea>
					</div>
					<div class="form-group">
						<label for="book-image">Book Image:</label>
						<div class="custom-file">
							<input type="file" class="custom-file-input" id="book-image"
								class="book_image" name="book_image"> <label
								class="custom-file-label" for="book-image">Choose file</label>
						</div>
					</div>
					<div class="form-group text-center">
						<button type="submit" class="btn btn-primary">Add Book</button>
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