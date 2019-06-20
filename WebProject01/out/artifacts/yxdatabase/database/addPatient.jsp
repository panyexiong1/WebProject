<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加信息</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/servlet/addPatientServlet" method="post">
	<!-- ID号： --><input type="hidden" name="ID">
	姓名：<input type="text" name="name">${pf.msg.name }
	<br>
	性别：<input type="text" name="sex">${pf.msg.sex }
	<br>
	出生日期：<input type="date" name="birthday">${pf.msg.birthday }
	<br>
	身份证号：<input type="text" name="IDcard">${pf.msg.IDcard }${error }
	<br>
	PET号：<input type="text" name="PETnum">${pf.msg.PETnum }
	<br>
	<input type="submit" value="添加">
	<br>
</form>
</body>
</html>