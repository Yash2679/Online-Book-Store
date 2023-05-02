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

@WebServlet("/Delete_email")
public class Delete_email extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Connection conn = DBConnect.getConn(); // connection to the database

		try {
			String email = req.getParameter("user_email");
			System.out.println(email);
			// prepare the delete statement
			String sql = "DELETE FROM subscribers WHERE user_email=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);

			// execute the delete statement
			int rowsDeleted = pstmt.executeUpdate();
			if (rowsDeleted > 0) {
				session.setAttribute("success", "Email deleted successfully!");
			} else {
				session.setAttribute("error", "Failed to delete Email!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "An error occurred while deleting Email!");
		}

		resp.sendRedirect("admin/subscribers.jsp");
	}

}
