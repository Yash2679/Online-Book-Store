package com.DAO;


import java.util.List;

import com.entity.cart;

public interface CartDAO {
	public boolean addCart(cart c);
	
	public List<cart> getBookByUser(int userId);
	public boolean deleteBook(int id);
}
