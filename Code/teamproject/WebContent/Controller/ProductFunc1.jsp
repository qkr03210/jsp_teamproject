<%@page import="teamproject.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="teamproject.Product_DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<%
	String prod_name = request.getParameter("pd_name");
	int result=0;
 	Product_DBManager pddm = new Product_DBManager();
	ArrayList<Product> list = pddm.select2(prod_name);

	if(list!=null){
%>
	<!-- 상단 네비바-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="#!">Start Bootstrap</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation"
			>
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="#!"> Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">About</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">Services</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!--왼쪽 목록 리스트-->
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<h1 class="my-4">Shop Name</h1>
				<div class="list-group">
					<a class="list-group-item" id="all" href="#!">전체</a>
					<a class="list-group-item" id="sim" href="#!">간편식품</a>
					<a class="list-group-item" id="ins" href="#!">즉석식품</a>
					<a class="list-group-item" id="sna" href="#!">과자</a>
					<a class="list-group-item" id="ice" href="#!">아이스크림</a>
					<a class="list-group-item" id="foo" href="#!">기타식품</a>
					<a class="list-group-item" id="dri" href="#!">음료</a>
					<a class="list-group-item" id="lif" href="#!">생활용품</a>
				</div>
			</div>
			<div class="col-lg-9">
				<div class="carousel slide my-4" id="carouselExampleIndicators" data-ride="carousel">
					<ol class="carousel-indicators">
						<li class="active" data-target="#carouselExampleIndicators" data-slide-to="0"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block img-fluid" src="https://via.placeholder.com/900x350" alt="First slide" />
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="https://via.placeholder.com/900x350" alt="Second slide" />
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="https://via.placeholder.com/900x350" alt="Third slide" />
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
					</a> 
					<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
					</a>
				</div>
					<div class="form-inline">
						<input type="text" class="form-control col-md-10 mb-2 my-4 mr-4" placeholder="Enter search" id="product_name">
						<input type="button" value="검색" id="pd_search" class="btn btn-primary"/>
					</div>
				<div class="row">
					<%
					for (int i = 0; i < list.size(); i++) {
						Product ppu = list.get(i);
					%>
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..." /></a>
							<div class="card-body">
								<h10 class="card-title"> <a href="#!"> <%out.println(ppu.getPd_code() + ")");%> <%out.println(ppu.getPd_name());%>
								</a>
								<p class="card-text">
									<%out.print(ppu.getPd_classific() + " 유통기한 : ");%>
									<%out.print(ppu.getPd_exdate() + "일");%>
								</p>
								<h5>
									<%out.print(ppu.getPd_price() + "원");%>
								</h5>
							</div>
							<div class="card-footer">
								<small class="text-muted">
								<%out.print(ppu.getPd_type());%>
								</small>
							</div>
						</div>
					</div>
					<%
						}
					}
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>