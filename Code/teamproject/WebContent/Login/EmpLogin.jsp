<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<form action="EmpLoginproc.jsp" method="get">
			<div class="form-group">
				<label for="emp_id">���</label>
				<input type="text" name="emp_id" id="emp_id" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="pw">��й�ȣ</label>
				<input type="text" name="pw" id="pw" class="form-control"/>
			</div>
			<input type="submit" value="�α���" class="btn btn-primary"/>
		</form>	
</body>
</html>