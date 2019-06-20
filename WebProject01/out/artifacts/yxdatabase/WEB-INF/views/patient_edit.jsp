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
                            <h3 class="box-title">修改病人</h3>
                        </div>

                        <s:form namespace="/" class="form-horizontal" action="patientAction_editPatient.action" method="post">
                            <s:hidden name="pid"></s:hidden>
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="ppid" class="col-sm-2 control-label">ID</label>
                                    <div class="col-sm-10">
                                        <s:textfield id="ppid" cssClass="form-control" name="ppid"></s:textfield>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="pname" class="col-sm-2 control-label">姓名</label>
                                    <div class="col-sm-10">
                                        <s:textfield id="pname" cssClass="form-control" name="pname"></s:textfield>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label for="birthday" class="col-sm-2 control-label">出生日期</label>
                                    <div class="col-sm-10">
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <s:date name="birthday" format="yyyy-MM-dd" var="birthday"></s:date>
                                            <s:textfield id="birthday" class="form-control pull-right" name="birthday" value="%{#birthday}" type="date"></s:textfield>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">性别</label>
                                    <div class="col-sm-10">
                                        <label>
                                            <s:radio cssClass="flat-red" list="#{'m':'男','f':'女'}" name="sex"></s:radio>
                                        </label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">受教育程度</label>
                                    <div class="radio col-sm-10">
                                        <s:select cssClass="form-control select2" style="width: 100%;" name="xueli" list="{'小学','初中','中专','高中','大专','本科','硕士','博士'}"></s:select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">数据源</label>
                                    <div class="radio col-sm-10">
                                        <s:select class="form-control select2" style="width: 100%;" name="datasource" list="{'华山医院','宣武医院','ADMI','PPMI','无锡904','其他来源'}"></s:select>
                                    </div>
                                </div>

                                <div class="box-footer">
                                    <button type="button" class="btn btn-default" onclick="history.go(-1);">返回</button>
                                    <button type="submit" class="btn btn-info pull-right">提交</button>
                                </div>

                            </div>

                        </s:form>
                    </div>
                </div>
            </div>
        </section>

    </div>

    <jsp:include page="../includes/copyrigth.jsp"/>

</div>

<jsp:include page="../includes/footer.jsp"/>

<script type="text/javascript">

    $(function () {


        //Flat red color scheme for iCheck
        $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
            checkboxClass: 'icheckbox_flat-green',
            radioClass: 'iradio_flat-green'

        });

        //Colorpicker
        $('.my-colorpicker1').colorpicker();
        //color picker with addon
        $('.my-colorpicker2').colorpicker();

    })
</script>

</body>
</html>
