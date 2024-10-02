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

@WebServlet("/updateDoctor")
public class UpdateDoctor extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id")); // Corrected parameter name
            String fullname = request.getParameter("fullName");
            String dob = request.getParameter("dob");
            String qualification = request.getParameter("qualification");
            String specialist = request.getParameter("specialist");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobNo");
            String password = request.getParameter("password");

            Doctor doctor = new Doctor(id, fullname, dob, qualification, specialist, email, mobile, password);
            DoctorDao dao = new DoctorDao(DbConnection.getConnection());
            HttpSession session = request.getSession();

            if (dao.updateDoctor(doctor)) {
                session.setAttribute("succMsg", "Doctor Updated Successfully");
                response.sendRedirect("adminLogin/doctor.jsp");
            } else {
                session.setAttribute("errorMsg", "Something went wrong");
                response.sendRedirect("adminLogin/doctor.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminLogin/doctor.jsp");
        }
    }
}
