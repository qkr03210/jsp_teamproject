<%@page import="teamproject.Emp"%>
<%@page import="teamproject.Emp_DBManager"%>
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
	String emp_id = request.getParameter("emp_id");
	String pw = request.getParameter("pw");
	Emp_DBManager emp = new Emp_DBManager();
	Emp empinfo = emp.ckLogin(emp_id,pw);
	if(empinfo != null){
		out.println("로긴성공");
		
		session.setAttribute("emp_id", emp_id);
		session.setAttribute("pw", pw);
		session.setAttribute("name", empinfo.getName());
		session.setAttribute("phone", empinfo.getPhone());
		session.setAttribute("grade", "직원");
		out.println("<a href='../index.jsp' class='btn btn-primary'>메인페이지</a>");
	}
	else{
		out.println("잘못된 아이디 또는 비밀번호 입니다");
	}
%>