package com.user_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DbConnection;
import com.entity.User;
@WebServlet("/user_ragister")
public class User_Ragister extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String fullname = req.getParameter("full_name");
			String mobile =req.getParameter("mobile");
			String email = req.getParameter("email");
			String password = req.getParameter("password");


			User u=new User(fullname , mobile, email, password);
			UserDao dao= new UserDao(DbConnection.getConnection());
			HttpSession session =req.getSession();
			boolean f=dao.ragister(u);
			if(f)
			{
				session.setAttribute("succMsg", "Ragister SuccessFully");
				resp.sendRedirect("signup_login.jsp");
			}
			else
			{
				session.setAttribute("errorMsg", "Somthing wrong on server");
			    resp.sendRedirect("signup_login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}


	}


