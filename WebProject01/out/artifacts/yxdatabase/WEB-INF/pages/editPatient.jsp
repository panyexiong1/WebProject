<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>编辑</title>
    <link rel="icon"
          href="${pageContext.request.contextPath}/database/pic/favicon.ico">
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
<div class="container-fluid">
    <div class="row">
        <span><s:a cssClass="btn btn-default" namespace="/" action="patientAction_findAllPatients">显示全部</s:a></span>
    </div>
</div>
<div>
    <s:form namespace="/" action="patientAction_editPatient">
        <s:hidden name="pid"></s:hidden>
        ID编号：<s:textfield name="ppid"></s:textfield><br>
        姓名：<s:textfield name="pname"></s:textfield><br>
        性别：<s:radio list="#{'m':'男','f':'女'}" name="sex"></s:radio><br>
        出生日期： <s:date name="birthday" format="yyyy-MM-dd" var="birthday"></s:date>
        <s:textfield name="birthday" value="%{#birthday}" type="date"></s:textfield>
        <br>
        受教育程度：<s:select name="xueli" list="{'小学','初中','中专','高中','大专','本科','硕士','博士'}"></s:select>
        <br>
        数据源：<s:select name="datasource" list="{'华山医院','宣武医院','ADMI','PPMI','无锡904','其他来源'}"></s:select><br>
        <s:submit value="提交"></s:submit>
    </s:form>
</div>

</body>
</html>