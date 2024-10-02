<%@page import= "com.db.DbConnection"%>
<%@page import= "java.sql.Connection"%>

<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index page</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.col-md-4 img {
	height: 350px;
	width: 300px;
	margin-top: 54px;
	margin-left: 48px;
	box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

     
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/hos.jpg.jpg" class="d-block w-100"
					alt="hospital image" height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/hos2.jpg.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/hos3.jpg.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<div class="container p-3">
		<p class="text-center fs-2">Key Feature of Our Hospital</p>
		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>Reference site about Lorem Ipsum, giving information on
									its origins, as well as a random Lipsum generator.</p>
							</div>
						</div>
					</div>

					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Clean Enviroment</p>
								<p>Reference site about Lorem Ipsum, giving information on
									its origins, as well as a random Lipsum generator.</p>
							</div>
						</div>
					</div>

					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Friendly Doctor</p>
								<p>Reference site about Lorem Ipsum, giving information on
									its origins, as well as a random Lipsum generator.</p>
							</div>
						</div>
					</div>

					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Medical Research</p>
								<p>Reference site about Lorem Ipsum, giving information on
									its origins, as well as a random Lipsum generator.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<img alt="" src="img/doc4.jpg">
			</div>
		</div>
	</div>
	<hr>
	<div class="container p-2">
		<p class="text-center fs-2">Our Team</p>
		<div class="row">
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="" src="img/doc4.jpg" width="240px" height="300px">
						<p class="fw-bold fs-5">Suman Saini</p>
						<p class="fs-7">CEO & Chairman</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="" src="img/doc2.jpg" width="240px" height="300px">
						<p class="fw-bold fs-5">Suman Saini</p>
						<p class="fs-7">CEO & Chairman</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="" src="img/doc2.jpg" width="240px" height="300px">
						<p class="fw-bold fs-5">Suman Saini</p>
						<p class="fs-7">CEO & Chairman</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="" src="img/doc3.jpg" width="240px" height="300px">
						<p class="fw-bold fs-5">Suman Saini</p>
						<p class="fs-7">CEO & Chairman</p>
					</div>
				</div>
			</div>
		</div>
	</div>

      <%@include file="component/footer.jsp"%>
</body>
</html>