package com.DAO;

import java.util.List;

import com.entity.bookdetails;

public interface BookDAO {
	public bookdetails getBookById(int id);
	public List<bookdetails> getNewBook();
	public List<bookdetails> getRecentBook();
	public List<bookdetails> getOldBook();
	public List<bookdetails> getAllRecentBook();
	public List<bookdetails> getAllNewBook();
	public List<bookdetails> getAllOldBook();
	public List<String> getSubscribers();
	public List<bookdetails> getBookByOld(String email,String cat);
	public boolean oldBookDelete(String email,String cat);
	public List<bookdetails> getBookBySearch(String ch);
	public List<bookdetails> getBookByConsent();
	
}
