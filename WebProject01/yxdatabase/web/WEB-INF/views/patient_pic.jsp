<%@ page import="com.shu.user.domain.User" %>
<%@ page import="com.shu.patient.domain.PatientBingli" %>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page import="com.shu.patient.domain.PatientPic" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<head>

    <title>影响学数据库 | 病人管理</title>
    <jsp:include page="../includes/header.jsp"/>

    <script type="text/javascript">


        //提示用户是否删除
        function delPatient(ID, name) {
            if (confirm("是否确定删除“" + name + "”的所有信息?")) {
                location.href = "${pageContext.request.contextPath}/servlet/delPatientByIDcardServlet?ID=" + ID;
            }
        }

        window.onload = function () {
            var btn = document.getElementById("submit");
            btn.onclick = function () {
                if (document.myform.checkdate.value == "") {
                    $('#modal-danger').modal('show');
                    document.myform.checkdate.focus();
                    return false;
                }
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
                            <h3 class="box-title">图像信息</h3>
                            <div class="row" style="padding-left: 15px; padding-top: 10px;">
                                <a href="${pageContext.request.contextPath}/patientPicAction_addOnePatientPic.action?pid=${patientPics.get(0).patient.pid}" type="button" class="btn btn-sm  btn-default" style="display: <%=root==1?"none":""%>"><i
                                        class="fa fa-plus"></i>新增</a>&nbsp;
                                <a href="#" type="button" class="btn btn-sm  btn-danger" style="display: <%=root==1?"none":""%>"><i class="fa fa-trash-o"></i>删除</a>&nbsp;
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
                                    <td><span class="badge ">${patientPics.get(0).patient.ppid}</span></td>
                                    <td><span class="badge bg-green">姓名</span></td>
                                    <td><span class="badge ">${patientPics.get(0).patient.pname}</span></td>
                                    <td><span class="badge bg-green">性别</span></td>
                                    <td><span
                                            class="badge ">${patientPics.get(0).patient.sex == 'm' ? "男" : "女"}</span>
                                    </td>
                                    <td><span class="badge bg-green">出生日期</span></td>
                                    <td><span class="badge "><fmt:formatDate
                                            value="${patientPics.get(0).patient.birthday}"
                                            pattern="yyyy-MM-dd"/></span></td>
                                    <td><span class="badge bg-green">受教育程度</span></td>
                                    <td><span class="badge ">${patientPics.get(0).patient.xueli}</span></td>
                                    <td><span class="badge bg-green">数据源</span></td>
                                    <td><span class="badge ">${patientPics.get(0).patient.datasource}</span>
                                    </td>
                                </tr>
                            </table>
                        </div>


                        <div class="box-header with-border">
                            <h3 class="box-title"><span class="badge bg-blue">图像信息</span></h3>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>检查日期</th>
                                    <th>影像模态</th>
                                    <th>成像方式</th>
                                    <th>处理前数据</th>
                                    <th>处理后数据</th>
                                    <th>拍摄设备</th>
                                    <th style="display: <%=root==1?"none":"block"%>">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <s:iterator value="#patientPics">
                                    <tr>
                                        <td><s:date name="checkdate" format="yyyy-MM-dd"></s:date></td>
                                        <td><s:property value="sjlx1"></s:property></td>
                                        <td><s:property value="sjlx2"></s:property></td>
                                        <td><s:property value="clqsj"></s:property></td>
                                        <td><s:property value="clhsj"></s:property></td>
                                        <td><s:property value="pssb"></s:property></td>
                                        <td style="display: <%=root==1?"none":""%>">
                                            <s:a namespace="/" action="patientPicAction_showOnePatientpic" cssClass="btn btn-sm btn-primary">
                                                <s:param name="tid" value="tid"></s:param>
                                                <span><i class="fa fa-edit"></i> 编辑</span>
                                            </s:a>

                                            <%--<s:a namespace="/" action="patientPicAction_showOnePatientpic" cssClass="btn btn-sm btn-danger">--%>
                                                <%--<s:param name="tid" value="tid"></s:param>--%>
                                                <%--<span><i class="fa fa-trash"></i> 删除</span>--%>
                                            <%--</s:a>--%>

                                            <button class="btn btn-sm btn-danger"  data-toggle="modal" data-target="#${tid}">
                                                <span><i class="fa fa-trash"></i> 删除</span>
                                            </button>

                                            <div class="modal modal-danger fade" id="${tid}">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span></button>
                                                            <h4 class="modal-title">警告</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>确定删除该条图像信息吗？</p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-outline pull-right" data-dismiss="modal">取消</button>
                                                            <s:a cssClass="btn btn-outline pull-left" namespace="/" action="patientPicAction_deleteOnePatientPic.action">
                                                                <s:param name="tid" value="tid"></s:param>
                                                                <%
                                                                    List<PatientPic> patientPics = (List<PatientPic>) ActionContext.getContext().get("patientPics");
                                                                    String pid = patientPics.get(0).getPatient().getPid();
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

            <div class="modal modal-danger fade" id="modal-danger">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">提示</h4>
                        </div>
                        <div class="modal-body">
                            <p>检查日期不能为空，请输入！！！</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline pull-right" data-dismiss="modal">关闭</button>
                        </div>
                    </div>
                </div>
            </div>


        </section>

    </div>

    <jsp:include page="../includes/copyrigth.jsp"/>

</div>

<jsp:include page="../includes/footer.jsp"/>

</body>
</html>
