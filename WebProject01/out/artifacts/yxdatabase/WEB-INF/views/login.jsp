<%--
  Created by IntelliJ IDEA.
  User: panyexiong
  Date: 2019/6/5
  Time: 22:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>影像学数据库 | 登录</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" type="text/css" href="/static/assets/bower_components/bootstrap/dist/css/bootstrap.min.css"/>
    <!-- Font Awesome -->
    <link rel="stylesheet" type="text/css" href="/static/assets/bower_components/font-awesome/css/font-awesome.min.css"/>
    <!-- Ionicons -->
    <link rel="stylesheet" type="text/css" href="/static/assets/bower_components/Ionicons/css/ionicons.min.css"/>
    <!-- Theme style -->
    <link rel="stylesheet" type="text/css" href="/static/assets/css/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" type="text/css" href="/static/assets/plugins/iCheck/square/blue.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="#">影像学数据库</a>
    </div>

    <div class="login-box-body">
        <p class="login-box-msg">欢迎登录</p>

        <s:form namespace="/" action="userAction_login" cssClass="fh5co-form animate-box" method="POST">
            <font color="#ff0000">
                <s:fielderror></s:fielderror>
            </font>

            <div class="form-group has-feedback">
                <label for="username" class="sr-only">用户名</label>
                <s:textfield name="username" id="username" cssClass="form-control"></s:textfield>
            </div>

            <div class="form-group has-feedback">
                <label for="password" class="sr-only">密码</label>
                <s:password name="password" id="password" cssClass="form-control"></s:password>
            </div>

            <div class="row">
                <div class="col-xs-4">
                    <s:submit value="登录" cssClass="btn btn-primary btn-block btn-flat"></s:submit>
                </div>
            </div>
        </s:form>
    </div>
</div>


<!-- jQuery 3 -->
<script src="/static/assets/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/static/assets/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="/static/assets/plugins/iCheck/icheck.min.js"></script>
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' /* optional */
        });
    });
</script>
</body>
</html>
