package com.admin.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/edit_books")
public class edit_books extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Connection conn = DBConnect.getConn(); // connection to the database

		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String bname = req.getParameter("bname");
			String aname = req.getParameter("aname");
			String description = req.getParameter("description");
			String status = req.getParameter("status");
			double price = Double.parseDouble(req.getParameter("price"));
//			System.out.println(id);
//			System.out.println(bname);
//			System.out.println(aname);
//			System.out.println(price);
//			System.out.println(description);
			System.out.println(status);
			// prepare the update statement
			String sql = "UPDATE book_details SET book_name=?, author_name=?, price=? ,status=? ,description=? WHERE id=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bname);
			pstmt.setString(2, aname);
			pstmt.setDouble(3, price);
			pstmt.setString(4, status);
			pstmt.setString(5, description);

			pstmt.setInt(6, id);

			// execute the update statement
			int rowsUpdated = pstmt.executeUpdate();
			if (rowsUpdated > 0) {
				session.setAttribute("success", "Book details updated successfully!");
			} else {
				session.setAttribute("error", "Failed to update book details!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "An error occurred while updating book details!");
		}

//		resp.sendRedirect("admin/edit_books.jsp?id=" + req.getParameter("id"));
		resp.sendRedirect("admin/all_books.jsp");
	}
}
