package com.admin_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecialistDao;
import com.db.DbConnection;
@WebServlet("/addSpecialist")
public class AddSpecialist extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String spec= req.getParameter("specialistName");

		SpecialistDao dao=new SpecialistDao(DbConnection.getConnection());
		boolean f=dao.addSpecialist(spec);
		 HttpSession session= req.getSession();

		 if(f) {

				session.setAttribute("succMsg", "Specialist Added");
				resp.sendRedirect("adminLogin/index.jsp");

			} else
			{
				session.setAttribute("errorMsg", "Something Wrong On Server");
				resp.sendRedirect("admin_login.jsp");
			}
	}

}
