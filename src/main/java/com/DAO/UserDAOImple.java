package com.DAO;

import java.sql.*;
import com.entity.user;

public class UserDAOImple implements UserDAO {

	private Connection conn;

	public UserDAOImple(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean userRegistration(user us) {
		boolean f = false;

		try {
			String sql = "select * from user where email=?";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, us.getEmail());
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				// Email already exists in the database
				return false;
			} else {
				sql = "insert into user(name,email,phon,password) values(?,?,?,?)";
				st = conn.prepareStatement(sql);
				st.setString(1, us.getName());
				st.setString(2, us.getEmail());
				st.setString(3, us.getPno());
				st.setString(4, us.getPassword());

				int i = st.executeUpdate();
				if (i == 1) {
					f = true;
				}
			}
			rs.close();
			st.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean checkPassword(int id, String ps) {
		boolean f = false;
		try {
			String sql = "select *from user where id=? and password=?";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setInt(1, id);
			st.setString(2, ps);

			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean updateProfile(user us) {
		boolean f = false;
		try {
			String sql = "update user set name=?, email=?,phon=? where id=?";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, us.getName());
			st.setString(2, us.getEmail());
			st.setString(3, us.getPno());
			st.setInt(4, us.getId());
			int i = st.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (

		Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}