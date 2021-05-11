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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	window.onload = function() {
		document.getElementById('pd_search').onclick = function() {
			var name = document.getElementById('name');
			location.href = '../Controller/ProductFunc1.jsp?name=' + name.value;
		}
	}

	// 	$('document').ready(function() {
	// 		$('#seatsel').on('click', function() { location.href = 'seatsel.jsp';})
	// 		$('#logout').on('click', function() { location.href = 'logout.jsp';})
	// 	})
</script>

<script> 
$(document).ready(function(){
  $("#all").click(function(){
	  allup();
    $("#all_result").slideToggle("slow");
  });
  $("#sim").click(function(){
	  allup();
    $("#sim_result").slideToggle("slow");
  });
  $("#ins").click(function(){
	  allup();
    $("#ins_result").slideToggle("slow");
  });
  $("#sna").click(function(){
	  allup();
    $("#sna_result").slideToggle("slow");
  });
  $("#ice").click(function(){
	  allup();
    $("#ice_result").slideToggle("slow");
  });
  $("#foo").click(function(){
	  allup();
    $("#foo_result").slideToggle("slow");
  });
  $("#dri").click(function(){
	  allup();
    $("#dri_result").slideToggle("slow");
  });
  $("#lif").click(function(){
	  allup();
    $("#lif_result").slideToggle("slow");
  });
  function allup(){
	  $("#all_result").slideUp();
	  $("#sim_result").slideUp();
	  $("#ins_result").slideUp();
	  $("#sna_result").slideUp();
	  $("#ice_result").slideUp();
	  $("#foo_result").slideUp();
	  $("#dri_result").slideUp();
	  $("#lif_result").slideUp();
  }
  allup();
});
</script>

