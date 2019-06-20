<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon"
	href="${pageContext.request.contextPath}/database/pic/favicon.ico">
<title>全部</title>

<link
	href="${pageContext.request.contextPath}/database/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath}/database/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath}/database/css/dashboard.css"
	rel="stylesheet">

<link href="${pageContext.request.contextPath}/database/css/mycss1.css"
	rel="stylesheet">

<script
	src="${pageContext.request.contextPath}/database/js/ie-emulation-modes-warning.js"></script>
<script type="text/javascript">


	//提示用户是否删除
	function delPatient(ID, name) {
		if (confirm("是否确定删除“" + name + "”的所有信息?")) {
			location.href = "${pageContext.request.contextPath}/servlet/delPatientByIDcardServlet?ID=" + ID;
		}
	}
</script>
</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">影像数据库</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<form class="navbar-form navbar-right"
				action="${pageContext.request.contextPath}/servlet/searchPatientServlet"
				method="post">

				<input type="text" class="form-control" placeholder="搜索姓名"
					name="name"> <input type="submit" value="搜索">

			</form>
		</div>
	</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div>
				<span><h2 style="color: #8a6d3b">
						<a
							href="${pageContext.request.contextPath}/servlet/patientListServlet">全部</a>
					</h2></span> <span><h2 style="color: #8a6d3b">
						<a href="${pageContext.request.contextPath}/database/search.jsp">多条件查询</a>
					</h2></span> <span><a
					href="${pageContext.request.contextPath}/database/addPatient.jsp">添加</a></span>

			</div>

			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<td>ID号</td>
							<td>姓名</td>
							<td>性别</td>
							<td>出生日期</td>
							<td>身份证号</td>
							<td>编辑</td>
							<td>删除</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${patients }" var="patient">
							<tr>
								<td><a
									href="${pageContext.request.contextPath}/servlet/findPatientByIDServlet?ID=${patient.ID }">${patient.ID }</a></td>
								<td>${patient.name }</td>
								<td>${patient.sex }</td>
								<td>${patient.birthday }</td>
								<td>${patient.IDcard }</td>
								<td><a
									href="${pageContext.request.contextPath}/servlet/findPatientByIDcardServlet?ID=${patient.ID }">编辑</a></td>
								<td><a
									href="javascript:delPatient('${patient.ID }','${patient.name }')">删除</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>




	<script>window.jQuery || document.write('<script src="js/vendor/jquery.min.js"><\/script>')
	</script>
	<script
		src="${pageContext.request.contextPath}/database/js/bootstrap.min.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<script
		src="${pageContext.request.contextPath}/database/js/vendor/holder.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script
		src="${pageContext.request.contextPath}/database/js/ie10-viewport-bug-workaround.js"></script>

</body>
</html>