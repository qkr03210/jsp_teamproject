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
		}
	}

	// 	$('document').ready(function() {
	// 		$('#seatsel').on('click', function() { location.href = 'seatsel.jsp';})
	// 		$('#logout').on('click', function() { location.href = 'logout.jsp';})
	// 	})
</script>

<script>
	$(document).ready(function() {
		$("button").click(function() {
			$("all").load("all_table");
		});
	});
</script>

</head>
<body>
	<div class="jumbotron">
		<div class="form-inline">
			<label for="name">제품명으로 검색</label>
			<input type="text" class="form-control" placeholder="Enter search" id="product_name">
			<input type="button" value="검색" id="pd_search" class="btn btn-primary mr-2" />
		</div>

		<div class="btn-group">
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
			<button type="button" id='lif' class="btn btn-primary onclick="
				location.href='#'">생활용품</button>
			<button type="button" class="btn btn-danger onclick="
				location.href='../index.jsp'">돌아가기</button>
		</div>
	</div>
	<div class="container mybgwh" id='all_table'>
		<h2>전체</h2>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>제품코드</th>
					<th>제품명</th>
					<th>가격</th>
					<th>입고날짜</th>
					<th>종류</th>
					<th>수량</th>
					<th>분류</th>
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
							out.print(ppu.getCode());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getName());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getPrice());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getDate());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getType());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getAmount());
						%>
					</td>
					<td>
						<%
							out.print(ppu.getClassific());
						%>
					</td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>