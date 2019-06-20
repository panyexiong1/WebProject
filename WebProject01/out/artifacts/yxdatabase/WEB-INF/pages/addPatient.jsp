<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="icon" href="${pageContext.request.contextPath}/database/pic/favicon.ico">
    <title>添加信息</title>

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
    </div>
</nav>

<%--<s:form namespace="/" action="patientAction_addPatient.action">--%>
<%--ID编号： <s:textfield name="ppid"></s:textfield>（必填）格式：华山医院数据：hs00001;宣武医院数据：xw00001;ADMI数据：am00001;PPMI数据：pm00001;无锡904数据：wx00001;其他数据：qt00001.--%>
<%--<br>--%>
<%--姓名： <s:textfield name="pname"></s:textfield>（选填）--%>
<%--<br>--%>
<%--性别： <s:radio name="sex" list="{'男','女'}" value="f"></s:radio>--%>
<%--<br>--%>
<%--出生日期：   <s:date name="birthday" nice="false" format="yyyy-MM-dd"></s:date>--%>
<%--<s:textfield name="birthday"></s:textfield>--%>
<%--<br>--%>
<%--受教育程度：--%>
<%--<s:select name="xueli" label="受教育程度" labelposition="top" multiple="false"--%>
<%--list="{'小学','初中','中专','高中','大专','本科','硕士','博士'}" Value="'xx','cz','zz','gz','dz','bk','ss','bs'" ></s:select>--%>
<%--<br>--%>
<%--数据源：--%>
<%--<select name="datasource">--%>
<%--<option value="hs" selected="selected">华山医院</option>--%>
<%--<option value="xw">宣武医院</option>--%>
<%--<option value="am">ADMI</option>--%>
<%--<option value="pm">PPMI</option>--%>
<%--<option value="wx">无锡904</option>--%>
<%--<option value="qt">其他来源</option>--%>
<%--</select>（必填：默认华山医院）--%>
<%--<br>--%>
<%--<input type="submit" value="添加">--%>
<%--<br>--%>
<%--</s:form>--%>
<div class="container-fluid">
    <div class="row">
        <span> <a class="btn btn-default"
                  href="${pageContext.request.contextPath}/patientAction_findAllPatients.action">显示全部</a></span>
    </div>
</div>
<form action="${pageContext.request.contextPath}/patientAction_addPatient.action" method="post">
    ID编号：<input type="text" name="ppid">（必填）格式：华山医院数据：hs00001;宣武医院数据：xw00001;ADMI数据：am00001;PPMI数据：pm00001;无锡904数据：wx00001;其他数据：qt00001.
    <br>
    姓名： <input type="text" name="pname">（选填）
    <br>
    性别： 男<input type="radio" name="sex" value="m" checked="checked"> 女<input type="radio" name="sex" value="f">（必填，默认为男）
    <br>
    出生日期： <input type="date" name="birthday">（选填）
    <br>
    受教育程度：
    <select name="xueli">
        <option value="小学">小学</option>
        <option value="初中">初中</option>
        <option value="中专">中专</option>
        <option value="高中" selected="selected">高中</option>
        <option value="大专">大专</option>
        <option value="本科">本科</option>
        <option value="硕士">硕士</option>
        <option value="博士">博士</option>
    </select>（必填：默认高中）
    <br>
    数据源：
    <select name="datasource">
        <option value="华山医院" selected="selected">华山医院</option>
        <option value="宣武医院">宣武医院</option>
        <option value="ADMI">ADMI</option>
        <option value="PPMI">PPMI</option>
        <option value="无锡904">无锡904</option>
        <option value="其他来源">其他来源</option>
    </select>（必填：默认华山医院）
    <br>
    <input type="submit" value="添加">
    <br>
</form>
<script>window.jQuery || document.write('<script src="js/vendor/jquery.min.js"><\/script>')
</script>
<script
        src="${pageContext.request.contextPath}/database/js/bootstrap.min.js"></script>
<script
        src="${pageContext.request.contextPath}/database/js/vendor/holder.min.js"></script>
<script
        src="${pageContext.request.contextPath}/database/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>