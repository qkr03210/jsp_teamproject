<%@page import="teamproject.Product_DBManager"%>
<%@page import="teamproject.Product"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pd_name = request.getParameter("pd_name");
	Product_DBManager pddm = new Product_DBManager();
	ArrayList<Product> list = null;
	
	if(pd_name == null)
		list = pddm.select();
	else
		list = pddm.select2(pd_name);
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

<script type="text/javascript">
      window.onload = function () {
         document.getElementById('pd_search').onclick = function () {
            var pd_name = document.getElementById('pd_name');
            location.href = '../View/Product.jsp?pd_name=' + pd_name.value;
         }
      }

      //    $('document').ready(function() {
      //       $('#seatsel').on('click', function() { location.href = 'seatsel.jsp';})
      //       $('#logout').on('click', function() { location.href = 'logout.jsp';})
      //    })
   </script>

<!-- 카드 숨김/표시 토글 함수-->
<script>
      $(document).ready(function () {
         $("#all").click(function () {
       	allhide();
            $("#all_result").toggle();
         });
         $("#sim").click(function () {
        	 allhide();
            $("#sim_result").toggle();
         });
         $("#ins").click(function () {
        	 allhide();
            $("#ins_result").toggle();
         });
         $("#sna").click(function () {
        	 allhide();
            $("#sna_result").toggle();
         });
         $("#ice").click(function () {
        	 allhide();
            $("#ice_result").toggle();
         });
         $("#foo").click(function () {
        	 allhide();
            $("#foo_result").toggle();
         });
         $("#dri").click(function () {
        	 allhide();
            $("#dri_result").toggle();
         });
         $("#lif").click(function () {
        	 allhide();
            $("#lif_result").toggle();
         });

         function allhide() {
             $("#all_result").hide();
            $("#sim_result").hide();
            $("#ins_result").hide();
            $("#sna_result").hide();
            $("#ice_result").hide();
            $("#foo_result").hide();
            $("#dri_result").hide();
            $("#lif_result").hide();
         }
         allhide();
      });
   </script>

</head>

