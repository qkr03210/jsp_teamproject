<%@page import="teamproject.Member_DBManager"%>
<%@ page language="java" contentType="text/html; charset=UFT-8"
    pageEncoding="UTF-8"%>
    <%
    Member_DBManager mdb = new Member_DBManager();
	String sucValue = "";
	//한글
	request.setCharacterEncoding("utf-8");
	
	String p_employee_id = (String)request.getParameter("employee_id");
	String p_name = (String)request.getParameter("name");
	String p_ssnumber = (String)request.getParameter("ssnumber");
	String p_phone = (String)request.getParameter("phone");
	String p_address = (String)request.getParameter("address");
	String p_Withdrawal_date = (String)request.getParameter("Withdrawal_date");
	
	mdb.Emp_Signin(p_employee_id, p_name,p_ssnumber,p_phone,p_address,p_Withdrawal_date);
	sucValue = "<a class='btn btn-primary' href='index.jsp'>로그인페이지이동</a>";
%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/spro/css/mycss.css"/>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<% out.print(sucValue); %>
</body>
</html>