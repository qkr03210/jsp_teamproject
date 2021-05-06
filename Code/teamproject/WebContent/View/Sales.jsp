<%-- <%@page import="spro.com.org.SPRO_DBManager"%> --%>
<%@page import="teamproject.Sales_DBManager"%>
<%@page import="teamproject.Sales"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Sales_DBManager ssdm = new Sales_DBManager();
	ArrayList<Sales> list = ssdm.select();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		document.getElementById('sn_search').onclick = function() {
			var sales_number = document.getElementById('sales_number');
			// 			alert('id='+id.value);
			// 			alert('pw='+pw.value);
			location.href = '../Controller/SalesFunc1.jsp?sales_number=' + sales_number.value;
		}
	}
</script>

<script type="text/javascript">
	$('document').ready(function(){
		$('#seatsel').on('click',function(){
			location.href='seatsel.jsp';
		})
		$('#logout').on('click',function(){
			location.href='logout.jsp';
		})
	})
</script>


</head>
<body>
	<div class="jumbotron">	
		<div class="form-group">
			<label for="sales_number">주문번호:</label><input type="text" class="form-control"
				id="sales_number">
				<input type="button" value="검색" id="sn_search" class="btn btn-primary mr-2" /> 
		</div>
		<p>일일 판매실적/주간 판매실적/월 판매실적/물품별 판매실적(주간/일간/요일 비교)</p>
	</div>
	<div>
		<button type="button" onclick="location.href='#' ">일일</button>
		<button type="button" onclick="location.href='#' ">주간</button>
		<button type="button" onclick="location.href='#' ">월별</button>
		<button type="button" onclick="location.href='#' ">물품별</button>
		<button type="button" onclick="location.href='../index.jsp' ">돌아가기</button>
	</div>
	<div class="container mybgwh">
		<table class="table table-dark table-hover">
			<thead>
				<tr>
					<td>매출번호</td>
					<td>주문번호</td>
					<td>제품</td>
					<td>수량</td>
					<td>회원</td>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < list.size(); i++) {
						Sales ssu = list.get(i);
				%>
				<tr>
					<td>
						<%
							out.print(ssu.getIdx());
						%>
					</td>
					<td>
						<%
							out.print(ssu.getSalesNumber());
						%>
					</td>
					<td>
						<%
							out.print(ssu.getProduct());
						%>
					</td>
					<td>
						<%
							out.print(ssu.getAmount());
						%>
					</td> 
					<td>
						<%
						if(ssu.getClient()!=null)
						{
							out.print(ssu.getClient());
						}
						else
							out.print("");
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


















