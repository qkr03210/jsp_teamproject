<%@page import="teamproject.Sales1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="teamproject.Sales_DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	Sales_DBManager ssdm = new Sales_DBManager();
	String selectedTime = request.getParameter("time_select");
	ArrayList<Sales1> list = ssdm.selected_payment(selectedTime);
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
</head>
<body>
		<div  class="container mybgwh">
		<table class="table table-dark table-hover">
			<thead>
				<tr>
					<td>주문번호</td>
					<td>회원</td>
					<td>결제금액</td>
					<td>결제방법</td>
					<td>결제일시</td>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < list.size(); i++) {
						Sales1 ssu = list.get(i);
				%>
				<tr>
					<td>
						<%
							out.print(ssu.getSales_number());
						%>
					</td>
					<td>
						<%
						if(ssu.getCid()!=null)
						{
							out.print(ssu.getCid());
						}
						else
							out.print("");
						%>
					</td>
					<td>
						<%
						  	out.print(ssu.getTotalPrice());
						%>
					</td>
					<td>
						<%
							out.print(ssu.getPayment_method_type());
						%>
					</td>
					<td>
						<%
							out.print(ssu.getDate());
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