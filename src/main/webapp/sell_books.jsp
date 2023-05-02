<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/Designs.jsp"%>
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
	<%@include file="all_component/navbar.jsp"%>
	<%
	// Check if the user is already logged in
	if (session.getAttribute("userobj") == null) {
		response.sendRedirect("./login.jsp");
	}
	%>
	<script>
		function displayFileName() {
			var input = document.getElementById('image');
			var label = document.querySelector('.custom-file-label');
			var fileName = input.files[0].name;
			label.textContent = fileName;
		}
	</script>
	<div class="container">
		<br>
		<hr>
		<div class="card bg-light">
			<article class="card-body mx-auto" style="max-width: 400px;">
				<h4 class="card-title mt-3 text-center">Sell Book</h4>

				<p class="divider-text">
					<span></span>
				</p>
				<form action="add_old_book" method="post" enctype="multipart/form-data">
					<input type="hidden" value="${userobj.email}" name="user">
					<%
					String errorMsg = (String) session.getAttribute("error");
					if (errorMsg != null && !errorMsg.isEmpty()) {
					%>
					<p class="text-center text-danger"><%=errorMsg%></p>
					<%
					session.removeAttribute("error");
					}
					%>
					<%
					String errorMs = (String) session.getAttribute("succ");
					if (errorMs != null && !errorMs.isEmpty()) {
					%>
					<p class="text-center text-success"><%=errorMs%></p>
					<%
					session.removeAttribute("succ");
					}
					%>
					<!-- form-group// -->
					<div class="form-group">
						<label for="formGroupExampleInput">Book Name</label> <input
							type="text" class="form-control" id="formGroupExampleInput"
							placeholder="Book Name" name="bname">
					</div>
					<div class="form-group">
						<label for="formGroupExampleInput2">Author Name</label> <input
							type="text" class="form-control" id="formGroupExampleInput2"
							placeholder="Author Name" name="aname">
					</div>
					<div class="form-group">
						<label for="formGroupExampleInput2">Price</label> <input
							type="text" class="form-control" id="formGroupExampleInput2"
							placeholder="Price" name="price">
					</div>
					<div class="form-group">
					<label for="formGroupExampleInput2">Description</label>
							<textarea class="form-control" id="exampleFormControlTextarea1" name="description"
							rows="3"></textarea>
					</div>
					<div class="form-group">
						<label for="image">Upload Image</label>
						<div class="custom-file">
							<input type="file" class="custom-file-input" id="image"
								name="image" onchange="displayFileName()"> <label
								class="custom-file-label" for="image">Choose file</label>
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