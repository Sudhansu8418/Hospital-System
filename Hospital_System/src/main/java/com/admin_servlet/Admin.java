package com.admin_servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DbConnection; // Make sure this is the correct import for your DbConnection class
import com.entity.User;

@SuppressWarnings("serial")
@WebServlet("/admin")
public class Admin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String email = req.getParameter("email");
            String pass = req.getParameter("password");
            HttpSession session = req.getSession();

            // Validate credentials against the database
            boolean isAdmin = false;
            Connection conn = DbConnection.getConnection();
            String query = "SELECT * FROM user_detail WHERE email = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, email);
            stmt.setString(2, pass);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Check if the user is an admin
                isAdmin = rs.getBoolean("IsAdmin");

                if (isAdmin) {
                    // Correctly setting a User object if login is successful and user is admin
                    session.setAttribute("adminObj", new User());
                    resp.sendRedirect("adminLogin/index.jsp");
                } else {
                    session.setAttribute("errorMsg", "Access denied: Not an admin");
                    resp.sendRedirect("admin_login.jsp");
                }
            } else {
                session.setAttribute("errorMsg", "Invalid User Name & password");
                resp.sendRedirect("admin_login.jsp");
            }

            // Clean up
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Database error", e);
        }
    }
}
