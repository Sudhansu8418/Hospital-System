<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allcss.jsp"%>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
            border-radius: 10px;
        }

        .backImg {
            background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
                url("img/background.jpg");
            height: 20vh;
            width: 100%;
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            margin-bottom: 0;
        }
        </style>
</head>
<body>
 <%@include file="component/navbar.jsp"%>
  <!-- Background Section -->
    <div class="container-fluid backImg p-5">
        <p class="text-center fs-2 text-white"></p>
    </div>
    <div class="container p-3x"></div>

</body>
</html>