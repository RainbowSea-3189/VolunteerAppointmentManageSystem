<%--
  Created by IntelliJ IDEA.
  User: RainbowSea
  Date: 2018/12/8
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<html>
<head>
    <title>志愿者预约系统</title>
    <%@include file="../common/common.jsp" %>
    <script type="text/javascript" src="${basePath}/static/common/common.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
    <div class="col-lg-12 col-sm-12">
        <h2 class="page-header">请选择您要预约的岗位:</h2>
    </div>
    <!-- /.col-lg-12 -->
    <c:forEach items="${stationList}" var="list">
        <div class="col-lg-4 col-sm-12">
            <div class="panel panel-green">
                <div class="panel-heading">
                    岗位名称：${list.NAME}
                </div>
                <div class="panel-body">
                    <p>岗位说明：${list.DETAILS}</p>
                </div>
                <div class="panel-footer" style="text-align: right">
                    <div style="display: inline">共需${list.NUM}人</div>
                    <div style="display: inline;">
                        <button type="button" class="btn btn-primary submit" stationId="${list.ID}" stationName="${list.NAME}">预约</button>
                    </div>
                </div>
            </div>
            <!-- /.col-lg-4 -->
        </div>
    </c:forEach>
    <div style="text-align: center">
        <button type="button" id="ranking" class="btn btn-link">排行榜</button>
        <button type="button" id="record" class="btn btn-link">我的预约记录和服务时长</button>
        <c:if test="${userPhone == '13576748986' or userPhone == '13479902100' or userPhone == '13970741276' or userPhone == '13576734954' or userDepId == '494'}">
            <button type="button" id="setting" class="btn btn-link">管理</button>
        </c:if>
    </div>
<!-- /.row -->
<script>

    $(function () {
        var width = $(window).width();
        $("body").attr("style", "width:" + width + "px");
    });

    //提交预约
    $(".submit").on("click", function () {
        var stationId = $(this).attr("stationid");
        var stationName = $(this).attr("stationname");
        $(location).attr('href', '${basePath}/mobile/calendar?stationId=' + stationId + '&stationName=' + stationName+ '&code=${code}');
    });

    //我的预约记录和服务时长
    $("#record").on("click", function () {
        $(location).attr('href', '${basePath}/mobile/getRecord?phone=${userPhone}');
    });

    //排行榜
    $("#ranking").on("click", function () {
        $(location).attr('href', '${basePath}/mobile/getRankingList?month=' + getPreMonth(dateFmt('yyyy-MM-dd', new Date())));
    });

    //管理
    $("#setting").on("click", function () {
        var phone = '${userPhone}';
        var sign = '';
        if (phone == '13576748986') {//黄清云--管理门诊
            sign = '门诊';
        } else if (phone == '13479902100') {//彭辉--管理住院服务中心
            sign = '住院服务中心';
        } else if (phone == '13970741276') {//宋志美--管理医保咨询
            sign = '医保咨询';
        } else if (phone == '13576734954') {//林秀--管理所有
            sign = '';
        }
        $(location).attr('href', '${basePath}/mobile/settingRecord?stationName=' + sign + '&appointmentTime=' + dateFmt('yyyy-MM-dd', new Date()));
    });
</script>
</body>
</html>
