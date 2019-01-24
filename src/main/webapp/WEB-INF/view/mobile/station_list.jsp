<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018-11-24
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@include file="../common/common.jsp" %>
    <script type="text/javascript" src="${basePath}/static/common/common.js"></script>
    <!-- MyDate97 -->
    <script src="${basePath}/static/assets/libs/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<div id="wrapper">
    <input id="beginTime" class="hidden" value="${beginTime}" onclick="">
    <input id="endTime" class="hidden" value="${endTime}">
    <input id="date" class="hidden" value="${appoTime}">
    <input id="begin" class="hidden" value="${begin}">
    <input id="end" class="hidden" value="${end}">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">请选择您要预约的岗位:</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <c:forEach items="${stationList}" var="list">
            <div class="col-lg-4">
                <div class="panel panel-green">
                    <div class="panel-heading">
                        岗位名称：${list.name}
                    </div>
                    <div class="panel-body">
                        <p>岗位说明：${list.details}</p>
                    </div>
                    <div class="panel-footer" style="text-align: right">
                        <button type="button" class="btn btn-primary submit" sign="${list.id}">选择</button>
                    </div>
                </div>
                <!-- /.col-lg-4 -->
            </div>
        </c:forEach>
    </div>
    <!-- /.row -->
</div>
<button title="信息" type="button" id="msgBtn" data-placement="left" data-toggle="modal" data-target="#msgModal"
        class="btn btn-danger btn-sm hidden">
    <i class="fa fa-trash"></i> 信息
</button>
<!-- insertModal -->
<div class="modal fade" id="msgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">信息</h4>
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
<!-- /.modal -->
<script>
    //提交预约
    $(".submit").on("click", function () {
        var stationId = $(this).attr("sign");
        $.ajax({
            type: "POST",
            url: "${basePath}record/insert",
            data: {
                name: $("#nameInsert").val(),
                depId: $("#depIdInsert").val(),
                depName: $("#depNameInsert").val(),
                phone: $("#phoneInsert").val(),
                stationId: stationId,
                date: '${appoTime}',
                beginTime: dateFmt('yyyy-MM-dd hh:mm:ss' ,new Date('${beginTime}')),
                endTime:  dateFmt('yyyy-MM-dd hh:mm:ss' ,new Date('${endTime}')),
                begin: ${begin},
                end: ${end}
            },// 要提交的表单
            success: function (rb) {
                if (rb.code == 0) {
                    $("#msgInfo").text("预约成功！");
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
    })

    //关闭信息提示框
    $("#msgOkBtn").on("click", function () {
        $("#msgModal").modal("hide");
    })
</script>
</body>
</html>

