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

                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title">搜索下载</h3>
                        </div>
                    </div>

                    <div class="callout callout-success">
                        <h4><s:a namespace="/" action="downloadAction_downloading">打包完成，点击下载</s:a></h4>
                    </div>
                </div>
            </div>
        </section>

    </div>

    <jsp:include page="../includes/copyrigth.jsp"/>

</div>

<jsp:include page="../includes/footer.jsp"/>


<script type="text/javascript">


    window.onload = function () {
        var objs = document.getElementsByName("tid");
        var btn = document.getElementById("btn");

        btn.onclick = function () {
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

    $(function () {


        //全选功能
        $("#checkAllsj").on("ifChanged",function(){
            var checkVal = $(this).prop("checked");
            if(checkVal){
                $("input[name='tid']").iCheck("check");
            }else{
                $("input[name='tid']").iCheck("uncheck");
            }

        });

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
