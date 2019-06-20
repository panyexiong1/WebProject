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
                    <c:if test="${savePatient != null}">
                        <div class="alert alert-${baseResult.status == 200 ? "success" : "danger"} alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${savePatient.message}
                        </div>
                    </c:if>

                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title">修改病理</h3>
                        </div>

                        <s:form namespace="/" class="form-horizontal"
                                action="patientBingliAction_editOnePatientBingli.action" method="post" name="myform">
                            <s:hidden name="bid"></s:hidden>
                            <s:hidden name="patient.pid"></s:hidden>
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
                                    <label class="col-sm-2 control-label">身高</label>
                                    <div class="col-sm-10">
                                        <s:textfield cssClass="form-control" name="height"></s:textfield>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-sm-2 control-label">体重</label>
                                    <div class="col-sm-10">
                                        <s:textfield cssClass="form-control" name="weight"></s:textfield>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">血糖</label>
                                    <div class="col-sm-10">
                                        <s:textfield cssClass="form-control" name="xuetang"></s:textfield>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">疾病类型</label>
                                    <div class="radio col-sm-10">
                                        <s:select cssClass="form-control select2" style="width: 100%;"
                                                list="#{'':'请选择','AD':'AD','aMCI':'aMCI','DLB':'DLB','FAD':'FAD','FTD':'FTD','MCI':'MCI','NC':'NC','PDD':'PDD','SCD':'SCD','svMCI':'svMCI','VD':'VD','DX':'癫痫','JL':'焦虑','YY':'抑郁','PD':'PD','RBD':'RBD'}"
                                                name="jblx"></s:select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">起病时间</label>
                                    <div class="col-sm-10">
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <s:date name="qingbingsj" format="yyyy-MM-dd" var="qingbingsj"></s:date>
                                            <s:textfield class="form-control pull-right" name="qingbingsj"
                                                         value="%{#qingbingsj}" type="date"></s:textfield>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">起病肢体</label>
                                    <div class="col-sm-10">
                                        <s:textfield cssClass="form-control" name="qingbingzt"></s:textfield>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">病程</label>
                                    <div class="col-sm-10">
                                        <s:textfield cssClass="form-control" name="bingcheng"></s:textfield>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">DM史</label>
                                    <div class="col-sm-10">
                                        <s:textfield cssClass="form-control" name="DM"></s:textfield>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">UPDRS</label>
                                    <div class="col-sm-10">
                                        <s:textfield cssClass="form-control" name="UPDRS"></s:textfield>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">HY</label>
                                    <div class="col-sm-10">
                                        <s:textfield cssClass="form-control" name="HY"></s:textfield>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">MMSE</label>
                                    <div class="col-sm-10">
                                        <s:textfield cssClass="form-control" name="MMSE"></s:textfield>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">MOCA</label>
                                    <div class="col-sm-10">
                                        <s:textfield cssClass="form-control" name="MOCA"></s:textfield>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">CDRSB</label>
                                    <div class="col-sm-10">
                                        <s:textfield cssClass="form-control" name="CDRSB"></s:textfield>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">ADAS11</label>
                                    <div class="col-sm-10">
                                        <s:textfield cssClass="form-control" name="ADAS11"></s:textfield>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">ADAS13</label>
                                    <div class="col-sm-10">
                                        <s:textfield cssClass="form-control" name="ADAS13"></s:textfield>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">RAVLT_immediate</label>
                                    <div class="col-sm-10">
                                        <s:textfield cssClass="form-control" name="RAVLT_immediate"></s:textfield>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">RAVLT_learning</label>
                                    <div class="col-sm-10">
                                        <s:textfield cssClass="form-control" name="RAVLT_learning"></s:textfield>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">RAVLT_forgetting</label>
                                    <div class="col-sm-10">
                                        <s:textfield cssClass="form-control" name="RAVLT_forgetting"></s:textfield>
                                    </div>
                                </div>

                                <div class="box-footer">
                                    <button type="button" class="btn btn-default" onclick="history.go(-1);">返回</button>
                                    <button id="submit" type="submit" class="btn btn-info pull-right btn-danger">提交</button>
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
