<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>登录页面</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This inputStream my page">


    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/login/pic/favicon.ico">

    <!-- <link
        href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'
        rel='stylesheet' type='text/css'> -->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/login/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/login/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/login/css/style.css">


    <!-- Modernizr JS -->
    <script src="${pageContext.request.contextPath}/login/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="js/respond.min.js"></script>
    <![endif]-->

</head>


<body>

<div class="container">
    <div class="row">
        <div class="col-md-12 text-center"></div>
    </div>

    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <!-- Start Sign In Form -->
            <s:form namespace="/" action="userAction_login" cssClass="fh5co-form animate-box">
                <h2>登录</h2>
                <font color="#ff0000">
                    <s:fielderror></s:fielderror>
                </font>

                <div class="form-group">
                    <label for="username" class="sr-only">用户名</label>
                    <s:textfield name="username" id="username" cssClass="form-control"></s:textfield>
                </div>

                <div class="form-group">
                    <label for="password" class="sr-only">密码</label>
                    <s:password name="password" id="password" cssClass="form-control"></s:password>
                </div>

                <div class="form-group">
                    <s:submit value="登录" cssClass="btn btn-primary"></s:submit>
                </div>
            </s:form>
            <!-- END Sign In Form -->

        </div>
    </div>
    <!-- <div class="row" style="padding-top: 60px; clear: both;">
            <div class="col-md-12 text-center"><p><small>&copy; All Rights Reserved. More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></small></p></div>
        </div> -->
</div>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/login/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/login/js/bootstrap.min.js"></script>
<!-- Placeholder -->
<script src="${pageContext.request.contextPath}/login/js/jquery.placeholder.min.js"></script>
<!-- Waypoints -->
<script src="${pageContext.request.contextPath}/login/js/jquery.waypoints.min.js"></script>
<!-- Main JS -->
<script src="${pageContext.request.contextPath}/login/js/main.js"></script>


</body>


<%-- <body>
	<c:if test="${empty u }">
		<a href="login.jsp">登录</a>
		<a href="register.jsp">注册</a>
	</c:if>
	<c:if test="${not empty u }">
	欢迎你：${u.username }<a
			href="${pageContext.request.contextPath }/servlet/loginServlet">注销</a>
	</c:if>
</body> --%>
</html>
