<%--
  Created by IntelliJ IDEA.
  User: RainbowSea
  Date: 2018/12/8
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<div class="col-sm-12" style="display: inline-flex">
    <%--<span id="sumTime" style="font-size: 18px"></span>--%>
    <div><h4 id="sumTime" style="font-size: 16px;margin: 10px;"></h4></div>
    <%--<button type="button" id="minus" class="btn btn-info btn-sm">--%>
        <%--<i class="fa fa-eye fa-btn"></i>--%>
    <%--</button>--%>
    <button type="button" class="btn btn-link"  data-toggle="modal" data-target="#showMonthModel">各月详情</button>
</div>
<!-- /.col-lg-12 -->
<c:forEach items="${recordList}" var="list">
    <div class="col-lg-4 col-sm-12">
        <div class="panel panel-green">
            <div class="panel-heading">
                预约岗位名称：${list.STATIONNAME}
            </div>
            <div class="panel-body">
                <p>预约时间：<fmt:formatDate value="${list.APPOINTMENT_TIME}" pattern="yyyy年MM月dd号"/></p>
                <p>志愿服务从<fmt:formatDate value="${list.BEGIN_TIME}" pattern="dd号 HH点"/>至<fmt:formatDate value="${list.END_TIME}" pattern="dd号 HH点"/></p>
                <c:if test="${list.STATUS == 0}">
                    <button type="button" class="btn btn-default" disabled>状态：待签到</button>
                </c:if>
                <c:if test="${list.STATUS == 1}">
                    <button type="button" class="btn btn-default" disabled>状态：已签到</button>
                </c:if>
                <c:if test="${list.STATUS == 2}">
                    <button type="button" class="btn btn-default" disabled>状态：已完成</button>
                </c:if>
            </div>
            <div class="panel-footer" style="text-align: center">
                <div class="panel-body" style="padding: 0px 0px 15px 0px;width: 100%">
                    <div class="col-sm-4" style="display:inline;position: absolute;left: 10px">
                        <c:if test="${list.STATUS == 2}">
                            <button type="button" class="btn btn-success success opinion" appoId="${list.ID}" appoDate="${list.INSERT_TIME}" status="${list.STATUS}">建议意见</button>
                        </c:if>
                    </div>
                        <%--<div class="col-sm-4" style="display: inline;margin-bottom: 15px">共需${list.NUM}人</div>--%>
                    <div class="col-sm-4" style="display: inline;"></div>
                    <div class="col-sm-4" style="display: inline;position: absolute;right: 10px">
                        <c:if test="${list.STATUS == 0}">
                            <button type="button" class="btn btn-danger delete" appoId="${list.ID}" appoDate="${list.INSERT_TIME}" status="${list.STATUS}">删除</button>
                        </c:if>

                    </div>
                </div>
            </div>

        </div>
        <!-- /.col-lg-4 -->
    </div>
</c:forEach>
<!-- /.row -->

<%--查看各个月份的服务时长--%>
<div class="modal fade" id="showMonthModel" tabindex="-1" data-backdrop="false" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">各个月份的服务时长</h4>
            </div>
            <div class="modal-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>月份</th>
                            <th>服务时长(小时)</th>
                        </tr>
                        </thead>
                        <tbody id="monthRecord">

                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">确认</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<button type="button" id="deleteBtn" data-placement="left" data-toggle="modal" data-target="#deleteModal"
        class="btn btn-danger btn-sm hidden">
    <i class="fa fa-trash"></i> 删除记录弹出框
</button>
<!-- deleteModal -->
<div class="modal fade" id="deleteModal" tabindex="-1" data-backdrop="false" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">删除记录</h4>
            </div>
            <div class="modal-body">
                <span id="deleteMsg">您确认要删除该记录吗？</span>
                <input id="deleteId" class="form-control hidden">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="submitDelete">确认删除</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<button type="button" id="msgBtn" data-placement="left" data-toggle="modal" data-target="#msgModal"
        class="btn btn-danger btn-sm hidden">
    <i class="fa fa-trash"></i> 提示消息弹出框
