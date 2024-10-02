package com.admin_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DoctorDao;
import com.db.DbConnection;
import com.entity.Doctor;


@WebServlet("/editDoctor")
public class EditDoctorServlet extends HttpServlet {
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int doctorId = Integer.parseInt(request.getParameter("id"));
            DoctorDao dao = new DoctorDao(DbConnection.getConnection());
            Doctor doctor = dao.getDoctorById(doctorId);
            request.setAttribute("doctor", doctor);
            request.getRequestDispatcher("adminLogin/doctor.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            // Handle invalid ID format
            response.sendRedirect("adminLogin/doctor.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminLogin/doctor.jsp");
        }
    }
}


