<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<form action="CusLoginproc.jsp" method="get">
			<div class="form-group">
				<label for="id">아이디</label>
				<input type="text" name="id" id="id" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="pw">비밀번호</label>
				<input type="text" name="pw" id="pw" class="form-control"/>
			</div>
			<input type="submit" value="로그인" class="btn btn-primary"/>
		</form>
</body>
</html>