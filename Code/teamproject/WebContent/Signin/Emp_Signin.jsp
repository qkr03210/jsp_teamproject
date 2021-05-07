<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<form action="Emp_Signproc.jsp" method="get">
			<div class="form-group">
				<label for="employee_id">사번</label>
				<input type="text" name="employee_id" id="employee_id" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="name">이름</label>
				<input type="text" name="name" id="name" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="ssnumber">주민번호</label>
				<input type="text" name="ssnumber" id="ssnumber" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="phone">전화번호</label>
				<input type="text" name="phone" id="phone" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="address">주소</label>
				<input type="text" name="address" id="address" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="Withdrawal_date">뭐야이건</label>
				<input type="text" name="Withdrawal_date" id="Withdrawal_date" class="form-control"/>
			</div>		
			
			<input type="submit" value="회원가입" class="btn btn-primary"/>
		</form>
	
</body>
</html>