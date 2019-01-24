<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018-11-28
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<c:set var="basePath" value="<%=basePath%>"/>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<!-- Bootstrap Core CSS -->
<link href="${basePath}/static/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="${basePath}/static/assets/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="${basePath}/static/assets/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link href="${basePath}/static/assets/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${basePath}/static/assets/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${basePath}/static/assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet"
      type="text/css">

<!-- jQuery -->
<script src="${basePath}/static/assets/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="${basePath}/static/assets/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="${basePath}/static/assets/vendor/metisMenu/metisMenu.min.js"></script>

<!-- DataTables JavaScript -->
<script src="${basePath}/static/assets/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="${basePath}/static/assets/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="${basePath}/static/assets/vendor/datatables-responsive/dataTables.responsive.js"></script>

<!-- Custom Theme JavaScript -->
<script src="${basePath}/static/assets/dist/js/sb-admin-2.js"></script>
