package com.admin_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DbConnection;
import com.entity.Doctor;

@SuppressWarnings("serial")
@WebServlet("/addDoctor")

public class AddDoctor extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String fullname=req.getParameter("fullName");
			String dob=req.getParameter("dob");
			String qualification=req.getParameter("qualification");
			String specialist=req.getParameter("specialist");
			String email=req.getParameter("email");
			String mobile=req.getParameter("mobNo");
			String password=req.getParameter("password");

			Doctor d= new Doctor(fullname, dob, qualification, specialist, email, mobile, password);

			DoctorDao dao = new DoctorDao(DbConnection.getConnection());
			HttpSession session = req.getSession();
			if(dao.registerDoctor(d)) {
				session.setAttribute("succMsg", "Doctor Add Successfully");
				resp.sendRedirect("adminLogin/doctor.jsp");
			} else {
				session.setAttribute("errorMsg", "Somthing wrong");
				resp.sendRedirect("adminLogin/doctor.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}


