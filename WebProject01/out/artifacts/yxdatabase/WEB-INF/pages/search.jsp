<%@ page import="java.util.*" %>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
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
    </script>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    sjlx = new Object();
    sjlx['PET'] = new Array('AV45', 'FDG', 'AV1451', 'PiB');
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

    //全选，全不选
    function checkAllq() {
        //得到checkAllclqsj,并得到它的选中状态
        var flag = document.getElementById("checkAllclqsj").checked;
        // alert(flag)
        //得到所有clqsj复选框元素
        var clqsj = document.getElementsByName("clqsj");
        //循环给每一个复选框赋值
        for (var i = 0; i < clqsj.length; i++) {
            clqsj[i].checked = flag;
        }
    }

    function checkAllh() {
        //得到checkAllclhsj,并得到它的选中状态
        var flag = document.getElementById("checkAllclhsj").checked;
        // alert(flag)
        //得到所有clhsj复选框元素
        var clqsj = document.getElementsByName("tid");
        //循环给每一个复选框赋值
        for (var i = 0; i < clhsj.length; i++) {
            clhsj[i].checked = flag;
        }
    }

    window.onload = function () {
        var objs = document.getElementsByName("tid");
        var btn = document.getElementById("btn1");
        btn.onclick =  function () {
            var isSel = false;
            for (var i = 0; i < objs.length; i++) {
                // alert("111");
                if (objs[i].checked == true) {
                    isSel = true;
                    break;
                }
            }
            if (isSel == false) {
                alert("请选择下载项！")
                return false;
            } else {
                var form2 = document.forms[1];
                form2.submit();
            }
        }
    }



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
        <div>
            <div>
                <span> <a class="btn btn-default"
                          href="${pageContext.request.contextPath}/patientAction_findAllPatients.action">显示全部</a></span>
            </div>
        </div>

        <div class="table-responsive" style="width:100%; ">
            <s:form namespace="/" action="searchAction_search">
                ID编号<s:textfield name="ppid"></s:textfield><br>
                性别：<s:radio name="sex" list="#{'all':'不限','f':'男','m':'女'}" value="all"></s:radio><br>
                年龄：<s:textfield name="minage"></s:textfield>----<s:textfield name="maxage"></s:textfield><br>
                <%--教育程度：<s:select name="xueli" list="{'不限','小学','初中','中专','高中','大专','本科','硕士','博士'}"></s:select><br>--%>
                数据源：
                <%--<s:radio list="#{'y':'与','h':'或','all':'不限'}" name="datasource0"></s:radio><br>--%>
                <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                <s:checkbox name="datasource" fieldValue="all" value="true"/>不限
                <s:checkbox name="datasource" fieldValue="华山医院" value="false"/>华山医院
                <s:checkbox name="datasource" fieldValue="宣武医院" value="false"/>宣武医院
                <s:checkbox name="datasource" fieldValue="ADMI" value="false"/>ADMI
                <s:checkbox name="datasource" fieldValue="PPMI" value="false"/>PPMI
                <s:checkbox name="datasource" fieldValue="无锡904" value="false"/>无锡904
                <s:checkbox name="datasource" fieldValue="其他来源" value="false"/>其他来源
                <br>
                疾病类型：
                <%--<s:radio list="#{'y':'与','h':'或','all':'不限'}" name="jblx0"></s:radio><br>--%>
                <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                <s:checkbox name="jblx" fieldValue="all" value="true"/>不限
                <s:checkbox name="jblx" fieldValue="AD" value="false"/>AD
                <s:checkbox name="jblx" fieldValue="aMCI" value="false"/>aMCI
                <s:checkbox name="jblx" fieldValue="ADMI" value="false"/>ADMI
                <s:checkbox name="jblx" fieldValue="DLB" value="false"/>DLB
                <s:checkbox name="jblx" fieldValue="FAD" value="false"/>FAD
                <s:checkbox name="jblx" fieldValue="FTD" value="false"/>FTD
                <s:checkbox name="jblx" fieldValue="MCI" value="false"/>MCI
                <s:checkbox name="jblx" fieldValue="NC" value="false"/>NC
                <s:checkbox name="jblx" fieldValue="PDD" value="false"/>PDD
                <s:checkbox name="jblx" fieldValue="SCD" value="false"/>SCD
                <s:checkbox name="jblx" fieldValue="svMCI" value="false"/>svMCI
                <s:checkbox name="jblx" fieldValue="VD" value="false"/>VD
                <s:checkbox name="jblx" fieldValue="PD" value="false"/>PD
                <s:checkbox name="jblx" fieldValue="RBD" value="false"/>RBD
                <s:checkbox name="jblx" fieldValue="DX" value="false"/>癫痫
                <s:checkbox name="jblx" fieldValue="JL" value="false"/>焦虑
                <s:checkbox name="jblx" fieldValue="YY" value="false"/>抑郁
                <br>
                检查日期：
                <s:date name="checkdate" format="yyyy-MM-dd" var="checkdate"></s:date>
                <s:textfield name="checkdate" value="%{#checkdate}" type="date"></s:textfield><br>
                影像模态：
                <%--<s:radio list="#{'y':'与','h':'或','all':'不限'}" name="sjlx1"></s:radio><br>--%>
                <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                <s:checkbox name="sjlx1" fieldValue="all" value="true"/>不限
                <s:checkbox name="sjlx1" fieldValue="PET" value="false"/>PET
                <s:checkbox name="sjlx1" fieldValue="VMAT" value="false"/>VMAT
                <s:checkbox name="sjlx1" fieldValue="MRI" value="false"/>MRI
                <br>
                成像方式：
                <%--<s:radio list="#{'y':'与','h':'或','all':'不限'}" name="sjlx2"></s:radio><br>--%>
                <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                <s:checkbox name="sjlx2" fieldValue="all" value="true"/>不限
                <s:checkbox name="sjlx2" fieldValue="AV45" value="false"/>AV45
                <s:checkbox name="sjlx2" fieldValue="FDG" value="false"/>FDG
                <s:checkbox name="sjlx2" fieldValue="CFT" value="false"/>CFT
                <s:checkbox name="sjlx2" fieldValue="AV1451" value="false"/>AV1451
                <s:checkbox name="sjlx2" fieldValue="PiB" value="false"/>PiB
                <s:checkbox name="sjlx2" fieldValue="VMAT" value="false"/>VMAT
                <s:checkbox name="sjlx2" fieldValue="dMRI" value="false"/>dMRI
                <s:checkbox name="sjlx2" fieldValue="T1" value="false"/>T1
                <s:checkbox name="sjlx2" fieldValue="T2" value="false"/>T2
                <s:checkbox name="sjlx2" fieldValue="DTI" value="false"/>DTI
                <s:checkbox name="sjlx2" fieldValue="ASL" value="false"/>ASL
                <s:checkbox name="sjlx2" fieldValue="BOLD" value="false"/>BOLD
                <br>
                <s:submit value="提交"></s:submit>
            </s:form>
        </div>

        <div class="table-responsive" style="width:100%; ">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <td>ID编号</td>
                    <td>姓名</td>
                    <td>性别</td>
                    <td>出生日期</td>
                    <td>数据源</td>
                    <td>疾病类型</td>
                    <td>检查日期</td>
                    <td>影像模态</td>
                    <td>成像方式</td>
                    <td>处理前数据</td>
                    <%--<td>--%>
                    <%--<input id="checkAllclqsj" type="checkbox" onclick="checkAllq()"/>全选/全不选--%>
                    <%--</td>--%>
                    <td>处理后数据</td>
                    <td>
                        <input id="checkAllclhsj" type="checkbox" onclick="checkAllh()"/>全选/全不选
                    </td>
                    <td>tid</td>
                </tr>
                </thead>

                <tbody>
                <s:form namespace="/" action="downloadAction_downloadPatientPic" id="form2">
                    <s:iterator value="list1" status="st">
                        <tr>
                            <s:hidden name="pid" value="%{#list1.get(#st.index)[0]}"></s:hidden>
                            <td><s:property value="#list1.get(#st.index)[1]"></s:property></td>
                            <td><s:property value="#list1.get(#st.index)[2]"></s:property></td>
                            <td><s:property value="#list1.get(#st.index)[3]"></s:property></td>
                            <td><s:date name="#list1.get(#st.index)[4]" format="yyyy-MM-dd"></s:date></td>
                            <td><s:property value="#list1.get(#st.index)[5]"></s:property></td>
                            <td><s:property value="#list1.get(#st.index)[6]"></s:property></td>
                            <td><s:date name="#list1.get(#st.index)[7]" format="yyyy-MM-dd"></s:date></td>
                            <td><s:property value="#list1.get(#st.index)[8]"></s:property></td>
                            <td><s:property value="#list1.get(#st.index)[9]"></s:property></td>

                            <td><s:property value="#list1.get(#st.index)[10]"></s:property></td>
                                <%--<td><s:checkbox id="clqsj" name="clqsj"--%>
                                <%--fieldValue="%{#list1.get(#st.index)[10]}"></s:checkbox></td>--%>
                            <td><s:property value="#list1.get(#st.index)[11]"></s:property></td>
                            <td><s:checkbox id="clhsj" name="tid"
                                            fieldValue="%{#list1.get(#st.index)[12]}"></s:checkbox></td>
                            <td><s:property value="#list1.get(#st.index)[12]"></s:property></td>
                                <%--<s:hidden name="tid" value="%{#list1.get(#st.index)[12]}"></s:hidden>--%>
                        </tr>
                    </s:iterator>

                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            <button id="btn1">下载选中项</button>
                        </td>
                    </tr>
                </s:form>
                </tbody>
            </table>
        </div>

    </div>
</div>


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