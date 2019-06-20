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


        function showFDG() {
            //document.getElementById("PET").style.display = "none";
            document.getElementById("FDG").style.display = "block";
            document.getElementById("CFT").style.display = "none";
            document.getElementById("VMAT").style.display = "none";
            document.getElementById("TAU").style.display = "none";
            document.getElementById("MRI").style.display = "none";
            document.getElementById("title1").innerText = "FDG数据";

        }

        function showCFT() {
            //document.getElementById("PET").style.display = "none";
            document.getElementById("FDG").style.display = "none";
            document.getElementById("CFT").style.display = "block";
            document.getElementById("VMAT").style.display = "none";
            document.getElementById("TAU").style.display = "none";
            document.getElementById("MRI").style.display = "none";

            document.getElementById("title1").innerText = "CFT数据";

        }

        function showVMAT() {
            //document.getElementById("PET").style.display = "none";
            document.getElementById("FDG").style.display = "none";
            document.getElementById("CFT").style.display = "none";
            document.getElementById("VMAT").style.display = "block";
            document.getElementById("TAU").style.display = "none";
            document.getElementById("MRI").style.display = "none";

            document.getElementById("title1").innerText = "VMAT数据";

        }

        function showTAU() {
            //document.getElementById("PET").style.display = "none";
            document.getElementById("FDG").style.display = "none";
            document.getElementById("CFT").style.display = "none";
            document.getElementById("VMAT").style.display = "none";
            document.getElementById("TAU").style.display = "block";
            document.getElementById("MRI").style.display = "none";

            document.getElementById("title1").innerText = "TAU数据";

        }

        function showMRI() {
            //document.getElementById("PET").style.display = "none";
            document.getElementById("FDG").style.display = "none";
            document.getElementById("CFT").style.display = "none";
            document.getElementById("VMAT").style.display = "none";
            document.getElementById("TAU").style.display = "none";
            document.getElementById("MRI").style.display = "block";

            document.getElementById("title1").innerText = "MRI数据";

        }
    </script>
