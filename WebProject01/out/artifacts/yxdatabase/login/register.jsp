<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/login/pic/favicon.ico">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/login/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/login/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/login/css/style.css">

<!-- Modernizr JS -->
<script
	src="${pageContext.request.contextPath}/login/js/modernizr-2.6.2.min.js"></script>

</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center"></div>
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-4">


				<!-- Start Sign In Form -->
				<form
					action="${pageContext.request.contextPath }/servlet/registerServlet"
					class="fh5co-form animate-box" data-animate-effect="fadeIn"
					method="post">
					<h2>注册</h2>
				<%-- 	<div class="form-group">
						<input type="text" class="form-control" id="xingming"
							placeholder="真实姓名" autocomplete="off" name="xingming">${uf.msg.xingming }
					</div> --%>
					<div class="form-group">
						<input type="text" class="form-control" id="username"
							placeholder="用户名" autocomplete="off" name="username">${uf.msg.username }${error }
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="password"
							placeholder="密码" autocomplete="off" name="password">${uf.msg.password }
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="re-password"
							placeholder="确认密码" autocomplete="off" name="repassword">${uf.msg.repassword }
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="email"
							placeholder="邮箱" autocomplete="off" name="email">${uf.msg.email }
					</div>
					<!-- 	<div class="form-group">
						<label for="tel" class="sr-only">tel</label> 
						<input type="text" class="form-control" id="tel" placeholder="电话"
							autocomplete="off" name="tel">
					</div> -->
					<div class="form-group">
						<input type="submit" value="注册" class="btn btn-primary">
					</div>
				</form>
				<!-- END Sign In Form -->

			</div>
		</div>
		<div class="row" style="padding-top: 60px; clear: both;">
			<div class="col-md-12 text-center">
				<!-- 	<p>
					<small>&copy; All Rights Reserved. More Templates <a
						href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a>
						- Collect from <a href="http://www.cssmoban.com/" title="网页模板"
						target="_blank">网页模板</a></small>
				</p> -->
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/login/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath}/login/js/bootstrap.min.js"></script>
	<!-- Placeholder -->
	<script
		src="${pageContext.request.contextPath}/login/js/jquery.placeholder.min.js"></script>
	<!-- Waypoints -->
	<script
		src="${pageContext.request.contextPath}/login/js/jquery.waypoints.min.js"></script>
	<!-- Main JS -->
	<script src="${pageContext.request.contextPath}/login/js/main.js"></script>

</body>
</html>