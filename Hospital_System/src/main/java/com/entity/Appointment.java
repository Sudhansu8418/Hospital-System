package com.entity;

public class Appointment {
	private int id;
	private int user_id;
	private String fullname;
	private String gender;
	private String age;
	private String appoint_date;
	private String email;
	private String phoen;
	private String diseases;
	private int doctor_id;
	private String address;
	private String status;
	public Appointment() {
		super();
		// TODO Auto-generated constructor stub
		
	}
	public Appointment(int user_id, String fullname, String gender, String age, String appoint_date, String email,
			String phoen, String diseases, int doctor_id, String address, String status) {
		super();
		this.user_id = user_id;
		this.fullname = fullname;
		this.gender = gender;
		this.age = age;
		this.appoint_date = appoint_date;
		this.email = email;
		this.phoen = phoen;
		this.diseases = diseases;
		this.doctor_id = doctor_id;
		this.address = address;
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getAppoint_date() {
		return appoint_date;
	}
	public void setAppoint_date(String appoint_date) {
		this.appoint_date = appoint_date;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoen() {
		return phoen;
	}
	public void setPhoen(String phoen) {
		this.phoen = phoen;
	}
	public String getDiseases() {
		return diseases;
	}
	public void setDiseases(String diseases) {
		this.diseases = diseases;
	}
	public int getDoctor_id() {
		return doctor_id;
	}
	public void setDoctor_id(int doctor_id) {
		this.doctor_id = doctor_id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	