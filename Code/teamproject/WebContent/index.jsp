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
<title>Product 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="css/styles.css" rel="stylesheet" />
<link rel="stylesheet" href="css/index.css">
<!-- 카드 숨김/표시 토글 함수-->

</head>
<script type="text/javascript">
window.onload = function () {
	$("#Emp_login").hide();
 }
$('document').ready(function(){ 
	$('#cus').on('click', function(){ 
		$("#Cus_login").show();
		$("#Emp_login").hide();
	})
	$('#emp').on('click',function(){
		$("#Emp_login").show();
		$("#Cus_login").hide();
	})
})
</script>
<body>
<%
Object grade = session.getAttribute("grade");
Object name = session.getAttribute("name");
%>
	<!-- 상단 네비바-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="#!">Start Bootstrap</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="index.jsp">
							Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">About</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">Services</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!--왼쪽 목록 리스트-->
	<%if(grade == null){ %>
		<button id = "cus">회원</button>
		<button id = "emp">직원</button>
		<button id = "Find_ID" onclick ="location.href='find_id.jsp'">아이디 찾기</button>
		<button type="button" onclick="location.href='Signin/choose.jsp' ">회원가입</button>
		<form id="Cus_login"action="Login/CusLoginproc.jsp" method="get">
			<div class="form-group">
				<label for="id">아이디</label>
				<input type="text" name="id" id="id" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="pw">비밀번호</label>
				<input type="text" name="pw" id="pw" class="form-control"/>
			</div>
			<input type="submit" value="로그인" class="btn btn-primary"/>
		</form>
		<form id="Emp_login" action="Login/EmpLoginproc.jsp" method="get">
			<div class="form-group">
				<label for="emp_id">사번</label>
				<input type="text" name="emp_id" id="emp_id" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="pw">비밀번호</label>
				<input type="text" name="pw" id="pw" class="form-control"/>
			</div>
			<input type="submit" value="로그인" class="btn btn-primary"/>
		</form>
		<%}else if(grade == "직원"){%>
	<div>
		안녕하세요<%=name %>님!
	</div>
	<div>
		너는 <%=grade %>
	</div>
	<form>
		<button type="button" onclick="location.href='View/Product.jsp' ">상품관리</button>
		<button type="button" onclick="location.href='View/Sales.jsp' ">매출관리</button>
		<button type="button" onclick="location.href='#' ">예약관리</button>
		<button type="button" onclick="location.href='#' ">직원관리</button>
		<button type="button" onclick="location.href='#' ">회원관리</button>
		<button type="button" onclick="location.href='Login/Logout.jsp' ">로그아웃</button>
	</form>
	<%}else if(grade == "손님"){%>
	<div>
	안녕하세요 <%=name %>님!
</div>
<div>
	너는 <%=grade %>
</div>
<form>
	<button type="button" onclick="location.href='Login/Logout.jsp' ">로그아웃</button>
</form>
<%} %>
	<!-- Footer--> 
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy 상준, 준석, 재혁, 승직 2021</p>
		</div>
	</footer>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>

</html>