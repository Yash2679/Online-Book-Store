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
@WebServlet("/Delete_Book")
public class Delete_Book extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Connection conn = DBConnect.getConn(); // connection to the database

		try {
			int id = Integer.parseInt(req.getParameter("id"));

			// prepare the delete statement
			String sql = "DELETE FROM book_details WHERE id=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);

			// execute the delete statement
			int rowsDeleted = pstmt.executeUpdate();
			if (rowsDeleted > 0) {
				session.setAttribute("success", "Book deleted successfully!");
			} else {
				session.setAttribute("error", "Failed to delete book!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "An error occurred while deleting book!");
		}

		resp.sendRedirect("admin/all_books.jsp");
	}
	}

	
	