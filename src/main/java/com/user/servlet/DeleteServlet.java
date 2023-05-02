package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/Delete_book")
public class DeleteServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		Connection conn = DBConnect.getConn();
//		CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
//		boolean f=dao.deleteBook(bid);
		try {
			int cid=Integer.parseInt(req.getParameter("cid"));
			System.out.println(cid);
			// prepare the delete statement
			String sql = "DELETE FROM cart WHERE cid=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cid);

			// execute the delete statement
			int rowsDeleted = pstmt.executeUpdate();
			if (rowsDeleted > 0) {
				session.setAttribute("succMsg", "Book deleted successfully!");
				resp.sendRedirect("cart.jsp");
			} else {
				session.setAttribute("failedMsg", "Book to delete Email!");
				resp.sendRedirect("cart.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("failedMsg", "An error occurred while deleting Email!");
		}
//		if(f) {
//			session.setAttribute("succMsg","Book Removed from Cart");
//			resp.sendRedirect("cart.jsp");
//		}else {
//			session.setAttribute("failedMsg","Something went wrong");
//			
//		}
	}
	
	

}
