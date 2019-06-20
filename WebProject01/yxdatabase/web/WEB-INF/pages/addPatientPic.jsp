<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page import="java.util.List" %>
<%@ page import="com.shu.patient.domain.PatientBingli" %>
<%@ page import="com.shu.patient.domain.PatientPic" %>
<%@ page import="com.shu.user.domain.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>添加图像信息</title>
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    sjlx = new Object();
    sjlx['PET'] = new Array('AV45', 'FDG', 'AV1451', 'PiB', 'CFT');
    sjlx['VMAT'] = new Array('VMAT');
    sjlx['MRI'] = new Array('dMRI', 'T1', 'T2', 'DTI', 'ASL', 'BOLD');

    function set_sjlx(sjlx1, sjlx2) {
        var s1, s2;
        var i, ii;

        s1 = sjlx1.value;

        // s2 = sjlx2.value;
        sjlx2.length = 1;

        if (s1 == '0') return;
        if (typeof sjlx[s1] == 'undefined') return;

        for (i = 0; i < sjlx[s1].length; i++) {
            ii = i + 1;
            sjlx2.options[ii] = new Option();
            sjlx2.options[ii].value = sjlx[s1][i];
            sjlx2.options[ii].text = sjlx[s1][i];
        }
    }

    window.onload = function () {
        var bt = document.getElementById("bt");
        bt.onclick = function () {
            if (document.myform.checkdate.value == "") {
                alert("检查日期不能为空！！！")
                document.myform.checkdate.focus();
                return false;
            }
        }
    }

    <%
       User user = (User) request.getSession().getAttribute("loginUser");
       String username = user.getUsername();
       int root = user.getRoot();
   %>

</script>
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
    <div>
        <h2>基本信息</h2>

        <%
            List<PatientPic> patientPics1 = (List<PatientPic>) ActionContext.getContext().get("patientPics");
            String pid1 = "1";
            if (patientPics1.size() != 0) {
                pid1 = patientPics1.get(0).getPatient().getPid();
                request.setAttribute("pid1", pid1);
            }
        %>
        <s:iterator begin="0" end="0" value="#patientPics">
            ID编号:<s:property value="patient.ppid"></s:property><br>
            姓名:<s:property value="patient.pname"></s:property><br>
            性别:<s:property value="patient.sex"></s:property><br>
            出生日期:<s:date name="patient.birthday" format="yyyy-MM-dd"></s:date><br>
            受教育程度:<s:property value="patient.xueli"></s:property><br>
            数据源:<s:property value="patient.datasource"></s:property><br>
        </s:iterator>
    </div>
    <%--<div>--%>
    <%--<h2>影像信息</h2>--%>
    <%--<table border="1">--%>
    <%--<s:form namespace="/" action="patientPicAction_addPatientPic.action" enctype="multipart/form-data">--%>
    <%--<s:hidden value="%{#request.pid1}" name="patient.pid"></s:hidden>--%>
    <%--<tr>--%>
    <%--<td>检查日期</td>--%>
    <%--<td>数据类型1</td>--%>
    <%--<td>数据类型2</td>--%>
    <%--<td>处理前数据</td>--%>
    <%--<td>处理后数据</td>--%>
    <%--<td>拍摄设备</td>--%>
    <%--<td>操作</td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
    <%--<td><s:textfield name="checkdate" type="date" cssStyle="width: 120px"></s:textfield></td>--%>
    <%--<td><s:select list="{'请选择','PET','VMAT','MRI'}" name="sjlx1"--%>
    <%--onchange="set_sjlx(this,sjlx2)"></s:select></td>--%>
    <%--<td><s:select list="{'请选择'}" name="sjlx2"--%>
    <%--cssStyle="width: 65px"></s:select></td>--%>
    <%--<td><s:textfield name="clqsj"></s:textfield></td>--%>
    <%--<td><s:textfield name="clhsj"></s:textfield></td>--%>
    <%--<td><s:textfield name="pssb" cssStyle="width: 65px"></s:textfield></td>--%>
    <%--<td><s:submit value="上传"></s:submit></td>--%>
    <%--</tr>--%>
    <%--</s:form>--%>
    <%--<s:iterator value="#patientPics">--%>
    <%--<tr>--%>
    <%--<td><s:date name="checkdate" format="yyyy-MM-dd"></s:date> </td>--%>
    <%--<td><s:property value="sjlx1"></s:property></td>--%>
    <%--<td><s:property value="sjlx2"></s:property></td>--%>
    <%--<td><s:property value="clqsj"></s:property></td>--%>
    <%--<td><s:property value="clhsj"></s:property></td>--%>
    <%--<td><s:property value="pssb"></s:property></td>--%>
    <%--<td>--%>
    <%--<button>编辑</button>--%>
    <%--</td>--%>
    <%--</tr>--%>
    <%--</s:iterator>--%>
    <%--</table>--%>
    <%--</div>--%>
    <div>
        <h2>影像信息</h2>
        <table border="1">
            <s:form enctype="multipart/form-data" namespace="/" action="uploadAction_uploadPatientPic.action"
                    name="myform">
                <s:hidden value="%{#request.pid1}" name="pid"></s:hidden>
                <tr>
                    <td>检查日期</td>
                    <td>影像模态</td>
                    <td>成像方式</td>
                    <td>处理前数据</td>
                    <td>处理后数据</td>
                    <td>拍摄设备</td>
                    <td>操作</td>
                </tr>
                <tr>
                    <td><s:textfield name="checkdate" type="date" cssStyle="width: 130px"
                                     id="checkdate"></s:textfield></td>
                    <td><s:select list="{'请选择','PET','VMAT','MRI'}" name="sjlx1"
                                  onchange="set_sjlx(this,sjlx2)"></s:select></td>
                    <td><s:select list="{'请选择'}" name="sjlx2"
                                  cssStyle="width: 65px"></s:select></td>
                    <td><s:file name="clqsj"></s:file></td>
                    <td><s:file name="clhsj"></s:file></td>
                    <td><s:textfield name="pssb" cssStyle="width: 65px"></s:textfield></td>
                    <td  style="display: <%=root==1?"none":"block"%>"><s:submit value="上传" id="bt"></s:submit></td>
                </tr>
            </s:form>
            <s:iterator value="#patientPics">
                <tr>
                    <td><s:date name="checkdate" format="yyyy-MM-dd"></s:date></td>
                    <td><s:property value="sjlx1"></s:property></td>
                    <td><s:property value="sjlx2"></s:property></td>
                    <td><s:property value="clqsj"></s:property></td>
                    <td><s:property value="clhsj"></s:property></td>
                    <td><s:property value="pssb"></s:property></td>
                    <td>
                        <s:a namespace="/" action="patientPicAction_showOnePatientpic">
                            <s:param name="tid" value="tid">
                            </s:param>
                            <button style="display: <%=root==1?"none":"block"%>">编辑</button>
                        </s:a>
                    </td>
                </tr>
            </s:iterator>
        </table>
    </div>
</div>
</body>
</html>