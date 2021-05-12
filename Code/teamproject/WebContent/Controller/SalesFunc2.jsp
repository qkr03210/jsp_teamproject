
<%@page import="teamproject.Sales_DBManager"%>
<%@page import="teamproject.Sales2"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
</head>
<body>
	<%
	String sls_number = request.getParameter("sales_number");
	int result=0;
 	Sales_DBManager ssdm = new Sales_DBManager();
	ArrayList<Sales2> list = ssdm.select(sls_number);

	if(list!=null){
	
	%>
	<div class="container mybgwh">
		<p>주문번호로 검색한 영수증?조회</p>
		<table class="table table-dark table-hover">
			<thead>
				<tr>
					<td>제품명</td>
					<td>가격</td>
					<td>수량</td>
					<td>총합</td>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < list.size(); i++) {
						Sales2 ssu = list.get(i);
				%>
				<tr>
					<td>
						<%
							out.print(ssu.getName());
						%>
					</td>
					<td>
						<%
							out.print(ssu.getPrice());
						%>
					</td>
					<td>
						<%
							out.print(ssu.getAmount());
						%>
					</td>
					<td>
						<%
							result+=ssu.getTotalPrice();
							out.print(ssu.getTotalPrice());
						%>
					</td>
				</tr>
				<%
					}
				%>
				<tr>
					<td>
					</td>
					<td>
					</td>
					<td>
						<p>합계</p>
					</td>
					<td>
					<%out.print(result); %>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<%
		
		
	}
	else
	{
		out.println("로그인실패");
		
	}
%>
</body>
</html>