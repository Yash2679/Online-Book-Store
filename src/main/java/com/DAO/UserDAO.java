package com.DAO;

import com.entity.user;

public interface UserDAO {
	public boolean checkPassword(int id,String ps);
	
	public boolean  updateProfile(user us);
}
