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
		out.println("�α伺��");
		
		session.setAttribute("emp_id", emp_id);
		session.setAttribute("pw", pw);
		session.setAttribute("name", empinfo.getName());
		session.setAttribute("phone", empinfo.getPhone());
		session.setAttribute("grade", "����");
		out.println("<a href='../index.jsp' class='btn btn-primary'>����������</a>");
	}
	else{
		out.println("�߸��� ���̵� �Ǵ� ��й�ȣ �Դϴ�");
	}
%>