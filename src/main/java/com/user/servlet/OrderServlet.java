package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.DAO.CartDAOImpl;
import com.DAO.OrderBookImpl;
import com.DB.DBConnect;
import com.entity.Book_Order;
import com.entity.cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pin");
			String payment = req.getParameter("payment");
			String fullAdd = address + "," + landmark + "," + city + "," + state + "," + pincode;
//			System.out.println(name);
//			System.out.println(email);
//			System.out.println(phno);
//			System.out.println(address);
//			System.out.println(landmark);
//			System.out.println(city);
//			System.out.println(state);
//			System.out.println(pincode);
//			System.out.println(payment);
//			System.out.println(fullAdd);
			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
			List<cart> blist = dao.getBookByUser(id);
			if (blist.isEmpty()) {
				session.setAttribute("error", "Your cart is Empty!!Please add some book to continue");
				resp.sendRedirect("cart.jsp");
			} else {
				OrderBookImpl dao2 = new OrderBookImpl(DBConnect.getConn());
				int i = dao2.getOrderNo();
				Book_Order o = null;
				ArrayList<Book_Order> orderList = new ArrayList<Book_Order>();
				for (cart c : blist) {
//				System.out.println(c.getBookName()+" "+c.getAuthor()+" "+c.getPrice());
					o = new Book_Order();
					o.setOrderId("BOOK-ORD-00" + i);
					o.setUserName(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladd(fullAdd);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice() + "");
					o.setPaymentType(payment);
					orderList.add(o);
					i++;
				}
				boolean f = dao2.saveOrder(orderList);
				if (f) {
//				System.out.println("Order Success");
//				session.setAttribute("succ", "Order Placed Successfully");
					resp.sendRedirect("order_success.jsp");
				} else {
//				System.out.println("Order Failed");
					session.setAttribute("error", "Some error Occured!!Please try again later.");
					resp.sendRedirect("cart.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
