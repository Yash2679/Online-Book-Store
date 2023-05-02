package com.user.servlet;

import java.io.IOException;

import com.DAO.UserDAOImple;
import com.DB.DBConnect;
import com.entity.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/update_profile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			user us = new user();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPno(phno);
			UserDAOImple dao = new UserDAOImple(DBConnect.getConn());
			boolean f = dao.checkPassword(id, password);
			if (f) {
				boolean f2 = dao.updateProfile(us);
				if (f2) {
					session.setAttribute("succMsg", "User profile updated Successsfull..");
					resp.sendRedirect("edit_profile.jsp");
				} else {
					session.setAttribute("failedMsg", "Something wrong on Server Successsfull..");
					resp.sendRedirect("edit_profile.jsp");
				}
			} else {
				session.setAttribute("failedMsg", "Your Password is Incorrect..");
				resp.sendRedirect("edit_profile.jsp");
			}

		}

		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
