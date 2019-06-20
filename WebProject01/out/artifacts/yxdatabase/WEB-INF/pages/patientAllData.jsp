<%@ page import="com.shu.user.domain.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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

        //用户权限，root=0为管理员；root = 1不可进行编辑
        <%
            User user = (User) request.getSession().getAttribute("loginUser");
            String username = user.getUsername();
            int root = user.getRoot();
        %>

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
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div>
            <%--<div class="bg-primary">--%>
            <%--<form--%>
            <%--action="${pageContext.request.contextPath}/servlet/searchMoreServlet"--%>
            <%--method="post">--%>
            <%--姓名：<input type="text" name="name" class="xingming"> &nbsp;--%>
            <%--&nbsp;身份证号：<input type="text" name="IDcard" class="IDcard">--%>
            <%--&nbsp; &nbsp;性别：男<input type="radio" name="sex" value="男">--%>
            <%--女<input type="radio" name="sex" value="女"> &nbsp; &nbsp;--%>
            <%--年龄范围：<input type="text" name="nianling1" class="xingming">---<input--%>
            <%--type="text" name="nianling2" class="xingming">&nbsp;--%>
            <%--&nbsp; <input type="submit" value="搜索" class="btn btn-default"><br>--%>
            <%--</form>--%>
            <%--</div>--%>

            您好，<%=username%>,您的权限为：<%=root%>
            <div>
                <span> <a class="btn btn-default"
                          href="${pageContext.request.contextPath}/patientAction_findAllPatients.action">显示全部</a></span>
                <%--<span> <a class="btn btn-default" href="${pageContext.request.contextPath}/database/addPatient.jsp">添加患者</a></span>--%>
                <span> <s:a cssClass="btn btn-default" namespace="/" action="patientAction_searchJsp">多条件搜索</s:a></span>
                <span style="display: <%=root==1?"none":"block"%>"> <a class="btn btn-default"
                          href="${pageContext.request.contextPath}/patientAction_addPatientjsp.action">添加患者</a></span>

            </div>
        </div>

        <div class="table-responsive" style="width:100%;float:left; ">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <td>ID编号</td>
                    <td>姓名</td>
                    <td>性别</td>
                    <td>出生日期</td>
                    <td>受教育程度</td>
                    <td>数据源</td>
                    <td>查看病理信息</td>
                    <td>查看图像信息</td>
                    <td style="display: <%=root==1?"none":"block"%>">编辑</td>
                    <%--<td>删除</td>--%>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="#allPatients">
                    <tr>
                        <td><s:property value="ppid"/></td>
                        <td><s:property value="pname"/></td>
                        <td><s:property value="sex"/></td>
                        <td><s:date name="birthday" format="yyyy-MM-dd"></s:date></td>
                        <td><s:property value="xueli"/></td>
                        <td><s:property value="datasource"/></td>
                        <td><s:a namespace="/" action="patientBingliAction_showPatientBingli"><s:param
                                name="patient.pid" value="%{pid}"></s:param>查看</s:a></td>
                        <td><s:a namespace="/" action="patientPicAction_showPatientPic"><s:param name="patient.pid"
                                                                                                 value="%{pid}"></s:param>查看</s:a></td>
                        <td>
                            <s:a id="bianji" namespace="/" action="patientAction_findPatientByPid">
                                <s:param name="pid" value="pid"></s:param>
                                <span id="span1" style="display: <%=root==1?"none":"block"%>" >编辑</span>
                            </s:a>
                        </td>
                            <%--<td>--%>
                            <%--<a href="javascript:delPatient('${patient.ID }','${patient.name }')">删除</a>--%>
                            <%--</td>--%>
                    </tr>
                </s:iterator>
                </tbody>
            </table>
            <%--<div align="center">--%>
            <%--<ul class="pagination">--%>
            <%--<li><a--%>
            <%--href="${pageContext.request.contextPath }/servlet/pageServlet?currentPage=${pb.currentPage==1?1:pb.currentPage-1}">上一页</a>--%>
            <%--</li>--%>
            <%--<li><a>第${pb.currentPage }页/共${pb.totalPage }页</a></li>--%>
            <%--<li><a--%>
            <%--href="${pageContext.request.contextPath }/servlet/pageServlet?currentPage=${pb.currentPage==pb.totalPage?pb.totalPage:pb.currentPage+1}">下一页</a>--%>
            <%--</li>--%>
            <%--</ul>--%>
            <%--</div>--%>
        </div>
    </div>
</div>
<script type="text/javascript">
    <%--var root = <%=root%>;--%>
    <%--if (root == 1) {--%>

        <%--document.getElementsByName("pid").valueOf()--%>

        <%--var  bianji =  document.getElementById("bianji");--%>
        <%--bianji.href="#";--%>
        <%--bianji.innerText="不可编辑";--%>
        <%--alert(2);--%>

    <%--}--%>
</script>
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