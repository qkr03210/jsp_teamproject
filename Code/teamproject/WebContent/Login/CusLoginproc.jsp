<%@page import="teamproject.Member"%>
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
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	Member_DBManager mem = new Member_DBManager();
	Member memberinfo = mem.ckLogin(id,pw);
	if(memberinfo != null){
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		session.setAttribute("name", memberinfo.getName());
		session.setAttribute("phone", memberinfo.getPhone());
		session.setAttribute("grade", "손님");
		out.println("<a href='../index.jsp' class='btn btn-primary'>메인페이지</a>");
	}
	else{
		out.println("잘못된 아이디 또는 비밀번호 입니다");
	}
%>