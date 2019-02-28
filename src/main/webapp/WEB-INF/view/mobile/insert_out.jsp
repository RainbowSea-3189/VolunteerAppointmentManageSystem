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
<div class="col-xs-12">
    <div class="row" style="padding-top: 30px">
        <div class="col-xs-12" style="padding-top: 20px">
            <input id="name" placeholder="姓名" class="form-control">
        </div>
        <div class="col-xs-12" style="padding-top: 20px">
            <input id="depName" placeholder="志愿者来源" class="form-control">
        </div>
        <div class="col-xs-12" style="padding-top: 20px">
            <input id="stationName" placeholder="预约岗位" class="form-control" value="${stationName}" disabled>
        </div>
        <div class="col-xs-12 form-group" style="padding-top: 20px">
            <input id="date" class="form-control" placeholder="预约日期"
                   onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd '})">
        </div>
        <div class="col-xs-12" style="padding-top: 20px">
            <div class="col-xs-5" style="padding: 0px">
                <input id="beginTime" placeholder="开始时间" class="form-control"
                       onclick="WdatePicker({el:this,dateFmt:'HH',maxDate:'#F{$dp.$D(\'endTime\')}',minTime:'08:00:00',maxTime:'17:00:00'})">
            </div>
            <div class="col-xs-2" style="text-align: center;padding-top: 7px">
                <span>至</span>
            </div>
            <div class="col-xs-5" style="padding: 0px">
                <input id="endTime" placeholder="结束时间" class="form-control"
                       onclick="WdatePicker({el:this,dateFmt:'HH',minDate:'#F{$dp.$D(\'beginTime\')}',minTime:'08:00:00',maxTime:'17:00:00'})">
            </div>
        </div>
    </div>
    <br/>
    <div class="panel">
        <button type="button" id="submitBtn" class="btn btn-primary btn-lg btn-block">提交</button>
    </div>
</div>

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

        //提交新增
        $("#submitBtn").on("click", function () {
            var dateInsert =$("#date").val();
            var beginTime = dateInsert + $("#beginTime").val() + ':00:00';
            var endTime = dateInsert + $("#endTime").val() + ':00:00';
            var begin = $("#beginTime").val();
            var end = $("#endTime").val();
            var sumTime = end - begin;
            $.ajax({
                type: "POST",
                url: "${basePath}record/insertOut",
                async: false,
                data: {
                    name: $("#name").val(),
                    depName: $("#depName").val(),
                    stationId: ${stationId},
                    appointmentTime: dateInsert.replace(/-/g, "/"),
                    beginTime: beginTime.replace(/-/g, "/"),
                    endTime:  endTime.replace(/-/g, "/"),
                    sumTime:  sumTime,
                    status: 2,
                    inserter: '${userName}'
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
            $("#chooseDateModel").modal("hide");
        });
    });


    //关闭信息提示框
    $("#msgOkBtn").on("click", function () {
        $("#msgModal").modal("hide");
        $("#name").val("");
        <%--$(location).attr('href', '${basePath}/mobile/getRecord?phone=${userPhone}');--%>
    });
</script>
</body>
</html>
