package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDao {
	private Connection conn;

	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean ragister(User u) {
		boolean f = false;
		try {
			String sql = " insert into user_detail(full_name,mobile,email,password) values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getFullname());
			ps.setString(2, u.getMobile());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getPassword());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}
public User login(String email , String password)
{

	User u = null;
	try {
		String sql="select * from user_detail where email=? and password=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, email);
		ps.setString(2, password);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			u=new User();
			u.setId(rs.getInt(1));
			u.setFullname(rs.getString(2));
			u.setMobile(rs.getString(3));
			u.setEmail(rs.getString(4));
			u.setPassword(rs.getString(5));
		}

	} catch (Exception e) {
		e.printStackTrace();
	}


	return u;

}
}
