package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import org.apache.taglibs.standard.tag.common.fmt.ParseDateSupport;

import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/delete_old_book")
public class DeleteOldBook extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Connection conn = DBConnect.getConn();
		try {
			String email=req.getParameter("em");
			int id=Integer.parseInt(req.getParameter("id"));
			System.out.println(email);
			// prepare the delete statement
			String sql = "DELETE FROM book_details WHERE email=? and id=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setInt(2, id);

			// execute the delete statement
			int rowsDeleted = pstmt.executeUpdate();
			if (rowsDeleted > 0) {
				session.setAttribute("succMsg", "Book deleted successfully!");
				resp.sendRedirect("old_book.jsp");
			} else {
				session.setAttribute("failedMsg", "Book deletion failed!");
				resp.sendRedirect("old_book.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("failedMsg", "An error occurred while deleting Email!");
		}
	}

}
