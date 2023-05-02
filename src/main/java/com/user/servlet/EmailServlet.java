package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/subscribe")
public class EmailServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String message = "";
        Connection conn = DBConnect.getConn();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            stmt = conn.prepareStatement("SELECT * FROM subscribers WHERE user_email = ?");
            stmt.setString(1, email);
            rs = stmt.executeQuery();
            if (rs.next()) {
                // Email already exists
                message = email + " already exists with us!";
            } else {
                String sql = "INSERT INTO subscribers (user_email) VALUES (?)";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, email);
                int rowsInserted = stmt.executeUpdate();
                if (rowsInserted > 0) {
                    message = "Thank you for subscribing with " + email + "!";
                } else {
                    message = "Sorry, something went wrong. Please try again.";
                }
            }
        } catch (SQLException ex) {
            message = "Sorry, something went wrong. Please try again.";
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        out.println("<html><head><script>alert('" + message + "'); window.location.href='index.jsp';</script></head><body></body></html>");
    }
}
