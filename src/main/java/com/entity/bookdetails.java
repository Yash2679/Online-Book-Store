package com.entity;

public class bookdetails {
	private int bookId;
	private String bookName;
	private String author;
	private String price;
	private String bookCategory;
	private String status;
	private String photoName;
	private String email;
	private int consent;
	private String description;
	
	
	
	public bookdetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public bookdetails(int bookId, String bookName, String author, String price, String bookCategory, String status,
			String photoName, String email, int consent, String description) {
		super();
		this.bookId = bookId;
		this.bookName = bookName;
		this.author = author;
		this.price = price;
		this.bookCategory = bookCategory;
		this.status = status;
		this.photoName = photoName;
		this.email = email;
		this.consent = consent;
		this.description = description;
	}

	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getBookCategory() {
		return bookCategory;
	}
	public void setBookCategory(String bookCategory) {
		this.bookCategory = bookCategory;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public int getConsent() {
		return consent;
	}

	public void setConsent(int consent) {
		this.consent = consent;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