</head>
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

            <div class="bg-primary">
                <form
                        action="${pageContext.request.contextPath}/servlet/searchMoreServlet"
                        method="post">
                    姓名：<input type="text" name="name" class="xingming"> &nbsp;
                    &nbsp;身份证号：<input type="text" name="IDcard" class="IDcard">
                    &nbsp; &nbsp;性别：男<input type="radio" name="sex" value="男">
                    女<input type="radio" name="sex" value="女"> &nbsp; &nbsp;
                    年龄范围：<input type="text" name="nianling1" class="xingming">---<input
                        type="text" name="nianling2" class="xingming">&nbsp;
                    &nbsp; <input type="submit" value="搜索" class="btn btn-default"><br>
                </form>
            </div>

            <div>
                <span> <a class="btn btn-default"
                          href="${pageContext.request.contextPath}/patientAction_findAllPatients.action">显示全部</a></span>
                <%--<span> <a class="btn btn-default" href="${pageContext.request.contextPath}/database/addPatient.jsp">添加患者</a></span>--%>
                <span> <a class="btn btn-default"
                          href="${pageContext.request.contextPath}/patientAction_addPatientjsp.action">添加患者</a></span>
                <span> <a class="btn btn-default" href="">多条件搜索</a></span>

            </div>
        </div>

        <div class="table-responsive" style="width:40%;float:left; ">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <td>ID编号</td>
                    <td>姓名</td>
                    <td>性别</td>
                    <td>出生日期</td>
                    <td>受教育程度</td>
                    <td>数据源</td>
                    <td>编辑</td>
                    <td>删除</td>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="#allPatients">
                    <td><s:a namespace="/" action="patientAction_findPatientAll"><s:param name="pid" value="pid"></s:param><s:property value="ppid"/></s:a></td>
                    <td><s:property value="pname"/></td>
                    <td><s:property value="sex"/></td>
                    <td><s:date name="birthday" format="yyyy-MM-dd"></s:date></td>
                    <td><s:property value="xueli"/></td>
                    <td><s:property value="datasource"/></td>
                    <td><s:a namespace="/" action="patientAction_findPatientByPid">
                        <s:param name="pid" value="pid"></s:param>
                        编辑
                        </s:a>
                    </td>
                    <td><a
                            href="javascript:delPatient('${patient.ID }','${patient.name }')">删除</a></td>
                    </tr>
                </s:iterator>
                </tbody>
            </table>
            <div align="center">
                <ul class="pagination">
                    <li><a
                            href="${pageContext.request.contextPath }/servlet/pageServlet?currentPage=${pb.currentPage==1?1:pb.currentPage-1}">上一页</a>
                    </li>
                    <li><a>第${pb.currentPage }页/共${pb.totalPage }页</a></li>
                    <li><a
                            href="${pageContext.request.contextPath }/servlet/pageServlet?currentPage=${pb.currentPage==pb.totalPage?pb.totalPage:pb.currentPage+1}">下一页</a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="table-responsive" style="width:60%;float:right;">
            <div>
                ID编号：<s:iterator value="#patientAll"><s:property value="ppid"></s:property></s:iterator>
            </div>

            <%--ID号：--%>
            <%--<c:forEach items="${patientAll }" var="patientall">--%>
                <%--${patientall.ID }--%>
            <%--</c:forEach>--%>
            <%--<br> 姓名：--%>
            <%--<c:forEach items="${patientAll }" var="patientall">--%>
                <%--${patientall.name }--%>
            <%--</c:forEach>--%>
            <%--<br> 性别：--%>
            <%--<c:forEach items="${patientAll }" var="patientall">--%>
                <%--${patientall.sex }--%>
            <%--</c:forEach>--%>
            <%--<br> 出生日期：--%>
            <%--<c:forEach items="${patientAll }" var="patientall">--%>
                <%--${patientall.birthday }--%>
            <%--</c:forEach>--%>
            <%--<br> 身份证号：--%>
            <%--<c:forEach items="${patientAll }" var="patientall">--%>
                <%--${patientall.IDcard }--%>
            <%--</c:forEach>--%>
            <%--<br> PET号：--%>
            <%--<c:forEach items="${patientAll }" var="patientall">--%>
                <%--${patientall.PETnum }--%>
            <%--</c:forEach>--%>
            <%--<br>--%>

            <hr>
            <div>
                <!-- 选项 -->
                <div>
                    <!-- <button onclick=showPET()>PET数据</button> -->
                    <button onclick=showFDG() class="btn btn-default">FDG数据</button>
                    <button onclick=showCFT() class="btn btn-default">CFT数据</button>
                    <button onclick=showVMAT() class="btn btn-default">VMAT数据</button>
                    <button onclick=showTAU() class="btn btn-default">TAU数据</button>
                    <button onclick=showMRI() class="btn btn-default">MRI数据</button>
                    <%-- <a
                        href="${pageContext.request.contextPath }/database/addPatientData.jsp?ID=<%=request.getParameter("ID") %>">上传</a> --%>
                    <hr>
                    <h4 id="title1">FDG数据</h4>
                    <hr>
                </div>

                <%-- 	<div id="PET" style="display: block">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>PET号</th>
                                <th>检查日期</th>
                                <th>FDG数据</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${patientAll }" var="patientall" begin="1">
                                <tr>
                                    <td>${patientall.PETnumber }</td>
                                    <td>${patientall.FDGDate }</td>
                                    <td>${patientall.FDGpic}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div> --%>


                <div id="FDG" style="display: block">
                    <form
                            action="${pageContext.request.contextPath}/servlet/addPatientDataServlet?ID=<%=request.getParameter("ID") %>"
                            method="post" enctype="multipart/form-data">
                        <table class="table table-striped" style="table-layout: fixed;">
                            <thead>
                            <tr>
                                <th style="width: 180px">检查日期</th>
                                <th style="width: 250px">FDG数据</th>
                                <th style="width: 250px">处理后数据</th>
                                <th style="width: 100px">操作</th>
                            </tr>
                            <tr>
                                <td style="width: 180px"><input type="date" size="8"
                                                                name="FDGDate"></td>
                                <td style="width: 250px"><input type="file" size="5"
                                                                name="FDGpic"></td>
                                <td style="width: 250px"><input type="file" size="5"
                                                                name="FDGclh"></td>
                                <td style="width: 100px"><input type="submit" value="上传"
                                                                class="btn btn-default"></td>
                            </tr>
                            </thead>
                        </table>
                    </form>

                    <table class="table table-striped" style="table-layout: fixed;">
                        <c:forEach items="${patientAll }" var="patientall" begin="1"
                                   step="1">
                            <form
                                    action="${pageContext.request.contextPath }/servlet/addPatientClhServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.FDGDate }&leixing=FDGDate&shuju=FDGclh"
                                    method="post" enctype="multipart/form-data">
                                <tbody>
                                <c:if test="${! empty patientall.FDGDate}">
                                    <tr>
                                        <td style="width: 180px">${patientall.FDGDate }</td>
                                        <td style="width: 250px"><a
                                                href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.FDGDate }&leixing=FDGDate&pic=${patientall.FDGpic }&shuju=FDGpic">${patientall.FDGpic}</a>
                                        </td>

                                        <td style="width: 250px"><c:if
                                                test="${empty patientall.FDGclh }">
                                            <input type="file" size="5" name="FDGclh">
                                        </c:if> <a
                                                href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.FDGDate }&leixing=FDGDate&pic=${patientall.FDGclh }&shuju=FDGclh">${patientall.FDGclh}</a>
                                        </td>
                                            <%-- <td>
                                                <a href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.FDGDate }&leixing=FDGDate&pic=${patientall.FDGclh }">${patientall.FDGclh}</a></td>
                                                 --%>
                                        <td style="width: 100px"><c:if
                                                test="${empty patientall.FDGpic || empty patientall.FDGclh}">
                                            <input class="btn btn-default" type="submit" value="上传">
                                        </c:if></td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </form>
                        </c:forEach>
                    </table>
                </div>


                <div id="CFT" style="display: none">
                    <form
                            action="${pageContext.request.contextPath}/servlet/addPatientDataServlet?ID=<%=request.getParameter("ID") %>"
                            method="post" enctype="multipart/form-data">
                        <table class="table table-striped" style="table-layout: fixed;">
                            <thead>
                            <tr>
                                <th style="width: 180px">检查日期</th>
                                <th style="width: 250px">CFT数据</th>
                                <th style="width: 250px">处理后数据</th>
                                <th style="width: 100px">操作</th>
                            </tr>
                            <tr>
                                <td style="width: 180px"><input type="date" size="8"
                                                                name="CFTDate"></td>
                                <td style="width: 250px"><input type="file" size="5"
                                                                name="CFTpic"></td>
                                <td style="width: 250px"><input type="file" size="5"
                                                                name="CFTclh"></td>
                                <td style="width: 100px"><input type="submit" value="上传"
                                                                class="btn btn-default"></td>
                            </tr>
                            </thead>
                        </table>
                    </form>

                    <table class="table table-striped" style="table-layout: fixed;">
                        <c:forEach items="${patientAll }" var="patientall" begin="1"
                                   step="1">
                            <form
                                    action="${pageContext.request.contextPath }/servlet/addPatientClhServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.CFTDate }&leixing=CFTDate&shuju=CFTclh"
                                    method="post" enctype="multipart/form-data">
                                <tbody>
                                <c:if test="${! empty patientall.CFTDate}">
                                    <tr>
                                        <td style="width: 180px">${patientall.CFTDate }</td>
                                        <td style="width: 250px"><a
                                                href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.CFTDate }&leixing=CFTDate&pic=${patientall.CFTpic }&shuju=CFTpic">${patientall.CFTpic}</a>
                                        </td>

                                        <td style="width: 250px"><c:if
                                                test="${empty patientall.CFTclh }">
                                            <input type="file" size="5" name="CFTclh">
                                        </c:if> <a
                                                href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.CFTDate }&leixing=FDGDate&pic=${patientall.CFTclh }&shuju=CFTclh">${patientall.CFTclh}</a>
                                        </td>
                                        <td style="width: 100px"><c:if
                                                test="${empty patientall.CFTpic || empty patientall.CFTclh}">
                                            <input class="btn btn-default" type="submit" value="上传">
                                        </c:if></td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </form>
                        </c:forEach>
                    </table>
                </div>


                <div id="VMAT" style="display: none">
                    <form
                            action="${pageContext.request.contextPath}/servlet/addPatientDataServlet?ID=<%=request.getParameter("ID") %>"
                            method="post" enctype="multipart/form-data">
                        <table class="table table-striped" style="table-layout: fixed;">
                            <thead>
                            <tr>
                                <th style="width: 180px">检查日期</th>
                                <th style="width: 250px">VMAT数据</th>
                                <th style="width: 250px">处理后数据</th>
                                <th style="width: 100px">操作</th>
                            </tr>
                            <tr>
                                <td style="width: 180px"><input type="date" size="8"
                                                                name="VMATDate"></td>
                                <td style="width: 250px"><input type="file" size="5"
                                                                name="VMATpic"></td>
                                <td style="width: 250px"><input type="file" size="5"
                                                                name="VMATclh"></td>
                                <td style="width: 100px"><input type="submit" value="上传"
                                                                class="btn btn-default"></td>
                            </tr>
                            </thead>
                        </table>
                    </form>

                    <table class="table table-striped" style="table-layout: fixed;">
                        <c:forEach items="${patientAll }" var="patientall" begin="1"
                                   step="1">
                            <form
                                    action="${pageContext.request.contextPath }/servlet/addPatientClhServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.VMATDate }&leixing=VMATDate&shuju=VMATclh"
                                    method="post" enctype="multipart/form-data">
                                <tbody>
                                <c:if test="${! empty patientall.VMATDate}">
                                    <tr>
                                        <td style="width: 180px">${patientall.VMATDate }</td>
                                        <td style="width: 250px"><a
                                                href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.VMATDate }&leixing=VMATDate&pic=${patientall.VMATpic }&shuju=VMATpic">${patientall.VMATpic}</a>
                                        </td>

                                        <td style="width: 250px"><c:if
                                                test="${empty patientall.VMATclh }">
                                            <input type="file" size="5" name="VMATclh">
                                        </c:if> <a
                                                href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.VMATDate }&leixing=VMATDate&pic=${patientall.VMATclh }&shuju=VMATclh">${patientall.VMATclh}</a>
                                        </td>
                                        <td style="width: 100px"><c:if
                                                test="${empty patientall.VMATpic || empty patientall.VMATclh}">
                                            <input class="btn btn-default" type="submit" value="上传">
                                        </c:if></td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </form>
                        </c:forEach>
                    </table>
                </div>


                <div id="TAU" style="display: none">
                    <form
                            action="${pageContext.request.contextPath}/servlet/addPatientDataServlet?ID=<%=request.getParameter("ID") %>"
                            method="post" enctype="multipart/form-data">
                        <table class="table table-striped" style="table-layout: fixed;">
                            <thead>
                            <tr>
                                <th style="width: 180px">检查日期</th>
                                <th style="width: 250px">TAU数据</th>
                                <th style="width: 250px">处理后数据</th>
                                <th style="width: 100px">操作</th>
                            </tr>
                            <tr>
                                <td style="width: 180px"><input type="date" size="8"
                                                                name="TAUDate"></td>
                                <td style="width: 250px"><input type="file" size="5"
                                                                name="TAUpic"></td>
                                <td style="width: 250px"><input type="file" size="5"
                                                                name="TAUclh"></td>
                                <td style="width: 100px"><input type="submit" value="上传"
                                                                class="btn btn-default"></td>
                            </tr>
                            </thead>
                        </table>
                    </form>

                    <table class="table table-striped" style="table-layout: fixed;">
                        <c:forEach items="${patientAll }" var="patientall" begin="1"
                                   step="1">
                            <form
                                    action="${pageContext.request.contextPath }/servlet/addPatientClhServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.TAUDate }&leixing=TAUDate&shuju=TAUclh"
                                    method="post" enctype="multipart/form-data">
                                <tbody>
                                <c:if test="${! empty patientall.TAUDate}">
                                    <tr>
                                        <td style="width: 180px">${patientall.TAUDate }</td>
                                        <td style="width: 250px"><a
                                                href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.TAUDate }&leixing=TAUDate&pic=${patientall.TAUpic }&shuju=TAUpic">${patientall.TAUpic}</a>
                                        </td>

                                        <td style="width: 250px"><c:if
                                                test="${empty patientall.TAUclh }">
                                            <input type="file" size="5" name="TAUclh">
                                        </c:if> <a
                                                href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.TAUDate }&leixing=TAUDate&pic=${patientall.TAUclh }&shuju=TAUclh">${patientall.TAUclh}</a>
                                        </td>
                                        <td style="width: 100px"><c:if
                                                test="${empty patientall.TAUpic || empty patientall.TAUclh}">
                                            <input class="btn btn-default" type="submit" value="上传">
                                        </c:if></td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </form>
                        </c:forEach>
                    </table>
                </div>

                <%-- <div id="CFT" style="display: none">
                    <form
                        action="${pageContext.request.contextPath}/servlet/addPatientDataServlet?ID=<%=request.getParameter("ID") %>"
                        method="post" enctype="multipart/form-data">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>检查日期</th>
                                    <th>CFT数据</th>
                                    <th>处理后数据</th>
                                    <th>操作</th>
                                </tr>
                                <tr>
                                    <td><input type="date" size="8" name="CFTDate"></td>
                                    <td><input type="file" size="5" name="CFTpic"></td>
                                    <td><input type="file" size="5" name="CFTclh"></td>
                                    <td><input type="submit" value="上传"
                                        class="btn btn-default"></td>
                                </tr>
                            </thead>
                        </table>
                    </form>

                    <form
                        action="${pageContext.request.contextPath}/servlet/addPatientDataServlet?ID=<%=request.getParameter("ID") %>"
                        method="post" enctype="multipart/form-data">

                        <table>
                            <tbody>
                                <c:forEach items="${patientAll }" var="patientall" begin="1">
                                    <c:if test="${! empty patientall.CFTDate}">
                                        <tr>
                                            <td>${patientall.CFTDate }</td>
                                            <td><a
                                                href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.CFTDate }&leixing=CFTDate&pic=${patientall.CFTpic }">${patientall.CFTpic }</a></td>
                                            <td><a
                                                href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.CFTDate }&leixing=CFTDate&pic=${patientall.CFTclh }">${patientall.CFTclh }</a></td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>
                    </form>
                </div> --%>

                <%-- <div id="VMAT" style="display: none">
                    <form
                        action="${pageContext.request.contextPath}/servlet/addPatientDataServlet?ID=<%=request.getParameter("ID") %>"
                        method="post" enctype="multipart/form-data">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>检查日期</th>
                                    <th>VMAT数据</th>
                                    <th>处理后数据</th>
                                    <th>操作</th>
                                </tr>
                                <tr>
                                    <td><input type="date" size="8" name="VMATDate"></td>
                                    <td><input type="file" size="5" name="VMATpic"></td>
                                    <td><input type="file" size="5" name="VMATclh"></td>
                                    <td><input type="submit" value="上传"
                                        class="btn btn-default"></td>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${patientAll }" var="patientall" begin="1">
                                    <c:if test="${! empty patientall.VMATDate}">
                                        <tr>
                                            <td>${patientall.VMATDate }</td>
                                            <td><a
                                                href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.VMATDate }&leixing=FDGDate&pic=${patientall.VMATpic }">${patientall.VMATpic }</a></td>
                                            <td><a
                                                href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.VMATDate }&leixing=FDGDate&pic=${patientall.VMATclh }">${patientall.VMATclh }</a></td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>
                    </form>
                </div>

                <div id="TAU" style="display: none">
                    <form
                        action="${pageContext.request.contextPath}/servlet/addPatientDataServlet?ID=<%=request.getParameter("ID") %>"
                        method="post" enctype="multipart/form-data">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>检查日期</th>
                                    <th>TAU数据</th>
                                    <th>处理后数据</th>
                                    <th>操作</th>
                                </tr>
                                <tr>
                                    <td><input type="date" size="8" name="TAUDate"></td>
                                    <td><input type="file" size="5" name="TAUpic"></td>
                                    <td><input type="file" size="5" name="TAUclh"></td>
                                    <td><input type="submit" value="上传"
                                        class="btn btn-default"></td>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${patientAll }" var="patientall" begin="1">
                                    <c:if test="${! empty patientall.TAUDate}">
                                        <tr>
                                            <td>${patientall.TAUDate }</td>
                                            <td><a
                                                href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.TAUDate }&leixing=TAUDate&pic=${patientall.TAUpic }">${patientall.TAUpic }</a></td>
                                            <td><a
                                                href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.TAUDate }&leixing=TAUDate&pic=${patientall.TAUclh }">${patientall.TAUclh }</a></td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>
                    </form>
                </div> --%>

                <div id="MRI" style="display: none">
                    <form
                            action="${pageContext.request.contextPath}/servlet/addPatientDataServlet?ID=<%=request.getParameter("ID") %>&leixing=MRIdate"
                            method="post" enctype="multipart/form-data">
                        <table class="table table-striped" style="table-layout: fixed;">
                            <thead>
                            <tr>
                                <th style="width: 180px">检查日期</th>
                                <th style="width: 250px">T1数据</th>
                                <th style="width: 250px">处理后T1</th>
                                <th style="width: 250px">T2数据</th>
                                <th style="width: 250px">处理后T2</th>
                                <th style="width: 250px">ASL数据</th>
                                <th style="width: 250px">处理后ASL</th>
                                <th style="width: 250px">BOLD数据</th>
                                <th style="width: 250px">处理后BOLD</th>
                                <th style="width: 250px">DTI数据</th>
                                <th style="width: 250px">处理后DTI</th>
                                <th style="width: 100px">检查前诊断</th>
                                <th style="width: 100px">最终诊断</th>
                                <th style="width: 100px">UPDRS总</th>
                                <th style="width: 100px">HY</th>
                                <th style="width: 100px">身高</th>
                                <th style="width: 100px">体重</th>
                                <th style="width: 100px">血糖</th>
                                <th style="width: 100px">起病时间</th>
                                <th style="width: 100px">病程/月</th>
                                <th style="width: 100px">起病肢体</th>
                                <th style="width: 100px">DM史</th>
                                <th style="width: 100px">备注</th>
                                <th style="width: 100px">操作</th>
                            </tr>
                            <tr>
                                <td style="width: 180px"><input type="date" size="8" name="MRIDate"></td>
                                <td style="width: 250px"><input type="file" size="5" name="xlT1"></td>
                                <td style="width: 250px"><input type="file" size="5" name="xlT1clh"></td>
                                <td style="width: 250px"><input type="file" size="5" name="xlT2"></td>
                                <td style="width: 250px"><input type="file" size="5" name="xlT2clh"></td>
                                <td style="width: 250px"><input type="file" size="5" name="xlASL"></td>
                                <td style="width: 250px"><input type="file" size="5" name="xlASLclh"></td>
                                <td style="width: 250px"><input type="file" size="5" name="xlBOLD"></td>
                                <td style="width: 250px"><input type="file" size="5" name="xlBOLDclh"></td>
                                <td style="width: 250px"><input type="file" size="5" name="xlDTI"></td>
                                <td style="width: 250px"><input type="file" size="5" name="xlDTIclh"></td>
                                <td style="width: 100px"><input type="text" size="5" name="jcqzd"></td>
                                <td style="width: 100px"><input type="text" size="5" name="zdlczd"></td>
                                <td style="width: 100px"><input type="text" size="5" name="UPDRS"></td>
                                <td style="width: 100px"><input type="text" size="5" name="HY"></td>
                                <td style="width: 100px"><input type="text" size="5" name="height"></td>
                                <td style="width: 100px"><input type="text" size="5" name="weight"></td>
                                <td style="width: 100px"><input type="text" size="5" name="xuetang"></td>
                                <td style="width: 100px"><input type="text" size="5" name="qibingsj"></td>
                                <td style="width: 100px"><input type="text" size="5" name="bingcheng"></td>
                                <td style="width: 100px"><input type="text" size="5" name="qibingzhiti"></td>
                                <td style="width: 100px"><input type="text" size="5" name="DM"></td>
                                <td style="width: 100px"><input type="text" size="5" name="beizhu"></td>
                                <td style="width: 100px"><input type="submit" value="上传" class="btn btn-default"></td>
                            </tr>
                            </thead>
                        </table>
                    </form>

                    <table class="table table-striped" style="table-layout: fixed;">
                        <c:forEach items="${patientAll }" var="patientall" begin="1"
                                   step="1">
                            <form
                                    action="${pageContext.request.contextPath }/servlet/addPatientMRIClhServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.MRIDate }&leixing=MRIDate"
                                    method="post" enctype="multipart/form-data">
                                <tbody>
                                <c:if test="${! empty patientall.MRIDate}">
                                    <tr>
                                        <td style="width: 180px">${patientall.MRIDate }</td>
                                        <!-- 目前需要上传处理后数据 -->
                                        <td style="width: 250px">
                                            <c:if test="${empty patientall.xlT1 }">
                                                <input type="file" size="5" name="xlT1">
                                            </c:if>
                                            <a href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.MRIDate }&leixing=MRIDate&pic=${patientall.xlT1 }&shuju=xlT1">${patientall.xlT1}</a>
                                        </td>

                                        <td style="width: 250px">
                                            <c:if test="${empty patientall.xlT1clh }">
                                                <input type="file" size="5" name="xlT1clh">
                                            </c:if>
                                            <a href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.MRIDate }&leixing=MRIDate&pic=${patientall.xlT1clh }&shuju=xlT1clh">${patientall.xlT1clh}</a>
                                        </td>

                                        <td style="width: 250px">
                                            <c:if test="${empty patientall.xlT2 }">
                                                <input type="file" size="5" name="xlT2">
                                            </c:if>
                                            <a href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.MRIDate }&leixing=MRIDate&pic=${patientall.xlT2 }&shuju=xlT2">${patientall.xlT2}</a>
                                        </td>

                                        <td style="width: 250px">
                                            <c:if test="${empty patientall.xlT2clh }">
                                                <input type="file" size="5" name="xlT2clh">
                                            </c:if>
                                            <a href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.MRIDate }&leixing=MRIDate&pic=${patientall.xlT2clh }&shuju=xlT2clh">${patientall.xlT2clh}</a>
                                        </td>

                                        <td style="width: 250px">
                                            <c:if test="${empty patientall.xlASL }">
                                                <input type="file" size="5" name="xlASL">
                                            </c:if>
                                            <a href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.MRIDate }&leixing=MRIDate&pic=${patientall.xlASL }&shuju=xlASL">${patientall.xlASL}</a>
                                        </td>

                                        <td style="width: 250px">
                                            <c:if test="${empty patientall.xlASLclh }">
                                                <input type="file" size="5" name="xlASLclh">
                                            </c:if>
                                            <a href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.MRIDate }&leixing=MRIDate&pic=${patientall.xlASLclh }&shuju=xlASLclh">${patientall.xlASLclh}</a>
                                        </td>

                                        <td style="width: 250px">
                                            <c:if test="${empty patientall.xlBOLD }">
                                                <input type="file" size="5" name="xlBOLD">
                                            </c:if>
                                            <a href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.MRIDate }&leixing=MRIDate&pic=${patientall.xlBOLD }&shuju=xlBOLD">${patientall.xlBOLD}</a>
                                        </td>

                                        <td style="width: 250px">
                                            <c:if test="${empty patientall.xlBOLDclh }">
                                                <input type="file" size="5" name="xlBOLDclh">
                                            </c:if>
                                            <a href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.MRIDate }&leixing=MRIDate&pic=${patientall.xlBOLDclh }&shuju=xlBOLDclh">${patientall.xlBOLDclh}</a>
                                        </td>

                                        <td style="width: 250px">
                                            <c:if test="${empty patientall.xlDTI }">
                                                <input type="file" size="5" name="xlDTI">
                                            </c:if>
                                            <a href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.MRIDate }&leixing=MRIDate&pic=${patientall.xlDTI }&shuju=xlDTI">${patientall.xlDTI}</a>
                                        </td>

                                        <td style="width: 250px">
                                            <c:if test="${empty patientall.xlDTIclh }">
                                                <input type="file" size="5" name="xlDTIclh">
                                            </c:if>
                                            <a href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.MRIDate }&leixing=MRIDate&pic=${patientall.xlDTIclh }&shuju=xlDTIclh">${patientall.xlDTIclh}</a>
                                        </td>

                                        <td style="width: 100px">
                                            <c:if test="${empty patientall.jcqzd }">
                                                <input type="text" size="5" name="jcqzd">
                                            </c:if>
                                            <a href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.MRIDate }&leixing=MRIDate&pic=readme.txt&shuju=jcqzd">${patientall.jcqzd}</a>
                                        </td>

                                        <td style="width: 100px">
                                            <c:if test="${empty patientall.zdlczd }">
                                                <input type="text" size="5" name="zdlczd">
                                            </c:if>
                                            <a href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.MRIDate }&leixing=MRIDate&pic=readme.txt&shuju=zdlczd">${patientall.zdlczd}</a>
                                        </td>

                                        <td style="width: 100px">
                                            <c:if test="${empty patientall.UPDRS }">
                                                <input type="text" size="5" name="UPDRS">
                                            </c:if>
                                            <a href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.MRIDate }&leixing=MRIDate&pic=readme.txt&shuju=UPDRS">${patientall.UPDRS}</a>
                                        </td>

                                        <td style="width: 100px">
                                            <c:if test="${empty patientall.HY }">
                                                <input type="text" size="5" name="HY">
                                            </c:if>
                                            <a href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.MRIDate }&leixing=MRIDate&pic=readme.txt&shuju=HY">${patientall.HY}</a>
                                        </td>

                                        <td style="width: 100px">
                                            <c:if test="${empty patientall.height }">
                                                <input type="text" size="5" name="height">
                                            </c:if>
                                            <a href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.MRIDate }&leixing=MRIDate&pic=readme.txt&shuju=height">${patientall.height}</a>
                                        </td>

                                        <td style="width: 100px">
                                            <c:if test="${empty patientall.weight }">
                                                <input type="text" size="5" name="weight">
                                            </c:if>
                                            <a href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.MRIDate }&leixing=MRIDate&pic=readme.txt&shuju=weight">${patientall.weight}</a>
                                        </td>

                                        <td style="width: 100px">
                                            <c:if test="${empty patientall.xuetang }">
                                                <input type="text" size="5" name="xuetang">
                                            </c:if>
                                            <a href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.MRIDate }&leixing=MRIDate&pic=readme.txt&shuju=xuetang">${patientall.xuetang}</a>
                                        </td>

                                        <td style="width: 100px">
                                            <c:if test="${empty patientall.qibingsj }">
                                                <input type="text" size="5" name="qibingsj">
                                            </c:if>
                                            <a href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.MRIDate }&leixing=MRIDate&pic=readme.txt&shuju=qibingsj">${patientall.qibingsj}</a>
                                        </td>

                                        <td style="width: 100px">
                                            <c:if test="${empty patientall.bingcheng }">
                                                <input type="text" size="5" name="bingcheng">
                                            </c:if>
                                            <a href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.MRIDate }&leixing=MRIDate&pic=readme.txt&shuju=bingcheng">${patientall.bingcheng}</a>
                                        </td>

                                        <td style="width: 100px">
                                            <c:if test="${empty patientall.qibingzhiti }">
                                                <input type="text" size="5" name="qibingzhiti">
                                            </c:if>
                                            <a href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.MRIDate }&leixing=MRIDate&pic=readme.txt&shuju=qibingzhiti">${patientall.qibingzhiti}</a>
                                        </td>

                                        <td style="width: 100px">
                                            <c:if test="${empty patientall.DM }">
                                                <input type="text" size="5" name="DM">
                                            </c:if>
                                            <a href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.MRIDate }&leixing=MRIDate&pic=readme.txt&shuju=DM">${patientall.DM}</a>
                                        </td>

                                        <td style="width: 100px">
                                            <c:if test="${empty patientall.beizhu }">
                                                <input type="text" size="5" name="beizhu">
                                            </c:if>
                                            <a href="${pageContext.request.contextPath }/servlet/downloadServlet?ID=<%=request.getParameter("ID")%>&date=${patientall.MRIDate }&leixing=MRIDate&pic=$readme.txt&shuju=beizhu">${patientall.beizhu}</a>
                                        </td>

                                        <td style="width: 100px">
                                            <c:if test="${empty patientall.xlT1 ||empty patientall.xlT1clh ||empty patientall.xlT2 ||empty patientall.xlT2clh ||empty patientall.xlASL ||empty patientall.xlASLclh ||empty patientall.xlBOLD ||empty patientall.xlBOLDclh ||empty patientall.xlDTI ||empty patientall.xlDTIclh ||empty patientall.jcqzd || empty patientall.zdlczd || empty patientall.UPDRS|| empty patientall.HY || empty patientall.height|| empty patientall.weight|| empty patientall.xuetang|| empty patientall.qibingsj || empty patientall.bingcheng || empty patientall.qibingzhiti || empty patientall.DM || empty patientall.beizhu}">
                                                <input class="btn btn-default" type="submit" value="上传">
                                            </c:if>
                                        </td>

                                    </tr>
                                </c:if>
                                </tbody>
                            </form>
                        </c:forEach>
                    </table>
                </div>

                <%-- 					<form
                                        action="${pageContext.request.contextPath}/servlet/addPatientDataServlet?ID=<%=request.getParameter("ID") %>"
                                        method="post" enctype="multipart/form-data">

                                        <div id="MRI" style="display: none">
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>检查日期</th>
                                                        <th>T1</th>
                                                        <th>T2</th>
                                                        <th>ASL</th>
                                                        <th>BOLD</th>
                                                        <th>DTI</th>
                                                        <th>检查前诊断</th>
                                                        <th>最终诊断</th>
                                                        <th>UPDRS总</th>
                                                        <th>HY</th>
                                                        <th>身高</th>
                                                        <th>体重</th>
                                                        <th>血糖</th>
                                                        <th>起病时间</th>
                                                        <th>病程/月</th>
                                                        <th>起病肢体</th>
                                                        <th>DM史</th>
                                                        <th>备注</th>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="date" size="8" name="MRIDate"></td>
                                                        <td><input type="file" size="5" name="xlT1"></td>
                                                        <td><input type="file" size="5" name="xlT2"></td>
                                                        <td><input type="file" size="5" name="xlASL"></td>
                                                        <td><input type="file" size="5" name="xlBOLD"></td>
                                                        <td><input type="file" size="5" name="xlDTI"></td>
                                                        <td><input type="text" size="5" name="jcqzd"></td>
                                                        <td><input type="text" size="5" name="zdlczd"></td>
                                                        <td><input type="text" size="5" name="UPDRS"></td>
                                                        <td><input type="text" size="5" name="HY"></td>
                                                        <td><input type="text" size="5" name="height"></td>
                                                        <td><input type="text" size="5" name="weight"></td>
                                                        <td><input type="text" size="5" name="xuetang"></td>
                                                        <td><input type="text" size="5" name="qibingsj"></td>
                                                        <td><input type="text" size="5" name="bingcheng"></td>
                                                        <td><input type="text" size="5" name="qibingzhiti"></td>
                                                        <td><input type="text" size="5" name="DM"></td>
                                                        <td><input type="text" size="5" name="beizhu"></td>
                                                        <td><input type="submit" value="上传"
                                                            class="btn btn-default"></td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${patientAll }" var="patientall" begin="1">
                                                        <c:if test="${! empty patientall.MRIDate}">
                                                            <tr>
                                                                <td>${patientall.MRIDate }</td>
                                                                <td>${patientall.xlT1}</td>
                                                                <td>${patientall.xlT2}</td>
                                                                <td>${patientall.xlASL}</td>
                                                                <td>${patientall.xlBOLD}</td>
                                                                <td>${patientall.xlDTI}</td>
                                                                <td>${patientall.jcqzd}</td>
                                                                <td>${patientall.zdlczd}</td>
                                                                <td>${patientall.UPDRS}</td>
                                                                <td>${patientall.height}</td>
                                                                <td>${patientall.weight}</td>
                                                                <td>${patientall.xuetang}</td>
                                                                <td>${patientall.qibingsj}</td>
                                                                <td>${patientall.bingcheng}</td>
                                                                <td>${patientall.qibingzhiti}</td>
                                                                <td>${patientall.DM}</td>
                                                                <td>${patientall.beizhu}</td>
                                                            </tr>
                                                        </c:if>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </form> --%>

            </div>
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