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
    <!-- MyDate97 -->
    <script src="${basePath}/static/assets/libs/My97DatePicker/WdatePicker.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
    <div class="col-lg-12 col-sm-12" style="text-align: center">
        <h2 class="page-header">志愿服务排行榜</h2>
    </div>
    <div style="text-align: center">
        <input type="text" class="form-control" id="month" style="width: 120px;display: inline"
               onclick="WdatePicker({el:this,dateFmt:'yyyy年MM月份',Mchanged:monthFunc})" readonly>
    </div>
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th>排名</th>
                    <th>姓名</th>
                    <th>服务时长(小时)</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="rankingList" varStatus="status">
                <tr <c:choose>
                    <c:when test="${rankingList.PHONE == userPhone}">
                        class="success"
                    </c:when>
                    <c:otherwise>
                        class="info"
                    </c:otherwise>
                    </c:choose> >
                        <td>${status.count}</td>
                        <td>${rankingList.INSERTER}</td>
                        <td>${rankingList.SUMTIME}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <!-- /.table-responsive -->
    </div>
    <!-- /.panel-body -->
<!-- /.row -->
<script>

    //页面加载完成事件
    $(function () {
        var width = $(window).width();
        $("body").attr("style", "width:" + width + "px");
        $("#month").val(dateFmt('yyyy年MM月份',new Date('${month}')));
    });


    function monthFunc(){
        var month = $dp.cal.newdate.y.toString() + '-' + $dp.cal.newdate.M;
        $(location).attr('href', '${basePath}/mobile/getRankingList?month=' + dateFmt('yyyy-MM', new Date(month)) );
    }
</script>
</body>
</html>