</button>
<!-- insertModal -->
<div class="modal fade" id="msgModal" tabindex="-1" role="dialog" data-backdrop="false" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">提示消息</h4>
            </div>
            <div class="modal-body">
                <span id="msgInfo"></span>
            </div>
            <div class="modal-footer">
                <%--<button type="button" class="btn btn-default" data-dismiss="modal">确定</button>--%>
                <button type="button" class="btn btn-primary" id="msgOkBtn">确定</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<script>

    var sumTime = 0;
    var sumMonthTime = 0;
    var signTime = '';
    var htmls = '';
    var time = '';
    var preMonth = '';
    var nowMonth = dateFmt('yyyy-MM', new Date());
    <c:forEach items="${recordList}" var="list" varStatus="status">
        time = dateFmt('yyyy-MM', new Date('${list.APPOINTMENT_TIME}'));
        preMonth = dateFmt('yyyy-MM',new Date(getPreMonth(dateFmt('yyyy-MM-dd', new Date()))));
        if (${list.STATUS == 2}) {
            sumTime += ${list.SUM_TIME};
        }
        if (${status.count == 1} ) {
            signTime = time;
        }
        // if (time != nowMonth) {
            if (signTime != '' && signTime == time) {
                if (${list.STATUS == 2}) {
                    sumMonthTime += ${list.SUM_TIME};
                }
            } else {
                htmls += '<tr class="success">' +
                    '<td>'+signTime+'</td>' +
                    '<td>'+sumMonthTime+'</td>' +
                    '</tr>';
                signTime = time;
                sumMonthTime = ${list.SUM_TIME};
            }
        // }
    </c:forEach>

    //页面加载完成事件
    $(function () {
        $("#sumTime").text('您的志愿服务总时长为：' + sumTime + '小时');
        htmls += '<tr class="success">' +
            '<td>'+signTime+'</td>' +
            '<td>'+sumMonthTime+'</td>' +
            '</tr>';
        $("#monthRecord").html(htmls);
    });


    //删除弹窗
    var sign = '0';
    $(".delete").on("click", function () {
        var id = $(this).attr("appoid");
        var date = new Date($(this).attr("appodate"));
        var nextdate = new Date(date.getTime() + 24*60*60*1000);
        if (nextdate > new Date()) {
            $("#msgInfo").text("预约记录在24小时内不能删除！");
            $("#msgBtn").trigger("click");
            sign = '1';
        } else {
            $("#deleteId").val(id);
            $("#deleteBtn").trigger("click");
        }
    });

    //删除记录
    $("#submitDelete").on("click", function () {
        var id = $("#deleteId").val();
        $.ajax({
            type: "POST",
            url: "${basePath}record/delete",
            data: {
                id: id
            },// 要提交的表单
            success: function (rb) {
                if (rb.code == 0) {
                    $("#msgInfo").text(rb.msg);
                    $("#msgBtn").trigger("click");


                } else {
                    if (rb.msg == 'redirect') {
                        $("#msgInfo").text("抱歉，您的身份验证已过期，请重新验证！");
                        redicect = '1';
                        $("#msgBtn").trigger("click");
                    } else {
                        $("#msgInfo").text(rb.msg);
                        $("#msgBtn").trigger("click");
                    }
                }
            },
            error: function () {
                $("#msgInfo").text("提交失败！");
                $("#msgBtn").trigger("click");
            }
        });
        $("#deleteModal").modal("hide");
    });

    //提交建议意见
    $(".opinion").on("click", function () {
        var id = $(this).attr("appoid");
        window.location.href = "${basePath}mobile/opinion?appoID=" + id;
    });

    //关闭信息提示框
    $("#msgOkBtn").on("click", function () {
        $("#msgModal").modal("hide");
        if (sign == '0') {
            window.location.reload();
        }
        if (redicect == '1') {
            $(location).attr('href', 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxc4b817ab27010402&redirect_uri=http%3a%2f%2fwww.gyyfy.com%3a9075%2fVAMS%2fmobile%2fallStation&response_type=code&scope=snsapi_base&state=#wechat_redirect');
        }
        sign = '1';
    });
</script>
</body>
</html>
