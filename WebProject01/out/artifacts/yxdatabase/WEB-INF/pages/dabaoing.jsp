<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: panyexiong
  Date: 2019/6/2
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>正在打包</title>
</head>
<body>
    <%--下载的文件正在打包，请稍等。--%>
    <s:a namespace="/" action="downloadAction_downloading">打包完成，点击下载</s:a>
</body>
</html>