<body>
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
					<li class="nav-item active"><a class="nav-link" href="../index.jsp">
							Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="stock.jsp">재고</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">Services</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!--왼쪽 목록 리스트-->
	<div class="container">
		<div class="row">
			<div class="col-lg-3 mb-5">
				<h1 class="my-4">Shop Name</h1>
				<div class="list-group">
					<a class="list-group-item" id="all" href="#!">전체</a> <a
						class="list-group-item" id="sim" href="#!">간편식품</a> <a
						class="list-group-item" id="ins" href="#!">즉석식품</a> <a
						class="list-group-item" id="sna" href="#!">과자</a> <a
						class="list-group-item" id="ice" href="#!">아이스크림</a> <a
						class="list-group-item" id="foo" href="#!">기타식품</a> <a
						class="list-group-item" id="dri" href="#!">음료</a> <a
						class="list-group-item" id="lif" href="#!">생활용품</a>
				</div>
			</div>
			<div class="col-lg-9">
				<div class="carousel slide my-4" id="carouselExampleIndicators"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li class="active" data-target="#carouselExampleIndicators"
							data-slide-to="0"></li>
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
					<div class="form-inline mb-4">
						<input type="text" class="form-control col-md-10 mb-2 my-4 mr-4" placeholder="Enter search" id="pd_name" value="<%=pd_name %>"/>
						<input type="button" value="검색" id="pd_search" class="btn btn-primary" />
					</div>
				<div class="row mb-4" id="all_result">
					<%
					for (int i = 0; i < list.size(); i++) {
						Product ppu = list.get(i);
					%>
					<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
							<a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..." /></a>
							<div class="card-body">
								<h9 class="card-title"> <a href="#!"> <%out.println(ppu.getPd_code() + ")");%>
									<%out.println(ppu.getPd_name());%> </h9>
								</a>
								<p class="card-text">
									<%out.print(ppu.getPd_classific());%>
									<br>
									<%out.print(" 유통기한 : " + ppu.getPd_exdate() + "일");%>
								</p>
								<h6>
									<%out.print(ppu.getPd_price() + "원");%>
								</h6>
							</div>
							<div class="card-footer">
								<small class="text-muted"> <%out.print(ppu.getPd_type());%> </small>
							</div>
						</div>
					</div>
					<%
					}
					%>
				</div>
				<div class="row mb-4" id="sim_result">
					<%
					for (int i = 0; i < list.size(); i++) {
						Product ppu = list.get(i);
						if (ppu.getPd_classific().equals("simple")) {
					%>
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..." /></a>
							<div class="card-body">
								<h9 class="card-title"> <a href="#!"> <%out.println(ppu.getPd_code() + ")");%>
									<%out.println(ppu.getPd_name());%> </h9>
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
								<small class="text-muted"> <%out.print(ppu.getPd_type());%> </small>
							</div>
						</div>
					</div>
					<%
						}
					}
					%>
				</div>
				<div class="row mb-4" id="ins_result">
					<%
					for (int i = 0; i < list.size(); i++) {
						Product ppu = list.get(i);
						if (ppu.getPd_classific().equals("instant")) {
					%>
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..." /></a>
							<div class="card-body">
								<h9 class="card-title"> <a href="#!"> <%out.println(ppu.getPd_code() + ")");%>
									<%out.println(ppu.getPd_name());%> </h9>
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
								<small class="text-muted"> <%out.print(ppu.getPd_type());%> </small>
							</div>
						</div>
					</div>
					<%
						}
					}					
					%>
				</div>
				<div class="row mb-4" id="sna_result">
					<%
					for (int i = 0; i < list.size(); i++) {
						Product ppu = list.get(i);
						if (ppu.getPd_classific().equals("snack")) {
					%>
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..." /></a>
							<div class="card-body">
								<h9 class="card-title"> <a href="#!"> <%out.println(ppu.getPd_code() + ")");%>
									<%out.println(ppu.getPd_name());%> </h9>
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
								<small class="text-muted"> <%out.print(ppu.getPd_type());%>
								</small>
							</div>
						</div>
					</div>
					<%
						}
					}
					%>
				</div>
				<div class="row mb-4" id="ice_result">
					<%
					for (int i = 0; i < list.size(); i++) {
						Product ppu = list.get(i);
						if (ppu.getPd_classific().equals("icecream")) {
					%>
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#!"><img class="card-img-top"
								src="https://via.placeholder.com/700x400" alt="..." /></a>
							<div class="card-body">
								<h9 class="card-title"> <a href="#!"> <%out.println(ppu.getPd_code() + ")");%>
									<%out.println(ppu.getPd_name());%> </h9> 
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
								<small class="text-muted"> <%out.print(ppu.getPd_type());%>
								</small>
							</div>
						</div>
					</div>
					<%
						}
					}
					%>
				</div>
				<div class="row mb-4" id="foo_result">
					<%
					for (int i = 0; i < list.size(); i++) {
						Product ppu = list.get(i);
						if (ppu.getPd_classific().equals("food")) {
					%>
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#!"><img class="card-img-top"
								src="https://via.placeholder.com/700x400" alt="..." /></a>
							<div class="card-body">
								<h9 class="card-title"> <a href="#!"> <%out.println(ppu.getPd_code() + ")");%>
									<%out.println(ppu.getPd_name());%> </h9>
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
								<small class="text-muted"> <%out.print(ppu.getPd_type());%>
								</small>
							</div>
						</div>
					</div>
					<%
						}
					}
					%>
				</div>
				<div class="row mb-4" id="dri_result">
					<%
					for (int i = 0; i < list.size(); i++) {
						Product ppu = list.get(i);
						if (ppu.getPd_classific().equals("drink")) {
					%>
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#!"><img class="card-img-top"
								src="https://via.placeholder.com/700x400" alt="..." /></a>
							<div class="card-body">
								<h9 class="card-title"> <a href="#!"> <%out.println(ppu.getPd_code() + ")");%>
									<%out.println(ppu.getPd_name());%> </h9>
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
								<small class="text-muted"> <%out.print(ppu.getPd_type());%>
								</small>
							</div>
						</div>
					</div>
					<%
					}
					}
					%>
				</div>
				<div class="row mb-4" id="lif_result">
					<%
					for (int i = 0; i < list.size(); i++) {
						Product ppu = list.get(i);
						if (ppu.getPd_classific().equals("life")) {
					%>
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#!"><img class="card-img-top"
								src="https://via.placeholder.com/700x400" alt="..." /></a>
							<div class="card-body">
								<h9 class="card-title"> <a href="#!"> <%out.println(ppu.getPd_code() + ")");%>
									<%out.println(ppu.getPd_name());%> </h9>
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
								<small class="text-muted"> <%out.print(ppu.getPd_type());%>
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