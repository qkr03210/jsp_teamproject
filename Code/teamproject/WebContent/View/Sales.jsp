<%-- <%@page import="spro.com.org.SPRO_DBManager"%> --%>
<%@page import="teamproject.Sales1"%>
<%@page import="teamproject.Sales_DBManager"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Sales_DBManager ssdm = new Sales_DBManager();
	ArrayList<Sales1> list = ssdm.select();
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
	
<style type="text/css">
	body{
/* 		 text-align:center */
	}
	#sales_number{
		width:300px;
	}

</style>	
<script type="text/javascript">
	window.onload = function() {
		document.getElementById('sn_search').onclick = function() {
			var sales_number = document.getElementById('sales_number');
			// 			alert('id='+id.value);
			// 			alert('pw='+pw.value);
			location.href = '../Controller/SalesFunc2.jsp?sales_number=' + sales_number.value;
		}
		document.getElementById('time_select_btn').onclick= function(){
			var time_select = document.getElementById('time_select');
			var link= 'selectedPayment.jsp?time_select='+time_select.value;
			acyncMovePage(link);
		}
		document.getElementById('week_select_btn').onclick=function(){
			var time_select = document.getElementById('time_select');
			var link = 'week.jsp?time_select='+time_select.value;
			acyncMovePage(link);
		}
		document.getElementById('month_select_btn').onclick=function(){
			var time_select = document.getElementById('time_select');
			var link = 'selectedPaymentMonth.jsp?time_select='+time_select.value;
			acyncMovePage(link);
		}
	}
</script>

<!-- 버튼 눌렀을떄 페이지 전환 -->
<script>
    function acyncMovePage(url){
        // ajax option
        var ajaxOption = {
                url : url,
                async : true,
                type : "POST",
                dataType : "html",
                cache : false
        };
        
        $.ajax(ajaxOption).done(function(data){
            // Contents 영역 삭제
            $('#bodyContents').children().remove();
            // Contents 영역 교체
            $('#bodyContents').html(data);
        });
    }
 
</script>

<!-- 일일 팝업 -->
<script type="text/javascript">
  function showDayPayment() { window.open("popupTest.jsp", "시간 선택", "width=400, height=300, left=100, top=50"); }
</script>

<script type="text/javascript">
	$('document').ready(function(){
		var now = new Date();
	    var month = (now.getMonth() + 1);               
	    var day = now.getDate();
	    if (month < 10) 
	        month = "0" + month;
	    if (day < 10) 
	        day = "0" + day;
	    var today = now.getFullYear() + '-' + month + '-' + day;
	    
	    
		$('#seatsel').on('click',function(){
			location.href='seatsel.jsp';
		})
		$('#logout').on('click',function(){
			location.href='logout.jsp';
		})
// 		$('#time_select').value(today);
		
		$("#myTable tr").click(function(){
			var tdArray = new Array();
			var td = $(this).children();
			
			td.each(function(i){
				tdArray.push(td.eq(i).text());
			});
			var number = tdArray[0];
			window.open("../Controller/SalesFunc2.jsp?sales_number="+number, "시간 선택", "width=1000, height=500, left=1000, top=50");
		});
	})
</script>


</head>
<body >
	<div class="jumbotron" id="gnb">	
		<div class="form-group">
			<label for="sales_number">주문번호:</label><input type="text" class="form-control"
				id="sales_number">
				<input type="button" value="검색" id="sn_search" class="btn btn-primary mr-2" /> 
		</div>
		<p>일일 판매실적/주간 판매실적/월 판매실적/물품별 판매실적(주간/일간/요일 비교)</p>
		<div id="btn-Title">
			<input type="date" min="2021-01-01" max="2025-12-31" id="time_select"/>
			
			<button type="button" onclick="showDayPayment();">팝업 테스트</button>
			<button type="button" id="time_select_btn">일일</button>
<%-- 			<button type="button"  onclick="acyncMovePage('popupTest.jsp')  /> --%>
			<button type="button" id="week_select_btn">주간</button>
			<button type="button" id="month_select_btn">월별</button>
			<button type="button" onclick="location.href='#' ">물품별</button>
			<button type="button" onclick="location.href='../index.jsp' ">돌아가기</button>
		</div>
	</div>
	
	<div id="lnb"><p>임시</p></div>
	
	<div id="bodyContents" class="container mybgwh">
		<table id = "myTable" class="table table-dark table-hover">
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


















