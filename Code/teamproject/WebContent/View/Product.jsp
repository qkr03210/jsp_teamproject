<%@page import="teamproject.Product_DBManager"%>
<%@page import="teamproject.Product"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Product_DBManager pddm = new Product_DBManager();
	ArrayList<Product> list = pddm.select();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승직이가 만드는중</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	window.onload = function() {
		document.getElementById('pd_search').onclick = function() {
			var name = document.getElementById('name');
		}
	}

	// 	$('document').ready(function() {
	// 		$('#seatsel').on('click', function() { location.href = 'seatsel.jsp';})
	// 		$('#logout').on('click', function() { location.href = 'logout.jsp';})
	// 	})
</script>
</head>
<body>
	<div class="jumbotron">
		<div class="form-group">
			<label for="name">제품명</label> <input type="text" class="form-control" id="product_name">
			<input type="button" value="검색" id="pd_search" class="btn btn-primary mr-2" />
		</div>
		
		<div class="btn-group">
			<button type="button" class="btn btn-primary onclick=" location.href='#'">간편식</button>
			<button type="button" class="btn btn-primary onclick=" location.href='#'">즉석식</button>
			<button type="button" class="btn btn-primary onclick=" location.href='#'">과자류</button>
			<button type="button" class="btn btn-primary onclick=" location.href='#'">아이스크림</button>
			<button type="button" class="btn btn-primary onclick=" location.href='#'">식품류</button>
			<button type="button" class="btn btn-primary onclick=" location.href='#'">음료류</button>
			<button type="button" class="btn btn-primary onclick=" location.href='#'">생활용품</button>
			<button type="button" class="btn btn-danger onclick=" location.href='../index.jsp'">돌아가기</button>
		</div>

	</div>
</body>
</html>