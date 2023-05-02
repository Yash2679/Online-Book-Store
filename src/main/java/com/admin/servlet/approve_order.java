package com.admin.servlet;

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
@WebServlet("/approve_order")
public class approve_order extends HttpServlet {

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
			String query = "UPDATE book_order SET status = 1 WHERE id = ? AND email = ?";
			try {
				PreparedStatement stmt = conn.prepareStatement(query);
				stmt.setInt(1, bookId);
				stmt.setString(2, userEmail);
				int rowsUpdated = stmt.executeUpdate();
				if (rowsUpdated > 0) {
					resp.sendRedirect("admin/all_order.jsp");
				} else {
					resp.sendRedirect("admin/all_order.jsp");
				}
			} catch (SQLException e) {
				e.printStackTrace();
				resp.sendRedirect("admin/all_order.jsp");
			}
		}
		if (buttonType.equals("Reject")) {
			Connection conn = DBConnect.getConn();
			String query = "DELETE FROM book_order WHERE id = ? AND email = ?";
			try {
				PreparedStatement stmt = conn.prepareStatement(query);
				stmt.setInt(1, bookId);
				stmt.setString(2, userEmail);
				int rowsUpdated = stmt.executeUpdate();
				if (rowsUpdated > 0) {
					resp.sendRedirect("admin/all_order.jsp");
				} else {
					resp.sendRedirect("admin/all_order.jsp");
				}
			} catch (SQLException e) {
				e.printStackTrace();
				resp.sendRedirect("admin/all_order.jsp");
			}

		}
	}
}
