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
	<form>
		<button type="button" onclick="location.href='View/Product.jsp' ">惑前包府</button>
		<button type="button" onclick="location.href='View/Sales.jsp' ">概免包府</button>
		<button type="button" onclick="location.href='#' ">抗距包府</button>
		<button type="button" onclick="location.href='#' ">流盔包府</button>
		<button type="button" onclick="location.href='#' ">雀盔包府</button>
	</form>
	<%
	Member mem = dbma.cklogin("aa","aa");
	System.out.println(mem.getName());
	System.out.println(mem.getPhone());
	}
	else{
	%>
	楷搬 救凳
	<%
	}
	%>

</body>
</html>