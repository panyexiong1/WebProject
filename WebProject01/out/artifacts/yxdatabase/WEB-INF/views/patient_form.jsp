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
                            <h3 class="box-title">新增病人</h3>
                        </div>

                        <s:form namespace="/" class="form-horizontal" action="patientAction_addPatient.action" method="post">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="ppid" class="col-sm-2 control-label">ID</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" name="ppid" id="ppid" placeholder="（必填）格式：华山医院数据：hs00001;宣武医院数据：xw00001;ADMI数据：am00001;PPMI数据：pm00001;无锡904数据：wx00001;其他数据：qt00001">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="pname" class="col-sm-2 control-label">姓名</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" name="pname" id="pname" placeholder="（选填）">
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label for="birthday" class="col-sm-2 control-label">出生日期</label>
                                    <div class="col-sm-10">
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="date" class="form-control pull-right" name="birthday" id="birthday">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">性别</label>
                                    <div class="radio col-sm-10">
                                        <label>
                                            <input class="flat-red" type="radio" name="sex" value="m" checked>
                                            男
                                        </label>
                                        <label>
                                            <input class="flat-red" type="radio" name="sex" value="f">
                                            女
                                        </label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">受教育程度</label>
                                    <div class="radio col-sm-10">
                                        <select class="form-control select2" style="width: 100%;" name="xueli">
                                            <option value="小学">小学</option>
                                            <option value="初中">初中</option>
                                            <option value="中专">中专</option>
                                            <option value="高中" selected="selected">高中</option>
                                            <option value="大专">大专</option>
                                            <option value="本科">本科</option>
                                            <option value="硕士">硕士</option>
                                            <option value="博士">博士</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">数据源</label>
                                    <div class="radio col-sm-10">
                                        <select class="form-control select2" style="width: 100%;" name="datasource">
                                            <option value="华山医院" selected="selected">华山医院</option>
                                            <option value="宣武医院">宣武医院</option>
                                            <option value="ADMI">ADMI</option>
                                            <option value="PPMI">PPMI</option>
                                            <option value="无锡904">无锡904</option>
                                            <option value="其他来源">其他来源</option>
                                        </select>
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
