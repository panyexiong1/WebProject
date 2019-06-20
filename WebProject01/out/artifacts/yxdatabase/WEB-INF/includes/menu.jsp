<%@ page import="com.shu.user.domain.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    User user = (User) request.getSession().getAttribute("loginUser");
    String username = user.getUsername();
    int root = user.getRoot();
%>

<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${pageContext.request.contextPath}/static/assets/img/avatar5.png" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>用户：${loginUser.username}</p>
                <a href="#"><i class="fa fa-circle text-success"></i> 权限：${loginUser.root == 0 ? "管理员" : "普通"}</a>
            </div>
        </div>

        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">功能菜单</li>
            <li class="active treeview">
                <a href="#">
                    <i class="fa fa-users"></i> <span>病人管理</span>
                    <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="patientAction_findAllPatients.action"><i class="fa fa-circle-o"></i> 病人列表</a></li>
                    <li><a href="${pageContext.request.contextPath}/patientAction_addPatientjsp.action" style="display: <%=root==1?"none":"block"%>"><i class="fa fa-circle-o"></i> 添加病人</a></li>
                    <li><a href="patientAction_searchJsp.action"><i class="fa fa-circle-o"></i> 搜索下载</a></li>
                </ul>
            </li>

        </ul>
    </section>
</aside>