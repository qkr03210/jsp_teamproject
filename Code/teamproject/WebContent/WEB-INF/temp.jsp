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
Object grade = session.getAttribute("grade");
Object name = session.getAttribute("name");
%>
	<% if(grade == "직원"){%>
	<div>
		안녕하세요<%=name %>님!
	</div>
	<div>
		너는 <%=grade %>
	</div>
	<form>
		<button type="button" onclick="location.href='View/Product.jsp' ">상품관리</button>
		<button type="button" onclick="location.href='View/Sales.jsp' ">매출관리</button>
		<button type="button" onclick="location.href='#' ">예약관리</button>
		<button type="button" onclick="location.href='#' ">직원관리</button>
		<button type="button" onclick="location.href='#' ">회원관리</button>
		<button type="button" onclick="location.href='Login/Logout.jsp' ">로그아웃</button>
	</form>
	<%} %>
	<% if(grade == "손님"){%>
	<div>
		안녕하세요 <%=name %>님!
	</div>
	<div>
		너는 <%=grade %>
	</div>
	<form>
	
		<button type="button" onclick="location.href='Login/Logout.jsp' ">로그아웃</button>
	</form>
	<%} %>
	<%
	DBManager dbma = new DBManager();
	Connection conn = dbma.getConnect();
	if(conn!=null)
	{
	%>
	<% if(grade == null){%>
	<form>
		<button type="button" onclick="location.href='Signin/choose.jsp' ">회원가입</button>
		<button type="button" onclick="location.href='Login/choose.jsp' ">로그인</button>
	</form>
	<% }%>
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