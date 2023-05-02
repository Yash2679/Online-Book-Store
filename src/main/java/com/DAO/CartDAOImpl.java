package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.bookdetails;
import com.entity.cart;

public class CartDAOImpl implements CartDAO{
	private Connection conn;
	public CartDAOImpl(Connection conn) {
		this.conn=conn;
	}
	@Override
	public boolean addCart(cart c) {
		boolean f=false;
		try {
			String sql="insert into cart(bid,uid,bookName,author,price,total_price) values(?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, c.getBid());
			ps.setInt(2, c.getUserId());
			ps.setString(3, c.getBookName());
			ps.setString(4, c.getAuthor());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalPrice());
			int i=ps.executeUpdate();
			if(i==1)
				f=true;
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	@Override
	public List<cart> getBookByUser(int userId) {
		List<cart> list=new ArrayList<cart>();
		cart b=null;
		double totalPrice=0;
		try {
			String sql="select *from cart where uid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new cart();
				b.setCid(rs.getInt(1));
				b.setBid(rs.getInt(2));
				b.setUserId(rs.getInt(3));
				b.setBookName(rs.getString(4));
				b.setAuthor(rs.getString(5));
				b.setPrice(rs.getDouble(6));
				
				totalPrice=totalPrice+rs.getDouble(7);
				b.setTotalPrice(totalPrice);
				list.add(b);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	@Override
	public boolean deleteBook(int bid) {
		boolean f=false;
		
		try {
			String sql="delete from cart where bid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, bid);
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return f;
	}

}
