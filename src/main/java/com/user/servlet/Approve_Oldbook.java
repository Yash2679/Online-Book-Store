package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/process_order")
public class Approve_Oldbook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bookId = Integer.parseInt(req.getParameter("bookId"));
		String userEmail = req.getParameter("userEmail");
		String buttonType = req.getParameter("buttonType");
//	        System.out.println(buttonType);
//	        System.out.println(bookId);
//	        System.out.println(userEmail);
		if (buttonType.equals("Approve")) {
//	        	System.out.println("hiueiwe");
			Connection conn = DBConnect.getConn();
			String query = "UPDATE book_details SET consent = 1 WHERE id = ? AND email = ?";
			try {
				PreparedStatement stmt = conn.prepareStatement(query);
				stmt.setInt(1, bookId);
				stmt.setString(2, userEmail);
				int rowsUpdated = stmt.executeUpdate();
				if (rowsUpdated > 0) {
					resp.sendRedirect("admin/old_book_requests.jsp");
				} else {
					resp.sendRedirect("admin/old_book_requests.jsp");
				}
			} catch (SQLException e) {
				e.printStackTrace();
				resp.sendRedirect("admin/old_book_requests.jsp");
			}
		}
		if (buttonType.equals("Reject")) {
			Connection conn = DBConnect.getConn();
			String query = "UPDATE book_details SET consent = -1 WHERE id = ? AND email = ?";
			try {
				PreparedStatement stmt = conn.prepareStatement(query);
				stmt.setInt(1, bookId);
				stmt.setString(2, userEmail);
				int rowsUpdated = stmt.executeUpdate();
				if (rowsUpdated > 0) {
					resp.sendRedirect("admin/old_book_requests.jsp");
				} else {
					resp.sendRedirect("admin/old_book_requests.jsp");
				}
			} catch (SQLException e) {
				e.printStackTrace();
				resp.sendRedirect("admin/old_book_requests.jsp");
			}

		}
	}
}
