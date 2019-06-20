<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page import="java.util.List" %>
<%@ page import="com.shu.patient.domain.PatientBingli" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>修改病理信息</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
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
        <h2>修改病理信息</h2>
        <table border="1">
            <s:form namespace="/" action="patientBingliAction_editOnePatientBingli.action" name="myform">
                <s:hidden name="bid"></s:hidden>
                <s:hidden name="patient.pid"></s:hidden>
                <tr>
                    <td>检查日期</td>
                    <td>身高</td>
                    <td>体重</td>
                    <td>血糖</td>
                    <td>疾病类型</td>
                    <td>起病时间</td>
                    <td>起病肢体</td>
                    <td>病程</td>
                    <td>DM史</td>
                    <td>UPDRS</td>
                    <td>HY</td>
                    <td>MMSE</td>
                    <td>MOCA</td>
                    <td>CDRSB</td>
                    <td>ADAS11</td>
                    <td>ADAS13</td>
                    <td>RAVLT_immediate</td>
                    <td>RAVLT_learning</td>
                    <td>RAVLT_forgetting</td>
                    <td>操作</td>
                </tr>
                <tr>
                    <td><s:date name="checkdate" format="yyyy-MM-dd" var="checkdate"></s:date>
                        <s:textfield name="checkdate" value="%{#checkdate}" type="date"
                                     cssStyle="width: 120px" id="checkdate"></s:textfield></td>
                    <td><s:textfield name="height" cssStyle="width: 30px"></s:textfield></td>
                    <td><s:textfield name="weight" cssStyle="width: 30px"></s:textfield></td>
                    <td><s:textfield name="xuetang" cssStyle="width: 30px"></s:textfield></td>
                    <td><s:select
                            list="#{'':'请选择','AD':'AD','aMCI':'aMCI','DLB':'DLB','FAD':'FAD','FTD':'FTD','MCI':'MCI','NC':'NC','PDD':'PDD','SCD':'SCD','svMCI':'svMCI','VD':'VD','DX':'癫痫','JL':'焦虑','YY':'抑郁','PD':'PD','RBD':'RBD'}"
                            name="jblx" cssStyle="width: 70px"></s:select>
                            <%--<s:textfield name="jblx" cssStyle="width: 60px"></s:textfield>--%>
                    </td>
                    <td><s:date name="qingbingsj" format="yyyy-MM-dd" var="qingbingsj"></s:date>
                        <s:textfield name="qingbingsj" value="%{#qingbingsj}" type="date"
                                     cssStyle="width: 120px"></s:textfield></td>
                    <td><s:textfield name="qingbingzt" cssStyle="width: 60px"></s:textfield></td>
                    <td><s:textfield name="bingcheng" cssStyle="width: 60px"></s:textfield></td>
                    <td><s:textfield name="DM" cssStyle="width: 60px"></s:textfield></td>
                    <td><s:textfield name="UPDRS" cssStyle="width: 60px"></s:textfield></td>
                    <td><s:textfield name="HY" cssStyle="width: 30px"></s:textfield></td>
                    <td><s:textfield name="MMSE" cssStyle="width: 50px"></s:textfield></td>
                    <td><s:textfield name="MOCA" cssStyle="width: 50px"></s:textfield></td>
                    <td><s:textfield name="CDRSB" cssStyle="width: 50px"></s:textfield></td>
                    <td><s:textfield name="ADAS11" cssStyle="width: 50px"></s:textfield></td>
                    <td><s:textfield name="ADAS13" cssStyle="width: 50px"></s:textfield></td>
                    <td><s:textfield name="RAVLT_immediate" cssStyle="width: 130px"></s:textfield></td>
                    <td><s:textfield name="RAVLT_learning" cssStyle="width: 130px"></s:textfield></td>
                    <td><s:textfield name="RAVLT_forgetting" cssStyle="width: 150px"></s:textfield></td>
                    <td><s:submit value="修改" id="bt"></s:submit></td>
                </tr>
            </s:form>
        </table>
    </div>
</div>
</body>
</html>