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

                        <s:form namespace="/" class="form-horizontal"
                                action="searchAction_search.action" method="post" name="myform">
                            <s:hidden name="patient.pid" value="%{pid}"></s:hidden>
                            <div class="box-body">

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">ID</label>
                                    <div class="col-sm-10">
                                        <s:textfield name="ppid"></s:textfield>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">性别</label>
                                    <div class="col-sm-10">
                                        <s:radio cssClass="flat-red" name="sex" list="#{'all':'不限','f':'男','m':'女'}"
                                                 value="f"></s:radio>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-sm-2 control-label">年龄范围</label>
                                    <div class="col-sm-10">
                                        <s:textfield name="minage"></s:textfield>----<s:textfield
                                            name="maxage"></s:textfield>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">数据源</label>
                                    <div class="col-sm-10">
                                        <s:checkbox cssClass="flat-red" name="datasource" fieldValue="all"
                                                    value="true"/>不限
                                        <s:checkbox cssClass="flat-red" name="datasource" fieldValue="华山医院"
                                                    value="false"/>华山医院
                                        <s:checkbox cssClass="flat-red" name="datasource" fieldValue="宣武医院"
                                                    value="false"/>宣武医院
                                        <s:checkbox cssClass="flat-red" name="datasource" fieldValue="ADMI"
                                                    value="false"/>ADMI
                                        <s:checkbox cssClass="flat-red" name="datasource" fieldValue="PPMI"
                                                    value="false"/>PPMI
                                        <s:checkbox cssClass="flat-red" name="datasource" fieldValue="无锡904"
                                                    value="false"/>无锡904
                                        <s:checkbox cssClass="flat-red" name="datasource" fieldValue="其他来源"
                                                    value="false"/>其他来源
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">疾病类型</label>
                                    <div class="col-sm-10">
                                        <s:checkbox cssClass="flat-red" name="jblx" fieldValue="all" value="true"/>不限
                                        <s:checkbox cssClass="flat-red" name="jblx" fieldValue="AD" value="false"/>AD
                                        <s:checkbox cssClass="flat-red" name="jblx" fieldValue="aMCI" value="false"/>aMCI
                                        <s:checkbox cssClass="flat-red" name="jblx" fieldValue="ADMI" value="false"/>ADMI
                                        <s:checkbox cssClass="flat-red" name="jblx" fieldValue="DLB" value="false"/>DLB
                                        <s:checkbox cssClass="flat-red" name="jblx" fieldValue="FAD" value="false"/>FAD
                                        <s:checkbox cssClass="flat-red" name="jblx" fieldValue="FTD" value="false"/>FTD
                                        <s:checkbox cssClass="flat-red" name="jblx" fieldValue="MCI" value="false"/>MCI
                                        <s:checkbox cssClass="flat-red" name="jblx" fieldValue="NC" value="false"/>NC
                                        <s:checkbox cssClass="flat-red" name="jblx" fieldValue="PDD" value="false"/>PDD
                                        <s:checkbox cssClass="flat-red" name="jblx" fieldValue="SCD" value="false"/>SCD
                                        <s:checkbox cssClass="flat-red" name="jblx" fieldValue="svMCI" value="false"/>svMCI
                                        <s:checkbox cssClass="flat-red" name="jblx" fieldValue="VD" value="false"/>VD
                                        <s:checkbox cssClass="flat-red" name="jblx" fieldValue="PD" value="false"/>PD
                                        <s:checkbox cssClass="flat-red" name="jblx" fieldValue="RBD" value="false"/>RBD
                                        <s:checkbox cssClass="flat-red" name="jblx" fieldValue="DX" value="false"/>癫痫
                                        <s:checkbox cssClass="flat-red" name="jblx" fieldValue="JL" value="false"/>焦虑
                                        <s:checkbox cssClass="flat-red" name="jblx" fieldValue="YY" value="false"/>抑郁
                                    </div>
                                </div>

                                    <%--<div class="form-group">--%>
                                    <%--<label class="col-sm-2 control-label">检查日期</label>--%>
                                    <%--<div class="col-sm-10">--%>
                                    <%--<div class="input-group date">--%>
                                    <%--<div class="input-group-addon">--%>
                                    <%--<i class="fa fa-calendar"></i>--%>
                                    <%--</div>--%>
                                    <%--<s:date name="checkdate" format="yyyy-MM-dd" var="checkdate"></s:date>--%>
                                    <%--<s:textfield class="form-control pull-right" name="checkdate" value="%{#checkdate}" type="date"></s:textfield>--%>
                                    <%--</div>--%>
                                    <%--</div>--%>
                                    <%--</div>--%>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">影像模态</label>
                                    <div class="col-sm-10">
                                        <s:checkbox cssClass="flat-red" name="sjlx1" fieldValue="all" value="true"/>不限
                                        <s:checkbox cssClass="flat-red" name="sjlx1" fieldValue="PET" value="false"/>PET
                                        <s:checkbox cssClass="flat-red" name="sjlx1" fieldValue="VMAT" value="false"/>VMAT
                                        <s:checkbox cssClass="flat-red" name="sjlx1" fieldValue="MRI" value="false"/>MRI
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">成像方式</label>
                                    <div class="col-sm-10">
                                        <s:checkbox cssClass="flat-red" name="sjlx2" fieldValue="all" value="true"/>不限
                                        <s:checkbox cssClass="flat-red" name="sjlx2" fieldValue="AV45" value="false"/>AV45
                                        <s:checkbox cssClass="flat-red" name="sjlx2" fieldValue="FDG" value="false"/>FDG
                                        <s:checkbox cssClass="flat-red" name="sjlx2" fieldValue="CFT" value="false"/>CFT
                                        <s:checkbox cssClass="flat-red" name="sjlx2" fieldValue="AV1451" value="false"/>AV1451
                                        <s:checkbox cssClass="flat-red" name="sjlx2" fieldValue="PiB" value="false"/>PiB
                                        <s:checkbox cssClass="flat-red" name="sjlx2" fieldValue="VMAT" value="false"/>VMAT
                                        <s:checkbox cssClass="flat-red" name="sjlx2" fieldValue="dMRI" value="false"/>dMRI
                                        <s:checkbox cssClass="flat-red" name="sjlx2" fieldValue="T1" value="false"/>T1
                                        <s:checkbox cssClass="flat-red" name="sjlx2" fieldValue="T2" value="false"/>T2
                                        <s:checkbox cssClass="flat-red" name="sjlx2" fieldValue="DTI" value="false"/>DTI
                                        <s:checkbox cssClass="flat-red" name="sjlx2" fieldValue="ASL" value="false"/>ASL
                                        <s:checkbox cssClass="flat-red" name="sjlx2" fieldValue="BOLD" value="false"/>BOLD
                                    </div>
                                </div>

                                <div class="box-footer">
                                        <%--<button type="button" class="btn btn-default" onclick="history.go(-1);">返回</button>--%>
                                    <button id="submit" type="submit" class="btn btn-info pull-right btn-danger">搜索
                                    </button>
                                </div>
                            </div>
                        </s:form>
                    </div>

                    <div class="box">
                        <s:form namespace="/" action="downloadAction_downloadPatientPic" id="form2">
                            <div class="box-body table-responsive no-padding">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>姓名</th>
                                        <th>性别</th>
                                        <th>出生日期</th>
                                        <th>数据源</th>
                                        <th>疾病类型</th>
                                        <th>检查日期</th>
                                        <th>影像模态</th>
                                        <th>成像方式</th>
                                        <th>处理前数据</th>
                                        <th>处理后数据</th>
                                        <th>
                                            <input onclick="checkAll()" class="flat-red" id="checkAllsj" type="checkbox"/>全选
                                            <%--<button id="checkAllsj" type="button" class="btn btn-info btn-sm btn-success" onclick="checkAll()">全选</button>--%>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <s:iterator value="list1" status="st">
                                        <tr>
                                            <s:hidden name="pid" value="%{#list1.get(#st.index)[0]}"></s:hidden>
                                            <td><s:property value="#list1.get(#st.index)[1]"></s:property></td>
                                            <td><s:property value="#list1.get(#st.index)[2]"></s:property></td>
                                            <%--<td><s:property value="%{#list1.get(#st.index)[3] == 'm' ? '男' : '女'}"></s:property></td>--%>
                                            <td><s:property value="#list1.get(#st.index)[3]"></s:property></td>
                                            <td><s:date name="#list1.get(#st.index)[4]"
                                                        format="yyyy-MM-dd"></s:date></td>
                                            <td><s:property value="#list1.get(#st.index)[5]"></s:property></td>
                                            <td><s:property value="#list1.get(#st.index)[6]"></s:property></td>
                                            <td><s:date name="#list1.get(#st.index)[7]"
                                                        format="yyyy-MM-dd"></s:date></td>
                                            <td><s:property value="#list1.get(#st.index)[8]"></s:property></td>
                                            <td><s:property value="#list1.get(#st.index)[9]"></s:property></td>

                                            <td><s:property value="#list1.get(#st.index)[10]"></s:property></td>
                                                <%--<td><s:checkbox id="clqsj" name="clqsj"--%>
                                                <%--fieldValue="%{#list1.get(#st.index)[10]}"></s:checkbox></td>--%>
                                            <td><s:property value="#list1.get(#st.index)[11]"></s:property></td>
                                            <td><s:checkbox id="alltid" name="tid" cssClass="flat-red"
                                                            fieldValue="%{#list1.get(#st.index)[12]}"></s:checkbox></td>
                                            <td><s:hidden value="#list1.get(#st.index)[12]"></s:hidden></td>
                                                <%--<s:hidden name="tid" value="%{#list1.get(#st.index)[12]}"></s:hidden>--%>
                                        </tr>
                                    </s:iterator>
                                    </tbody>
                                </table>
                            </div>

                            <div class="box-footer">
                                <button id="btn" type="submit" class="btn btn-info pull-right btn-danger">下载选中项
                                </button>
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
