<%@page import="teamproject.Member_DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form id="Emp_login" action="find_idproc.jsp" method="get">
		<div class="form-group">
			<label for="name">이름</label>
			<input type="text" name="name" id="name" class="form-control"/>
		</div>
		<div class="form-group">
			<label for="phone">비밀번호</label>
			<input type="text" name="phone" id="phone" class="form-control"/>
		</div>
		<input type="submit" value="아이디 찾기" class="btn btn-primary"/>
	</form>
</body>
</html>
