<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="javax.naming.*"%>
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
    function confirmDelete(bookId) {
        if (confirm("Are you sure you want to delete this book?")) {
            window.location.href = "../Delete_Book?id=" + bookId;
        }
    }
</script>
	<div class="container text-center p-3">
		<h2>Book Details</h2>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Serial No.</th>
					<th>Image</th>
					<th>Book Name</th>
					<th>Author Name</th>
					<th>Price</th>
					<th>Category</th>
					<th>Status</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				try {
					bookdetails book = new bookdetails();
					Connection connection = DBConnect.getConn();
					Statement statement = connection.createStatement();
					String query = "SELECT * FROM book_details";
					ResultSet resultSet = statement.executeQuery(query);
					int counter = 1;
					while (resultSet.next()) {
						int bookId = resultSet.getInt("id");
						String s = resultSet.getString("image_url");
						String bookName = resultSet.getString("book_name");
						String authorName = resultSet.getString("author_name");
						double price = resultSet.getDouble("price");
						String category = resultSet.getString("category");
						String status = resultSet.getString("status");
						String image = resultSet.getString("image_url");
						int consent=resultSet.getInt("consent");
						String email=resultSet.getString("email");
						if(consent==1 || email.equalsIgnoreCase("admin")){
						out.println("<tr>");
						out.println("<td>" + counter + "</td>");
						out.println("<td><img src=\"../book/"+s+"\" style=\"width:50px; height:50px;\"></td>");
						out.println("<td>" + bookName + "</td>");
						out.println("<td>" + authorName + "</td>");
						out.println("<td><i class='fa fa-inr' aria-hidden='true'></i>" + String.format("%.2f", price) + "</td>");
						out.println("<td>" + category + "</td>");
						out.println("<td>" + status + "</td>");
						out.println("<td>");
						out.println("<a href=\"edit_books.jsp?id=" + bookId + "\">");
						out.println("<button class=\"btn btn-sm btn-primary\">Edit</button>");
						out.println("</a>");
						
					
						out.println("<button class=\"btn btn-sm btn-danger\" name=\"delete\" type=\"submit\" onclick=\"confirmDelete('" + bookId + "')\">Delete</button>");
						
						out.println("</td>");
						out.println("</tr>");
						counter++;
						}
					}
					resultSet.close();
					statement.close();
					connection.close();
				} catch (Exception e) {
					out.println("Error: " + e.getMessage());
				}
				%>

			</tbody>
		</table>
	</div>

</body>
</html>