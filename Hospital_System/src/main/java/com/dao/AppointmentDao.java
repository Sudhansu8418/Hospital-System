package com.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Appointment;
public class AppointmentDao {
	private Connection conn;

	public AppointmentDao(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean addAppointment(Appointment ad) {
		boolean f= false;
		try {
			String sql="insert into appointment(user_id,fullname,gender,age,appoint_date,email,phoen,diseases,doctor_id,address,status) values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, ad.getUser_id());
			ps.setString(2, ad.getFullname());
			ps.setString(3, ad.getGender());
			ps.setString(4, ad.getAge());
			ps.setString(5, ad.getAppoint_date());
			ps.setString(6, ad.getEmail());
			ps.setString(7, ad.getPhoen());
			ps.setString(8, ad.getDiseases());
			ps.setInt(9, ad.getDoctor_id());
			ps.setString(10, ad.getAddress());
			ps.setString(11, ad.getStatus());

			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
