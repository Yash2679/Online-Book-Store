package com.admin.servlet;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/storeEmail")
public class storeEmail extends HttpServlet{

	private static final long serialVersionUID = 1L;

		@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			 String message=null;
			try {
	            // Connect to the MySQL database
	            Connection connection = DBConnect.getConn();
	             

	            // Execute a SELECT query to retrieve the emails
	            Statement statement = connection.createStatement();
	            ResultSet resultSet = statement.executeQuery(
	                "SELECT user_email FROM subscribers"
	            );

	            // Open a file output stream and create a buffered writer
	            BufferedWriter writer = new BufferedWriter(new FileWriter("emails.txt"));

	            // Iterate over the ResultSet and write each email to the file
	            while (resultSet.next()) {
	            	
	                String email = resultSet.getString("user_email");
	                writer.write(email);
	                writer.newLine();
	            }
	            message = "Email-stored successfully";
	            // Close the file output stream and the database connection
	            writer.close();
	            statement.close();
	            connection.close();

	            System.out.println("Emails stored to file successfully.");
	        } catch (SQLException | IOException e) {
	            e.printStackTrace();
	        }
	        resp.setContentType("text/html");
	        PrintWriter out = resp.getWriter();
	        out.println("<html><head><script>alert('" + message + "'); window.location.href='admin/subscribers.jsp';</script></head><body></body></html>");
	    
	    }

	}


