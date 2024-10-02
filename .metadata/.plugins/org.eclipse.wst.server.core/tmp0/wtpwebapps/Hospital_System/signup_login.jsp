<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored ="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp page</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
<%@include file="component/navbar.jsp"%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Registration</p>
 
						<c:if test="${not empty succMsg}">
							<p class="fs-4 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if> 
						<c:if test="${not empty errorMsg}">
							<p class="fs-4 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<form action="user_ragister" method="post">
							<div class="mb-3">
								<label class="form-lable">Full Name</label><input required
									name="full_name" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-lable">Mobile Number</label><input required
									name="mobile" type="tel" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-lable">Email Address</label><input required
									name="email" type="email" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-lable">Password</label><input required
									name="password" type="password" class="form-control">
							</div>
							<a href="user_login.jsp"><button type="submit" class="btn bg-success text-white col-md-12">Register</button></a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>