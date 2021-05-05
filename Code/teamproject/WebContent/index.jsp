<%@page import="java.sql.Connection"%>
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
	<%
	}
	Member mem = dbma.cklogin("aa","aa");
	System.out.println(mem.getName());
	System.out.println(mem.getPhone());
	
	%>
</body>
</html>