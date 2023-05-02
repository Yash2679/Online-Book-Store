package com.DB;
import java.sql.Connection;
import java.sql.DriverManager;
public class DBConnect {
	private static Connection conn;
	
	public static Connection getConn() {
		String url = "jdbc:mysql://localhost:3306/ebook_project";
        String username = "root";
        String password = "b3b6145d";
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
	}
}
