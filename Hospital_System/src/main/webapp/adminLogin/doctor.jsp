<%@page import="com.entity.Doctor"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DbConnection"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Management</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.table-container {
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	/* Adding shadow to table container */
	width: 100%;
}

.table {
	width: 100%;
	margin-bottom: 1rem; margin-left : -1rem;
	color: #212529;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	margin-left: -1rem;
	/* Adding shadow to the table */
}

.table thead th {
	background-color: #6c757d; /* Grey header background */
	color: #fff; /* White text color */
	text-align: center;
}

.table tbody tr:hover {
	background-color: #f1f1f1; /* Light grey background on hover */
}

.table td, .table th {
	vertical-align: middle;
	text-align: center;
	padding: 8px;
}

.btn {
	margin: 0 5px;
	border-radius: 5px;
	padding: 8px 12px;
}

.btn-primary {
	background-color: #007bff;
	border-color: #007bff;
}

.btn-primary:hover {
	background-color: #0056b3;
	border-color: #004085;
}

.btn-danger {
	background-color: #dc3545;
	border-color: #dc3545;
}

.btn-danger:hover {
	background-color: #c82333;
	border-color: #bd2130;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<%
	String doctorId = request.getParameter("id");
	Doctor doctor = null;
	if (doctorId != null) {
		DoctorDao doctorDao = new DoctorDao(DbConnection.getConnection());
		doctor = doctorDao.getDoctorById(Integer.parseInt(doctorId));
	}
	%>

	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center"><%=doctor == null ? "Add Doctor" : "Edit Doctor"%></p>

						<!-- Set form action to either add or update based on if we are editing -->
						<%--  <form action="<%= doctor == null ? "../addDoctor" : "../updateDoctor" %>" method="post"> --%>
						<%-- <form action="${pageContext.request.contextPath}/updateDoctor" method="post"> --%>
						<form
							action="<%=doctor == null ? request.getContextPath() + "/addDoctor" : request.getContextPath() + "/updateDoctor"%>"
							method="post">
							<input type="hidden" name="id"
								value="<%=doctor != null ? doctor.getId() : ""%>">


							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									name="fullName" class="form-control"
									value="<%=doctor != null ? doctor.getFullName() : ""%>"
									required>
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="text"
									name="dob" class="form-control"
									value="<%=doctor != null ? doctor.getDob() : ""%>" required>
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									type="text" name="qualification" class="form-control"
									value="<%=doctor != null ? doctor.getQualification() : ""%>"
									required>
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label> <select
									name="specialist" class="form-control" required>
									<option>..select..</option>
									<%
									SpecialistDao specialistDao = new SpecialistDao(DbConnection.getConnection());
									List<Specialist> specialistList = specialistDao.getAllSpecialist();
									for (Specialist s : specialistList) {
									%>
									<option value="<%=s.getSpecialistName()%>"
										<%=doctor != null && doctor.getSpecialist().equals(s.getSpecialistName()) ? "selected" : ""%>>
										<%=s.getSpecialistName()%>
									</option>
									<%
									}
									%>
								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input type="email"
									name="email" class="form-control"
									value="<%=doctor != null ? doctor.getEmail() : ""%>" required>
							</div>

							<div class="mb-3">
								<label class="form-label">Mobile</label> <input type="text"
									name="mobNo" class="form-control"
									value="<%=doctor != null ? doctor.getMobNo() : ""%>" required>
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input
									type="password" name="password" class="form-control"
									value="<%=doctor != null ? doctor.getPassword() : ""%>"
									required>
							</div>
							<button type="submit" class="btn btn-success w-100"><%=doctor != null ? "Update" : "Submit"%></button>


						</form>
					</div>
				</div>
			</div>

			<div class="col-md-8">
				<div class="card paint-card">
					<div class="card-body table-container">
						<p class="fs-3 text-center">Doctor Details</p>
						<table class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialist</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No.</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								DoctorDao doctorDao = new DoctorDao(DbConnection.getConnection());
								List<Doctor> doctorList = doctorDao.getAllDoctors();
								for (Doctor doc : doctorList) {
								%>
								<tr>
									<td><%=doc.getFullName()%></td>
									<td><%=doc.getDob()%></td>
									<td><%=doc.getQualification()%></td>
									<td><%=doc.getSpecialist()%></td>
									<td><%=doc.getEmail()%></td>
									<td><%=doc.getMobNo()%></td>
									<td>
										<div class="d-flex">
											<a
												href="${pageContext.request.contextPath}/editDoctor?id=<%= doc.getId() %>"
												class="btn btn-primary btn-sm mr-2">Edit</a> <a
												href="${pageContext.request.contextPath}/deleteDoctor?id=<%= doc.getId() %>"
												class="btn btn-danger btn-sm"
												onclick="return confirm('Are you sure you want to delete this doctor?');">Delete</a>
										</div>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
