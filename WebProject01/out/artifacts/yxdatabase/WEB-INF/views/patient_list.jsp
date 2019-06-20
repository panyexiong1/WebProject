<%@ page import="com.shu.user.domain.User" %>
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
        function delOnePatient() {
            $('#${pid}').modal('show');
        }

        function delOnePatient1(a) {
            if (a == 2) {
                var shanchu = document.getElementsByName("shanchu");
                shanchu.onclick = true;
            }
        }

        // 用户权限，root=0为管理员；root = 1不可进行编辑
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

                    <c:if test="${savePatient != null}">
                        <div class="alert alert-${savePatient.status == 200 ? "success" : "danger"} alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${savePatient.message}
                        </div>
                    </c:if>

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">病人列表</h3>

                            <div class="row" style="padding-left: 15px; padding-top: 10px;">
                                <a href="${pageContext.request.contextPath}/patientAction_addPatientjsp.action"
                                   type="button" class="btn btn-sm  btn-default"
                                   style="display: <%=root==1?"none":""%>"><i
                                        class="fa fa-plus"></i>新增</a>&nbsp;
                                <a href="#" type="button" class="btn btn-sm  btn-danger"
                                   style="display: <%=root==1?"none":""%>"><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                <%--<a href="#" type="button" class="btn btn-sm  btn-default"><i class="fa fa-download"></i>导入</a>&nbsp;--%>
                                <a href="#" type="button" class="btn btn-sm  btn-default"><i class="fa fa-upload"></i>导出</a>
                            </div>


                            <div class="box-tools">
                                <div class="input-group input-group-sm" style="width: 150px;">
                                    <input type="text" name="table_search" class="form-control pull-right"
                                           placeholder="搜索">

                                    <div class="input-group-btn">
                                        <button type="submit" class="btn btn-default"><i class="fa fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>姓名</th>
                                    <th>性别</th>
                                    <th>出生日期</th>
                                    <th>受教育程度</th>
                                    <th>数据源</th>
                                    <th>病理信息</th>
                                    <th>图像信息</th>
                                    <th style="display: <%=root==1?"none":"block"%>">操作</th>
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
                                        <td><s:a namespace="/" action="patientBingliAction_showPatientBingli"
                                                 cssClass="btn btn-sm btn-default">
                                            <s:param name="patient.pid" value="%{pid}"></s:param><i
                                                class="fa fa-search"></i>查看</s:a></td>
                                        <td><s:a namespace="/" action="patientPicAction_showPatientPic"
                                                 cssClass="btn btn-sm btn-default">
                                            <s:param name="patient.pid" value="%{pid}"></s:param><i
                                                class="fa fa-search"></i>查看
                                        </s:a></td>
                                        <td style="display: <%=root==1?"none":""%>">
                                            <s:a id="bianji" namespace="/" action="patientAction_findPatientByPid"
                                                 cssClass="btn btn-sm btn-primary">
                                                <s:param name="pid" value="pid"></s:param>
                                                <span><i
                                                        class="fa fa-edit"></i> 编辑</span>
                                            </s:a>
                                            <%--<s:a name="shanchu" cssClass="btn btn-sm btn-danger"--%>
                                                 <%--namespace="/" action="patientAction_deleteOnePatientByPid">--%>
                                                <%--<s:param name="pid" value="pid"></s:param>--%>
                                                <%--<span><i class="fa fa-trash"></i> 删除</span>--%>
                                            <%--</s:a>--%>
                                            <button class="btn btn-sm btn-danger" data-toggle="modal" data-target="#${pid}">
                                                <span><i class="fa fa-trash"></i> 删除</span></button>

                                            <div class="modal modal-danger fade" id="${pid}">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                <span aria-hidden="true">&times;</span></button>
                                                            <h4 class="modal-title">警告</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>确定删除该病人的所有信息（病理信息和图像信息）吗？</p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button"
                                                                    class="btn btn-outline pull-right"
                                                                    data-dismiss="modal">取消
                                                            </button>

                                                            <s:a cssClass="btn btn-outline pull-left"
                                                                 namespace="/" action="patientAction_deleteOnePatientByPid">
                                                                <s:param name="pid" value="pid"></s:param>
                                                                <span><i class="fa fa-trash"></i> 删除</span>
                                                            </s:a>
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

</body>
</html>
