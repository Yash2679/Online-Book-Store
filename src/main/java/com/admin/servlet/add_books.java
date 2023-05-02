package com.admin.servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.DB.DBConnect;
import com.entity.bookdetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/add_books")
@MultipartConfig
public class add_books extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		Connection conn = DBConnect.getConn(); // connection to the database

		try {
			String bname = req.getParameter("bname");
			String aname = req.getParameter("aname");
			String price = req.getParameter("price");
			String category = req.getParameter("category");
			String status = req.getParameter("status");
			String description = req.getParameter("description");
			String email="admin";
			Part part = req.getPart("book_image"); // input stream of the upload file
			String fileName = part.getSubmittedFileName();
			bookdetails b=new bookdetails();
			PreparedStatement stmt = conn
					.prepareStatement("SELECT COUNT(*) FROM book_details WHERE book_name=? AND author_name=?");
			stmt.setString(1, bname);
			stmt.setString(2, aname);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			if (count > 0) {
				// Book already exists, set an error message in the session
				session = req.getSession();
				session.setAttribute("error", "This book already exists in the library");
				resp.sendRedirect("admin/add_books.jsp");
				return;
			}

			// Insert the book into the database
			PreparedStatement ps = conn.prepareStatement(
					"INSERT INTO book_details (book_name, author_name, price, category, status,image_url,email,description) VALUES (?, ?, ?, ?, ?,?,?,?)");
			ps.setString(1, bname);
			ps.setString(2, aname);
			ps.setString(3, price);
			ps.setString(4, category);
			ps.setString(5, status);
			ps.setString(6, fileName);
			ps.setString(7, email);
			ps.setString(8, description);
//	            ps.setBinaryStream(6, imagePart.getInputStream(), imagePart.getSize());
			int rowsInserted = ps.executeUpdate();

			if (rowsInserted > 0) {
//				String path=getServletContext().getRealPath("")+"book";
				String path="C:\\Users\\Asus\\Eclipse\\E_Book\\src\\main\\webapp\\book";
				File f=new File(path);
				System.out.println(path);
				part.write(path+File.separator+fileName);
				session = req.getSession();
				session.setAttribute("succ", "Book Added Successfully");
				// Book added successfully, redirect to the home page
				resp.sendRedirect("admin/add_books.jsp");
			} else {
				// Error adding book, set an error message in the session
				session = req.getSession();
				session.setAttribute("error", "Error adding book, please try again");
				resp.sendRedirect("admin/add_books.jsp");
			}
		} catch (SQLException e) {
			// Database error, set an error message in the session
			session = req.getSession();
			session.setAttribute("error", "Database error, please try again");
			resp.sendRedirect("admin/add_books.jsp");
		}
	}
}
