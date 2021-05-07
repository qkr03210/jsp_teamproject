<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<form action="Cus_Signproc.jsp" method="get">
			<div class="form-group">
				<label for="id">아이디</label>
				<input type="text" name="id" id="id" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="pw">비밀번호</label>
				<input type="text" name="pw" id="pw" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="name">이름</label>
				<input type="text" name="name" id="name" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="phone">전화번호</label>
				<input type="text" name="phone" id="phone" class="form-control"/>
			</div>
			<input type="submit" value="회원가입" class="btn btn-primary"/>
		</form>
</body>
</html>