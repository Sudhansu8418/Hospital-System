package com.admin_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DoctorDao;
import com.db.DbConnection;
@WebServlet("/deleteDoctor")
public class DeleteDoctorServlet extends HttpServlet {
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int doctorId = Integer.parseInt(request.getParameter("id"));
        DoctorDao dao = new DoctorDao(DbConnection.getConnection());
        dao.deleteDoctor(doctorId);
        response.sendRedirect("adminLogin/doctor.jsp");  // Redirect back to the list after deletion
    }
}