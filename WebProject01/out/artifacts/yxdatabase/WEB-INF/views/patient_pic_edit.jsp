<%@ page import="com.shu.patient.domain.PatientPic" %>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<head>

    <title>影响学数据库 | 病人管理</title>
    <jsp:include page="../includes/header.jsp"/>

</head>
<body class="hold-transition skin-blue sidebar-mini">

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
        var btn = document.getElementById("submit");
        btn.onclick = function () {
            if (document.myform.checkdate.value == "") {
                $('#modal-danger').modal('show');
                document.myform.checkdate.focus();
                return false;
            }
        }
    }

</script>

<div class="wrapper">
    <jsp:include page="../includes/nav.jsp"/>
    <jsp:include page="../includes/menu.jsp"/>

    <div class="content-wrapper">

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
                    <div class="alert alert alert-warning alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <h4><i class="icon fa fa-warning"></i>如需修改，请重新选择 <span style="color: red">影像模态</span> 和 <span style="color: red">成像方式</span> 。</h4>
                    </div>

                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title">修改图像信息</h3>
                        </div>

                        <s:form namespace="/" class="form-horizontal"
                                action="uploadAction_editOnePic.action" method="post" name="myform">
                            <s:hidden name="tid"></s:hidden>
                            <s:hidden name="pid" value="%{patient.pid}"></s:hidden>
                            <div class="box-body">

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">检查日期</label>
                                    <div class="col-sm-10">
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <s:date name="checkdate" format="yyyy-MM-dd" var="checkdate"></s:date>
                                            <s:textfield class="form-control pull-right" name="checkdate"
                                                         value="%{#checkdate}" type="date"></s:textfield>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">影像模态</label>
                                    <div class="radio col-sm-10">
                                        <s:select cssClass="form-control select2" style="width: 100%;"
                                                  list="{'请选择','PET','VMAT','MRI'}" name="sjlx1"
                                                  onchange="set_sjlx(this,sjlx2)"></s:select>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-sm-2 control-label">成像方式</label>
                                    <div class="radio col-sm-10">
                                        <s:select cssClass="form-control select2" style="width: 100%;" list="{'请选择'}"
                                                  name="sjlx2"></s:select>
                                    </div>
                                </div>

                                    <%--<div class="form-group">--%>
                                    <%--<label class="col-sm-2 control-label">处理前数据</label>--%>
                                    <%--<div class="col-sm-10">--%>
                                <s:hidden cssClass="form-control" name="clqsj1" value="%{clqsj}"></s:hidden>
                                    <%--</div>--%>
                                    <%--</div>--%>

                                    <%--<div class="form-group">--%>
                                    <%--<label class="col-sm-2 control-label">处理后数据</label>--%>
                                    <%--<div class="col-sm-10">--%>
                                <s:hidden cssClass="form-control" name="clhsj1" value="%{clhsj}"></s:hidden>
                                    <%--</div>--%>
                                    <%--</div>--%>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">拍摄设备</label>
                                    <div class="col-sm-10">
                                        <s:textfield name="pssb" cssClass="form-control"></s:textfield>
                                    </div>
                                </div>


                                <div class="box-footer">
                                    <button type="button" class="btn btn-default" onclick="history.go(-1);">返回</button>
                                    <button id="submit" type="submit" class="btn btn-info pull-right btn-danger">提交
                                    </button>
                                </div>

                            </div>

                        </s:form>
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
