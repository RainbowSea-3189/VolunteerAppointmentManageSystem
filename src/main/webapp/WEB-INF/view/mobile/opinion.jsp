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
            <div class="form-group" style="margin:5px;text-align: center">
               <h4>请留下您宝贵的意见</h4>
            </div>
            <div class="form-group" style="margin:5px;">
                <textarea class="form-control" id="opinion" style="width: 100%;height: 250px;" ></textarea>
                <input id="appoId" value="${appoId}" hidden />
            </div><br/>
            <div class="form-group">
                <div class="text-center">
                    <button type="button" id="submitBtn" class="btn btn-primary btn-lg btn-block">
                        <i class="fa fa-check fa-btn"></i>提交
                    </button>
                </div>
            </div>
            <div class="form-group" style="margin:5px;text-align: center">
                <%--<img src="${basePath}/static/assets/picture/fy-logo.jpg" height="40%" width="100%"  />--%>
            </div>
        <%--</c:if>--%>
    </div>
    <!-- /.col-lg-12 -->
<!-- /.row -->

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

    var redicect = '0';

    $(function () {
        var width = $(window).width();
        $("body").attr("style", "width:" + width + "px");
    });

    //搜索
    $("#submitBtn").on("click", function () {
        var id = $("#appoId").val();
        var opinion = $("#opinion").val();
        $.ajax({
            type: "POST",
            url: "${basePath}record/updateStatus",
            async: false,
            data: {
                id: id,
                opinion: opinion,
                updateTime: new Date()
            },// 要提交的表单
            success: function (rb) {
                if (rb.code == 0) {
                    $("#msgInfo").text("谢谢您提出建议，谢谢！");
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
    });

    //关闭信息提示框
    $("#msgOkBtn").on("click", function () {
        $("#msgModal").modal("hide");
        if (redicect == '1') {
            $(location).attr('href', 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxc4b817ab27010402&redirect_uri=http%3a%2f%2fwww.gyyfy.com%3a9075%2fVAMS%2fmobile%2fallStation&response_type=code&scope=snsapi_base&state=#wechat_redirect');
        }
    });
</script>
</body>
</html>