</head>
<body>
	<div class="jumbotron">
		<div class="form-group">
			<label for="name">제품명으로 검색</label>
			<input type="text" class="form-control" placeholder="Enter search" id="product_name">
			<input type="button" value="검색" id="pd_search" class="btn btn-primary mr-2" />
		</div>
	</div>
	<div class="btn-inline">
			<button type="button" id='all' class="btn btn-primary onclick="
				location.href='#'">전체</button>
			<button type="button" id='sim' class="btn btn-primary onclick="
				location.href='#'">간편식</button>
			<button type="button" id='ins' class="btn btn-primary onclick="
				location.href='#'">즉석식</button>
			<button type="button" id='sna' class="btn btn-primary onclick="
				location.href='#'">과자류</button>
			<button type="button" id='ice' class="btn btn-primary onclick="
				location.href='#'">아이스크림</button>
			<button type="button" id='foo' class="btn btn-primary onclick="
				location.href='#'">식품류</button>
			<button type="button" id='dri' class="btn btn-primary onclick="
				location.href='#'">음료류</button>
			<button type="button" id='lif' class="btn btn-primary onclick=" location.href='#'">생활용품</button>
		    <button type="button" class="btn btn-primary" onclick="location.href='../index.jsp' ">돌아가기</button>
	</div>

	<div id="all_result">
		<h2>전체</h2>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>상품코드</th>
					<th>제품명</th>
					<th>가격</th>
					<th>종류</th>
					<th>분류</th>
					<th>유통기한</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < list.size(); i++) {
						Product ppu = list.get(i);
				%>
				<tr>
					<td>
						<%
							out.print(ppu.getPd_code());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_name());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_price() + "원");
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_type());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_classific());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_exdate() + "일");
						%>
					</td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>

	<div id="sim_result">
		<h2>간편식품</h2>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>상품코드</th>
					<th>제품명</th>
					<th>가격</th>
					<th>종류</th>
					<th>분류</th>
					<th>유통기한</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (int i = 0; i < list.size(); i++) {
					Product ppu = list.get(i);
					if( ppu.getPd_classific().equals("simple")){
				%>
				<tr>
					<td>
						<%
							out.print(ppu.getPd_code());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_name());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_price() + "원");
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_type());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_classific());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_exdate() + "일");
						%>
					</td>
				</tr>
				<%
					}
				}
				%>
			</tbody>
		</table>
	</div>
	<div id="ins_result">
		<h2>즉석식품</h2>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>상품코드</th>
					<th>제품명</th>
					<th>가격</th>
					<th>종류</th>
					<th>분류</th>
					<th>유통기한</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (int i = 0; i < list.size(); i++) {
					Product ppu = list.get(i);
					if( ppu.getPd_classific().equals("instant")){
				%>
				<tr>
					<td>
						<%
							out.print(ppu.getPd_code());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_name());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_price() + "원");
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_type());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_classific());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_exdate() + "일");
						%>
					</td>
				</tr>
				<%
					}
				}
				%>
			</tbody>
		</table>
	</div>
	<div id="sna_result">
		<h2>과자류</h2>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>상품코드</th>
					<th>제품명</th>
					<th>가격</th>
					<th>종류</th>
					<th>분류</th>
					<th>유통기한</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < list.size(); i++) {
						Product ppu = list.get(i);
						if( ppu.getPd_classific().equals("snack")){
				%>
				<tr>
					<td>
						<%
							out.print(ppu.getPd_code());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_name());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_price() + "원");
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_type());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_classific());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_exdate() + "일");
						%>
					</td>
				</tr>
				<%
						}
					}
				%>
			</tbody>
		</table>
	</div>
	<div id="ice_result">
		<h2>아이스크림류</h2>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>상품코드</th>
					<th>제품명</th>
					<th>가격</th>
					<th>종류</th>
					<th>분류</th>
					<th>유통기한</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (int i = 0; i < list.size(); i++) {
					Product ppu = list.get(i);
					if( ppu.getPd_classific().equals("icecream")){
				%>
				<tr>
					<td>
						<%
							out.print(ppu.getPd_code());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_name());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_price() + "원");
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_type());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_classific());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_exdate() + "일");
						%>
					</td>
				</tr>
				<%
					}
				}
				%>
			</tbody>
		</table>
	</div>
	<div id="foo_result">
		<h2>식품류</h2>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>상품코드</th>
					<th>제품명</th>
					<th>가격</th>
					<th>종류</th>
					<th>분류</th>
					<th>유통기한</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (int i = 0; i < list.size(); i++) {
					Product ppu = list.get(i);
					if( ppu.getPd_classific().equals("food")){
				%>
				<tr>
					<td>
						<%
							out.print(ppu.getPd_code());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_name());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_price() + "원");
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_type());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_classific());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_exdate() + "일");
						%>
					</td>
				</tr>
				<%
					}
				}
				%>
			</tbody>
		</table>
	</div>
	<div id="dri_result">
		<h2>음료류</h2>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>상품코드</th>
					<th>제품명</th>
					<th>가격</th>
					<th>종류</th>
					<th>분류</th>
					<th>유통기한</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (int i = 0; i < list.size(); i++) {
					Product ppu = list.get(i);
					if( ppu.getPd_classific().equals("drink")){
				%>
				<tr>
					<td>
						<%
							out.print(ppu.getPd_code());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_name());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_price() + "원");
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_type());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_classific());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_exdate() + "일");
						%>
					</td>
				</tr>
				<%
					}
				}
				%>
			</tbody>
		</table>
	</div>
	<div id="lif_result">
		<h2>생활용품</h2>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>상품코드</th>
					<th>제품명</th>
					<th>가격</th>
					<th>종류</th>
					<th>분류</th>
					<th>유통기한</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (int i = 0; i < list.size(); i++) {
					Product ppu = list.get(i);
					if( ppu.getPd_classific().equals("life")){
				%>
				<tr>
					<td>
						<%
							out.print(ppu.getPd_code());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_name());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_price() + "원");
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_type());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_classific());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPd_exdate() + "일");
						%>
					</td>
				</tr>
				<%
					}
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>