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
	楷搬凳
	<%
	}
	Member mem = dbma.cklogin("aa","aa");
	System.out.println(mem.getName());
	System.out.println(mem.getPhone());
	
	%><form>
		<input type="button" value="惑前">
		<input type="button" value="概免包府">
		<input type="button" value="抗距包府">
		<input type="button" value="流盔包府">
		<input type="button" value="雀盔包府">
	</form>
</body>
</html>