<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page import="java.util.List" %>
<%@ page import="com.shu.patient.domain.PatientBingli" %>
<%@ page import="com.shu.patient.domain.PatientPic" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>修改图像信息</title>
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

</script>
<body>
<div>
    <div>
        <h2>修改图像信息</h2>
        <%
            PatientPic patientPic1 = (PatientPic) ActionContext.getContext().get("showOnePatientpic");
            String pid1 = "1";
            if (patientPic1 != null) {
                pid1 = patientPic1.getPatient().getPid();
            }
            request.setAttribute("pid1", pid1);
        %>
        <table border="1">
            <tr>
                <td>检查日期</td>
                <td>影响模态</td>
                <td>成像方式</td>
                <td>处理前数据</td>
                <td>处理后数据</td>
                <td>拍摄设备</td>
                <td>操作</td>
            </tr>
            <tr>
                <s:iterator value="#showOnePatientpic">
                    <td><s:date name="checkdate" format="yyyy-MM-dd"></s:date></td>
                    <td><s:property value="sjlx1"></s:property></td>
                    <td><s:property value="sjlx2"></s:property></td>
                    <td><s:property value="clqsj"></s:property></td>
                    <td><s:property value="clhsj"></s:property></td>
                    <td><s:property value="pssb"></s:property></td>
                    <td>
                        <s:a namespace="/" action="patientPicAction_showPatientPic">
                            <s:param name="picpid" value="patient.pid"></s:param>
                            <button>保留</button>
                        </s:a>
                    </td>
                </s:iterator>
            </tr>
            <s:form namespace="/" action="uploadAction_editOnePatientPic.action" enctype="multipart/form-data"
                    name="myform">
                <s:hidden name="tid"></s:hidden><br>
                <s:hidden name="pid" value="%{#request.pid1}"></s:hidden>
                <tr>
                    <td><s:textfield name="checkdate" type="date" cssStyle="width: 120px"
                                     id="checkdate"></s:textfield></td>
                    <td><s:select list="{'请选择','PET','VMAT','MRI'}" name="sjlx1"
                                  onchange="set_sjlx(this,sjlx2)"></s:select></td>
                    <td><s:select list="{'请选择'}" name="sjlx2"
                                  cssStyle="width: 65px"></s:select></td>
                    <td><s:file name="clqsj"></s:file></td>
                    <td><s:file name="clhsj"></s:file></td>
                    <td><s:textfield name="pssb" cssStyle="width: 65px"></s:textfield></td>
                    <td><s:submit value="修改" id="bt"></s:submit></td>
                </tr>
            </s:form>
        </table>
    </div>
</div>
</body>
</html>