package com.user.servlet;

import java.io.*;
import java.sql.*;

import com.DB.DBConnect;
import com.entity.user;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		if (email != null && password != null) {
			try {
				// Check if the user's email and password match a record in the database
				Connection conn = DBConnect.getConn();
				String sql = "SELECT * FROM user WHERE email = ? AND password = ?";
				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, email);
				stmt.setString(2, password);
				ResultSet rs = stmt.executeQuery();
				HttpSession session = request.getSession();
				if (rs.next()) {

					// Check if the user is an admin
					if (rs.getBoolean("isAdmin")) {
						// Admin is authenticated

						user us = new user();
						session.setAttribute("userobj", us);

//						session.setAttribute("email", email);
						response.sendRedirect("admin/home.jsp");
					} else {
						// User is authenticated
						user us = new user();
						us.setId(rs.getInt(1));
						us.setName(rs.getString(2));
						us.setEmail(rs.getString(3));
						us.setPno(rs.getString(4));
						us.setPassword(rs.getString(5));

						session.setAttribute("userobj", us);

//						session.setAttribute("email", email);
						response.sendRedirect("index.jsp");
					}
				} else {
					// Invalid email or password
					session = request.getSession();
					session.setAttribute("error", "Invalid email or password");
					response.sendRedirect("login.jsp");
				}

			} catch (SQLException ex) {
				ex.printStackTrace();
				HttpSession session = request.getSession();
				session.setAttribute("error", "An error occurred");
				response.sendRedirect("login.jsp");
			}
		} else {
			// Email and/or password were not submitted
			HttpSession session = request.getSession();
			session.setAttribute("error", "Email and/or password are required");
			response.sendRedirect("login.jsp");
		}
	}
}
