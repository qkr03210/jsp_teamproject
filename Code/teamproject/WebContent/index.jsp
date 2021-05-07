<%@page import="java.sql.Connection" %>
<%@page import="teamproject.Member"%>
<%@page import="teamproject.DBManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	DBManager dbma = new DBManager();
	Connection conn = dbma.getConnect();
	if(conn!=null)
	{
	%>
	연결됨
	<form>
		<button type="button" onclick="location.href='View/Product.jsp' ">상품관리</button>
		<button type="button" onclick="location.href='View/Sales.jsp' ">매출관리</button>
		<button type="button" onclick="location.href='#' ">예약관리</button>
		<button type="button" onclick="location.href='#' ">직원관리</button>
		<button type="button" onclick="location.href='#' ">회원관리</button>
	</form>
	<%
	Member mem = dbma.cklogin("aa","aa");
	System.out.println(mem.getName());
	System.out.println(mem.getPhone());
	}
	else{
	%>
	연결 안됨
	<%
	}
	%>

</body>
</html>