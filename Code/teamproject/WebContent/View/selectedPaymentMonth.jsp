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
<!-- 테이블 클릭시 상세보기 -->
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
해당 월 상품
<script type="text/javascript">
var data=[];
<%
for(int i = 0; i <rankingList.size();i++){
    %>        
        data.push([{ classific:'<%=rankingList.get(i).getClassific()%>' , p_name:'<%=rankingList.get(i).getItem_name()%>' , totalAmount:<%=rankingList.get(i).getTotalAmount()%>,ranking:<%=rankingList.get(i).getRanking()%>}]);
    <%
}%>
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
	<script>
	function addDiv(){
        d3.select("body")
            .append("div")
                .attr("class","blue box")
    }  
    </script>

    <div></div>
    <div id="secondArea"></div>
    <div></div>
            <!-- 처음 박스 색 -->
    <script type="text/javascript">
        d3.selectAll("div") // <-- A
            .attr("class", "red box"); // <-- B
    </script>
    
        <!-- 실제 데이터 삽입 -->
	<script type="text/javascript">

        function render(data,selectedTag) { // <- B
            // Enter
            d3.select(selectedTag).selectAll("div.h-bar") // <- C
                .data(data) // <- D
                .enter() // <- E
                    .append("div") // <- F
                        .attr("class", "h-bar")
                    .append("span"); // <- G

         // Update
         d3.select(selectedTag).selectAll("div.h-bar")
            .data(data) 
                .style("width", function (d) { // <- H
                    console.log(d[0].totalAmount)
                    return (d[0].totalAmount * 30) + "px";
                })
                .select("span") // <- I
                    .text(function (d) {
                        return d[0].p_name;
                    }); 
    }
       

	render(data,"#secondArea");
</script>
	
</body>
</html>