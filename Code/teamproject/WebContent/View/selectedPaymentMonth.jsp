<%@page import="teamproject.SaleProduct"%>
<%@page import="teamproject.Sales1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="teamproject.Sales_DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	Sales_DBManager ssdm = new Sales_DBManager();
	String selectedTime = request.getParameter("time_select");
// 	System.out.print(selectedTime);
	ArrayList<Sales1> list = ssdm.selected_payment_month(selectedTime);
	ArrayList<SaleProduct> rankingList = ssdm.countPopularItem(selectedTime);
	int ranking_cnt =ssdm.countProductClassific(selectedTime);
%>
<!DOCTYPE html>
<html>

<script type="text/javascript">
	$('document').ready(function(){
		$("#myTable tr").click(function(){
			var tdArray = new Array();
			var td = $(this).children();
			
			td.each(function(i){
				tdArray.push(td.eq(i).text());
			});
			var number = tdArray[0];
			window.open("../Controller/SalesFunc2.jsp?sales_number="+number, "결제 내역 상세보기", "width=1000, height=500, left=1000, top=50");
		});
	})
</script>
<script type="text/javascript">
	
</script>
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
<script src="https://d3js.org/d3.v6.min.js"></script>
</head>
<body>
	<div>
		<!-- 랭킹 -->
		<table id="myTable" class="table table-dark table-hover">
			<thead>
				<tr>
					<td>타입</td>
					<td>상품명</td>
					<td>수량</td>
					<td>랭킹</td>
				</tr>
			</thead>
			<tbody>
				<%
					String cls=null;
					for (int i = 0; i < rankingList.size(); i++) {
						SaleProduct sp = rankingList.get(i);

						if(i!=0 && sp.getClassific().equals(cls)==false)
						{
							%>
				<tr>
					<td>임시</td>
					<td>저장</td>
					<td>공간</td>
					<td>입니다</td>
				</tr>

				<%
						}
				%>
				<tr>
					<td>
						<%
							out.print(sp.getClassific());
						%>
					</td>
					<td>
						<%
							out.print(sp.getItem_name());

						%>
					</td>
					<td>
						<%
						  	out.print(sp.getTotalAmount());
						%>
					</td>
					<td>
						<%
							out.print(sp.getRanking());
						%>
					</td>
				</tr>
				<%
				     cls=sp.getClassific();
					}
				%>
			</tbody>
		</table>

		<!-- 		<svg id="myGraph"> -->

		<!-- 		</svg> -->
	</div>
	<div class="container mybgwh">
		<table id="myTable" class="table table-dark table-hover">
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