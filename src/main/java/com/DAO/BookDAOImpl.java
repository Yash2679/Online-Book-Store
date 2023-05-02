package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnect;
import com.entity.bookdetails;

public class BookDAOImpl implements BookDAO {
	private Connection conn = DBConnect.getConn();

	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public List<bookdetails> getNewBook() {
		List<bookdetails> list = new ArrayList<bookdetails>();
		bookdetails b = null;
		try {
			String sql = "select *from book_details  where category=? and status=? order by id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 0;
			while (rs.next() && i < 3) {
				b = new bookdetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<bookdetails> getRecentBook() {
		List<bookdetails> list = new ArrayList<bookdetails>();
		bookdetails b = null;
		try {
			String sql = "select *from book_details  where status=? order by id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 0;
			while (rs.next() && i < 3) {
				b = new bookdetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<bookdetails> getOldBook() {
		List<bookdetails> list = new ArrayList<bookdetails>();
		bookdetails b = null;
		try {
			String sql = "select *from book_details  where category=? and status=? AND (email='admin' OR consent=1) ORDER BY id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 0;
			while (rs.next() && i < 3) {
				b = new bookdetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setConsent(rs.getInt(9));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<bookdetails> getAllRecentBook() {
		List<bookdetails> list = new ArrayList<bookdetails>();
		bookdetails b = null;
		try {
			String sql = "select *from book_details  where status=? order by id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new bookdetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<bookdetails> getAllNewBook() {
		List<bookdetails> list = new ArrayList<bookdetails>();
		bookdetails b = null;
		try {
			String sql = "select *from book_details  where category=? and status=? order by id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new bookdetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<bookdetails> getAllOldBook() {
		List<bookdetails> list = new ArrayList<bookdetails>();
		bookdetails b = null;
		try {
			String sql = "select *from book_details  where category=? and status=? order by id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new bookdetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setConsent(rs.getInt(9));
				list.add(b);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<String> getSubscribers() {
		List<String> list = new ArrayList<String>();
		try {
			String sql = "select user_email from subscribers ";
			PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				  list.add(rs.getString("user_email"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;	}

	@Override
	public bookdetails getBookById(int id) {
		bookdetails b=null;
		try {
			String sql = "select *from book_details  where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new bookdetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setDescription(rs.getString(10));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public List<bookdetails> getBookByOld(String email, String cat) {
		List<bookdetails> list = new ArrayList<bookdetails>();
		bookdetails b = null;
		try {
			String sql="select *from book_details where category=? and email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, cat);
			ps.setString(2, email);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new bookdetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setConsent(rs.getInt(9));
				list.add(b);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public boolean oldBookDelete(String email, String cat) {
		boolean f=false;
		try {
			String sql="delete from book_details where category=? and email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, cat);
			ps.setString(2, email);
			
			int i=ps.executeUpdate();
			if(i==1)
				f=true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return f;
	}

	@Override
	public List<bookdetails> getBookBySearch(String ch) {
		List<bookdetails> list = new ArrayList<bookdetails>();
		bookdetails b = null;
		try {
			String sql="select *from book_details where book_name like ? or author_name like ? or category=? and status=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new bookdetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public List<bookdetails> getBookByConsent() {
		List<bookdetails> list = new ArrayList<bookdetails>();
		bookdetails b = null;
		try {
			String sql="select *from book_details where consent=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, 0);
		
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new bookdetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setConsent(rs.getInt(9));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	}
