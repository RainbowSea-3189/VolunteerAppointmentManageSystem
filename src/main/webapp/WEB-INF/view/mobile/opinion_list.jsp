<%--
  Created by IntelliJ IDEA.
  User: RainbowSea
  Date: 2018/12/8
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>志愿者预约系统</title>
    <%@include file="../common/common.jsp" %>
    <script type="text/javascript" src="${basePath}/static/common/common.js"></script>
    <!-- MyDate97 -->
    <script src="${basePath}/static/assets/libs/My97DatePicker/WdatePicker.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
    <%--<div class="col-lg-12 col-sm-12">--%>
            <%--<div class="form-group" style="margin:5px">--%>
                <%--<input type="text" placeholder="预约人姓名" value="${map.appointmentName}" class="form-control" style="display: inline;width: 48%" id="appointmentName">&nbsp;&nbsp;--%>
                <%--<input type="text" placeholder="预约人电话" value="${map.phone}" class="form-control" style="display: inline;width: 48%" id="phone">--%>
            <%--</div>--%>
            <%--<div class="form-group" style="margin:5px">--%>
                <%--<input type="text" placeholder="岗位名称" value="${map.stationName}" class="form-control" style="display: inline;width: 48%" id="stationName" <c:if test="${userPhone == '13576748986' or userPhone == '13479902100' or userPhone == '13970741276'}"> disabled</c:if> >&nbsp;&nbsp;--%>
                <%--<input type="text" placeholder="预约日期" value="${map.appointmentTime}" class="form-control" style="display: inline;width: 48%" id="date" readonly onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})">--%>
            <%--</div>--%>
            <%--<div class="form-group">--%>
                <%--<div class="text-center">--%>
                    <%--<button type="button" id="searchBtn" class="btn btn-primary btn-lg btn-block">--%>
                        <%--<i class="fa fa-search fa-btn"></i>搜索--%>
                    <%--</button>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>
    <%--</div>--%>
    <!-- /.col-lg-12 -->
    <div class="col-lg-12 col-sm-12" style="text-align: center">
        <h2 class="page-header">志愿者建议</h2>
    </div>
    <c:forEach items="${recordList}" var="list">
        <div class="col-lg-4 col-sm-12">
            <div class="panel panel-green">
                <div class="panel-heading">
                    提出时间：<fmt:formatDate value="${list.UPDATE_TIME}" pattern="yyyy年MM月dd日"/>
                </div>
                <div class="panel-body">
                    <p>建议内容：${list.OPINION}</p>
                </div>
                <%--<div class="panel-footer" style="text-align: right">--%>
                    <%--<div style="display: inline;">--%>
                        <%--<c:if test="${list.STATUS == 0}">--%>
                            <%--<button type="button" class="btn btn-warning submit" appoId="${list.ID}" status="${list.STATUS}">签到</button>--%>
                        <%--</c:if>--%>
                        <%--<c:if test="${list.STATUS == 1}">--%>
                            <%--<button type="button" class="btn btn-success submit" appoId="${list.ID}" status="${list.STATUS}">完成</button>--%>
                        <%--</c:if>--%>
                        <%--<c:if test="${list.STATUS == 2}">--%>
                            <%--<button type="button" class="btn btn-default" appoId="${list.ID}" status="${list.STATUS}">已完成</button>--%>
                        <%--</c:if>--%>
                            <%--<button type="button" class="btn btn-danger delete" appoId="${list.ID}" status="${list.STATUS}">删除</button>--%>
                    <%--</div>--%>
                <%--</div>--%>
            </div>
            <!-- /.col-lg-4 -->
        </div>
    </c:forEach>
<!-- /.row -->

<script>

    $(function () {
        var width = $(window).width();
        $("body").attr("style", "width:" + width + "px");
    });

</script>
</body>
</html>
