<%@ page import="com.shu.user.domain.User" %>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page import="com.shu.patient.domain.PatientBingli" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<head>

    <title>影响学数据库 | 病人管理</title>
    <jsp:include page="../includes/header.jsp"/>

    <%--用户权限，root=0为管理员；root = 1不可进行编辑--%>
    <%
        User user = (User) request.getSession().getAttribute("loginUser");
        String username = user.getUsername();
        int root = user.getRoot();
    %>


</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <jsp:include page="../includes/nav.jsp"/>
    <jsp:include page="../includes/menu.jsp"/>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">

        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                病人管理
                <small></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">病人管理</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">

                    <c:if test="${baseResult != null}">
                        <div class="alert alert-${baseResult.status == 200 ? "success" : "danger"} alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${baseResult.message}
                        </div>
                    </c:if>

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">病理信息</h3>
                            <div class="row" style="padding-left: 15px; padding-top: 10px;">
                                <a href="${pageContext.request.contextPath}/patientBingliAction_addOnePatientBingli.action?pid=${patientBinglis.get(0).patient.pid}"
                                   type="button" class="btn btn-sm  btn-default"
                                   style="display: <%=root==1?"none":""%>"><i
                                        class="fa fa-plus"></i>新增</a>&nbsp;
                                <a href="#" type="button" class="btn btn-sm  btn-danger"
                                   style="display: <%=root==1?"none":""%>"><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                <%--<a href="#" type="button" class="btn btn-sm  btn-default"><i class="fa fa-download"></i>导入</a>&nbsp;--%>
                                <a href="#" type="button" class="btn btn-sm  btn-default"><i class="fa fa-upload"></i>导出</a>
                            </div>
                        </div>

                        <div class="box-header with-border">
                            <h3 class="box-title"><span class="badge bg-blue">基本信息</span></h3>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover table-bordered">
                                <tr>
                                    <td><span class="badge bg-green">ID</span></td>
                                    <td><span class="badge ">${patientBinglis.get(0).patient.ppid}</span></td>
                                    <td><span class="badge bg-green">姓名</span></td>
                                    <td><span class="badge ">${patientBinglis.get(0).patient.pname}</span></td>
                                    <td><span class="badge bg-green">性别</span></td>
                                    <td><span
                                            class="badge ">${patientBinglis.get(0).patient.sex == 'm' ? "男" : "女"}</span>
                                    </td>
                                    <td><span class="badge bg-green">出生日期</span></td>
                                    <td><span class="badge "><fmt:formatDate
                                            value="${patientBinglis.get(0).patient.birthday}"
                                            pattern="yyyy-MM-dd"/></span></td>
                                    <td><span class="badge bg-green">受教育程度</span></td>
                                    <td><span class="badge ">${patientBinglis.get(0).patient.xueli}</span></td>
                                    <td><span class="badge bg-green">数据源</span></td>
                                    <td><span class="badge ">${patientBinglis.get(0).patient.datasource}</span>
                                    </td>
                                </tr>
                            </table>
                        </div>


                        <div class="box-header with-border">
                            <h3 class="box-title"><span class="badge bg-blue">病理信息</span></h3>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>检查日期</th>
                                    <th>身高</th>
                                    <th>体重</th>
                                    <th>血糖</th>
                                    <th>疾病类型</th>
                                    <th>起病时间</th>
                                    <th>起病肢体</th>
                                    <th>病程</th>
                                    <th>DM史</th>
                                    <th>UPDRS</th>
                                    <th>HY</th>
                                    <th>MMSE</th>
                                    <th>MOCA</th>
                                    <th>CDRSB</th>
                                    <th>ADAS11</th>
                                    <th>ADAS13</th>
                                    <th>RAVLT_immediate</th>
                                    <th>RAVLT_learning</th>
                                    <th>RAVLT_forgetting</th>
                                    <th style="display: <%=root==1?"none":"block"%>">操作</th>
                                </tr>
                                </thead>

                                <tbody>
                                <s:iterator value="#patientBinglis">
                                    <tr>
                                        <td><s:date name="checkdate" format="yyyy-MM-dd"></s:date></td>
                                        <td><s:property value="height"></s:property></td>
                                        <td><s:property value="weight"></s:property></td>
                                        <td><s:property value="xuetang"></s:property></td>
                                        <td><s:property value="jblx"></s:property></td>
                                        <td><s:date name="qingbingsj" format="yyyy-MM-dd"></s:date></td>
                                        <td><s:property value="qingbingzt"></s:property></td>
                                        <td><s:property value="bingcheng"></s:property></td>
                                        <td><s:property value="DM"></s:property></td>
                                        <td><s:property value="UPDRS"></s:property></td>
                                        <td><s:property value="HY"></s:property></td>
                                        <td><s:property value="MMSE"></s:property></td>
                                        <td><s:property value="MOCA"></s:property></td>
                                        <td><s:property value="CDRSB"></s:property></td>
                                        <td><s:property value="ADAS11"></s:property></td>
                                        <td><s:property value="ADAS13"></s:property></td>
                                        <td><s:property value="RAVLT_immediate"></s:property></td>
                                        <td><s:property value="RAVLT_learning"></s:property></td>
                                        <td><s:property value="RAVLT_forgetting"></s:property></td>
                                        <td style="display: <%=root==1?"none":""%>">
                                            <s:a namespace="/" action="patientBingliAction_showOnePatientBingli"
                                                 cssClass="btn btn-sm btn-primary">
                                                <s:param name="bid" value="bid"></s:param>
                                                <span><i class="fa fa-edit"></i>编辑</span>
                                            </s:a>
                                            <%--<s:a namespace="/"--%>
                                                 <%--action="patientBingliAction_deleteOnePatientBingli.action"--%>
                                                 <%--cssClass="btn btn-sm btn-danger" onclick="delPatientAll()">--%>
                                                <%--<s:param name="bid" value="bid"></s:param>--%>
                                                <%--<%--%>
                                                    <%--List<PatientBingli> patientBinglis = (List<PatientBingli>) ActionContext.getContext().get("patientBinglis");--%>
                                                    <%--String pid = patientBinglis.get(0).getPatient().getPid();--%>
                                                    <%--ActionContext.getContext().put("patientPid", pid);--%>
                                                <%--%>--%>
                                                <%--<s:param name="patient.pid" value="%{#patientPid}"></s:param>--%>
                                                <%--<span><i class="fa fa-trash"></i> 删除</span>--%>
                                            <%--</s:a>--%>
                                            <button class="btn btn-sm btn-danger"  data-toggle="modal" data-target="#${bid}">
                                                <span><i class="fa fa-trash"></i> 删除</span>
                                            </button>

                                            <div class="modal modal-danger fade" id="${bid}">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span></button>
                                                            <h4 class="modal-title">警告</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>确定删除该条病理信息吗？</p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-outline pull-right" data-dismiss="modal">取消</button>
                                                            <s:a cssClass="btn btn-outline pull-left" namespace="/" action="patientBingliAction_deleteOnePatientBingli.action">
                                                                <s:param name="bid" value="bid"></s:param>
                                                                <%
                                                                    List<PatientBingli> patientBinglis = (List<PatientBingli>) ActionContext.getContext().get("patientBinglis");
                                                                    String pid = patientBinglis.get(0).getPatient().getPid();
                                                                    ActionContext.getContext().put("patientPid", pid);
                                                                %>
                                                                <s:param name="patient.pid" value="%{#patientPid}"></s:param>删除</s:a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </td>
                                    </tr>
                                </s:iterator>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>




        </section>
    </div>

    <jsp:include page="../includes/copyrigth.jsp"/>

</div>

<jsp:include page="../includes/footer.jsp"/>

<script type="text/javascript">
    function delPatientAll(){
        if (confirm("确定删除")) {
            return true;
        }
        return false;
        // $('#modal-danger').modal('show');
    }
</script>

</body>
</html>
