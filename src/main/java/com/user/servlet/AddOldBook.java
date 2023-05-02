package com.user.servlet;



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

@WebServlet("/add_old_book")
@MultipartConfig
public class AddOldBook extends HttpServlet {

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
			String category = "Old";
			String status = "Active";
			String description = req.getParameter("description");
			int consent=0;
			Part part = req.getPart("image"); // input stream of the upload file
			String fileName = part.getSubmittedFileName();
			String useremail=req.getParameter("user");	
			bookdetails b=new bookdetails();
//			System.out.println(bname);
//			System.out.println(price);
//			System.out.println(category);
//			System.out.println(status);
//			System.out.println(aname);
//			System.out.println(fileName);
//			System.out.println(useremail);
			
			

			// Insert the book into the database
			PreparedStatement ps = conn.prepareStatement(
					"INSERT INTO book_details (book_name, author_name, price, category, status,image_url,email,consent,description) VALUES (?, ?, ?, ?, ?,?,?,?,?)");
//		PreparedStatement ps = conn.prepareStatement(
//					"INSERT INTO book_details (book_name) VALUES (?)");
			System.out.println("hi");
			ps.setString(1, bname);
			ps.setString(2, aname);
			ps.setString(3, price);
			ps.setString(4, category);
			ps.setString(5, status);
			ps.setString(6, fileName);
			ps.setString(7, useremail);
			ps.setInt(8, consent);
			ps.setString(9, description);
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
				resp.sendRedirect("sell_books.jsp");
			} else {
				// Error adding book, set an error message in the session
				session = req.getSession();
				session.setAttribute("error", "Error adding book, please try again");
				resp.sendRedirect("sell_books.jsp");
			}
		} catch (SQLException e) {
			// Database error, set an error message in the session
			session = req.getSession();
			session.setAttribute("error", "Database error, please try again");
			resp.sendRedirect("sell_books.jsp");
		}
	}
}
