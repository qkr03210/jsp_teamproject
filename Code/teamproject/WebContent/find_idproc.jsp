<%@page import="teamproject.Member_DBManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<%
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	Member_DBManager emp = new Member_DBManager();
	String id = emp.findId(name, phone);
	out.println("id = "+id);
%>