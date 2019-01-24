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
    <div class="col-lg-12 col-sm-12">
    <%--<c:if test="${userPhone != '18370850492'}">--%>
        <%--<h4 id="title" class="page-header"></h4>--%>
    <%--</c:if>--%>
        <%--<c:if test="${userPhone == '18370850492'}">--%>
            <div class="form-group" style="margin:5px">
                <input type="text" placeholder="预约人姓名" value="${map.appointmentName}" class="form-control" style="display: inline;width: 48%" id="appointmentName">&nbsp;&nbsp;
                <input type="text" placeholder="预约人电话" value="${map.phone}" class="form-control" style="display: inline;width: 48%" id="phone">
            </div>
            <div class="form-group" style="margin:5px">
                <input type="text" placeholder="岗位名称" value="${map.stationName}" class="form-control" style="display: inline;width: 48%" id="stationName">&nbsp;&nbsp;
                <input type="text" placeholder="预约日期" value="${map.appointmentTime}" class="form-control" style="display: inline;width: 48%" id="date" readonly onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})">
            </div>
            <div class="form-group">
                <div class="text-center">
                    <button type="button" id="searchBtn" class="btn btn-primary btn-lg btn-block">
                        <i class="fa fa-search fa-btn"></i>搜索
                    </button>
                </div>
            </div>
        <%--</c:if>--%>
    </div>
    <!-- /.col-lg-12 -->
    <c:forEach items="${recordList}" var="list">
        <div class="col-lg-4 col-sm-12">
            <div class="panel panel-green">
                <div class="panel-heading">
                    预约人姓名：${list.NAME}
                </div>
                <div class="panel-body">
                    <p>岗位名称：${list.STATIONNAME}</p>
                    <%--<c:if test="${userPhone == '13576748986' or userPhone == '13479902100' or userDepId == '494'}">--%>
                        <p>预约日期：<fmt:formatDate value="${list.APPOINTMENT_TIME}" pattern="yyyy年MM月dd日"/></p>
                    <%--</c:if>--%>
                    <p>志愿服务从<fmt:formatDate value="${list.BEGIN_TIME}" pattern=" a HH点"/>至<fmt:formatDate value="${list.END_TIME}" pattern=" a HH点"/></p>
                </div>
                <div class="panel-footer" style="text-align: right">
                    <div style="display: inline;">
                        <c:if test="${list.STATUS == 0}">
                            <button type="button" class="btn btn-warning submit" appoId="${list.ID}" status="${list.STATUS}">签到</button>
                        </c:if>
                        <c:if test="${list.STATUS == 1}">
                            <button type="button" class="btn btn-success submit" appoId="${list.ID}" status="${list.STATUS}">完成</button>
                        </c:if>
                        <c:if test="${list.STATUS == 2}">
                            <button type="button" class="btn btn-default" appoId="${list.ID}" status="${list.STATUS}">已完成</button>
                        </c:if>
                        <%--<c:if test="${userPhone == '13576748986' or userPhone == '13479902100' or userDepId == '494'}">--%>
                            <button type="button" class="btn btn-danger delete" appoId="${list.ID}" status="${list.STATUS}">删除</button>
                        <%--</c:if>--%>
                    </div>
                </div>
            </div>
            <!-- /.col-lg-4 -->
        </div>
    </c:forEach>
<!-- /.row -->

    <button title="删除" type="button" id="deleteBtn" data-placement="left" data-toggle="modal" data-target="#deleteModal"
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

    <button title="信息" type="button" id="msgBtn" data-placement="left" data-toggle="modal" data-target="#msgModal"
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

    $(function () {
        var width = $(window).width();
        $("body").attr("style", "width:" + width + "px");
        <c:if test="${map.depId != ''}">
        $("#title").text(dateFmt('yyyy年MM月dd日',new Date())+'${userDepName}志愿服务人员：');
        </c:if>
    });

    //搜索
    $("#searchBtn").on("click", function () {
        var stationName = $("#stationName").val();
        var name = $("#appointmentName").val();
        var phone = $("#phone").val();
        var date = $("#date").val();
        $(location).attr('href', '${basePath}/mobile/settingRecord?appointmentTime='+date+'&stationName='+stationName+'&appointmentName='+name+'&phone='+phone);
    });

    //提交修改
    $(".submit").on("click", function () {
        var appoId = $(this).attr("appoid");
        var newStatus = $(this).attr("status");
        var status = 0;
        if (newStatus == 0) {
            status = 1;
        } else if (newStatus == 1) {
            status = 2;
        }
        $.ajax({
            type: "POST",
            url: "${basePath}record/updateStatus",
            async: false,
            data: {
                id: appoId,
                status: status,
                updateer: '${userName}',
                updateTime: new Date()
            },// 要提交的表单
            success: function (rb) {
                if (rb.code == 0) {
                    $("#msgInfo").text(rb.msg);
                    $("#msgBtn").trigger("click");
                } else {
                    $("#msgInfo").text(rb.msg);
                    $("#msgBtn").trigger("click");
                }
            },
            error: function () {
                $("#msgInfo").text("提交失败！");
                $("#msgBtn").trigger("click");
            }
        });
    });

    //删除弹窗
    $(".delete").on("click", function () {
        var id = $(this).attr("appoid");
        $("#deleteId").val(id);
        $("#deleteBtn").trigger("click");
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
                    $("#msgInfo").text(rb.msg);
                    $("#msgBtn").trigger("click");
                }
            },
            error: function () {
                $("#msgInfo").text("提交失败！");
                $("#msgBtn").trigger("click");
            }
        });
        $("#deleteModal").modal("hide");
    });

    //关闭信息提示框
    $("#msgOkBtn").on("click", function () {
        $("#msgModal").modal("hide");
        window.location.reload();
    });
</script>
</body>
</html>
