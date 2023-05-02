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

@WebServlet("/Register")

public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String password=req.getParameter("password");
			
//			System.out.println(name+""+email+""+phno+"pass"+password);
//			String check=req.getParameter("password");
			user us=new user();
			us.setName(name);
			us.setEmail(email);
			us.setPno(phno);
			us.setPassword(password);
			
			HttpSession session=req.getSession();
			
			
			UserDAOImple dao=new UserDAOImple(DBConnect.getConn());
			boolean f=dao.userRegistration(us);
			if(f) {
				session.setAttribute("succMsg","Registration Successsfull..");
				resp.sendRedirect("Register.jsp");
//				
			}else {
				System.out.println("User Registration Successful");
				session.setAttribute("failedMsg","Something went wrong..");
				resp.sendRedirect("Register.jsp");
				System.out.println("User Registration Successful-2");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
