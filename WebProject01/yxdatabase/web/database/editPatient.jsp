<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon"
	href="${pageContext.request.contextPath}/database/pic/favicon.ico">
<title>编辑</title>
</head>
<body>
	<form
		action="${pageContext.request.contextPath}/servlet/updatePatientServlet"
		method="post">
		<!-- ID号: --><input type="hidden" name="ID" value="${patient.ID }"><br>
		姓名:<input type="text" name="name" value="${patient.name }"><br>
		性别:<input type="text" name="sex" value="${patient.sex }"><br>
		出生日期:<input type="text" name="birthday" value="${patient.birthday }"><br>
		身份证号:<input type="text" name="IDcard" value="${patient.IDcard }"><br>
		PET号:<input type="text" name="PETnum" value="${patient.PETnum }"><br>
		<input type="submit" value="提交">
	</form>


</body>
</html>