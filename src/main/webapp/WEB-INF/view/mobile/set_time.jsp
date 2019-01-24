<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018-11-24
  Time: 16:23
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
    <div class="panel-wrapper">
        <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-default">
                    <div class="panel-heading" style="text-align: center">
                        <img src="${basePath}/static/assets/picture/fy-volunteer-logo1.jpg">
                        <%--<img src="${basePath}static/assets/picture/fy-volunteer-logo.jpg">--%>
                        <input id="tabSign" value="AM" class="hidden">
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <!-- Nav tabs -->
                        <ul class="nav nav-pills">
                            <li class="active">
                                <a href="#AM" class="titleTab" sign="AM" data-toggle="tab">上午预约</a>
                            </li>
                            <li>
                                <a href="#PM" class="titleTab" sign="PM" data-toggle="tab">下午预约</a>
                            </li>
                            <%--<li>--%>
                                <%--<a href="#ZD" class="titleTab" sign="ZD" data-toggle="tab">自定义时间</a>--%>
                            <%--</li>--%>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="AM">
                                <div class="row" style="padding-top: 30px">
                                    <div class="col-xs-12 form-group">
                                        <input id="dateAM" class="form-control" placeholder="预约日期"
                                               onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd ',minDate:'%y-%M-{%d+1}'})">
                                    </div>
                                    <div class="col-xs-12" style="padding-top: 20px">
                                        <div class="col-xs-5" style="padding: 0px">
                                            <input id="beginTimeAM" placeholder="开始时间" class="form-control"
                                                   onclick="WdatePicker({el:this,dateFmt:'HH',maxDate:'#F{$dp.$D(\'endTimeAM\')}',minTime:'08:00:00',maxTime:'12:00:00'})">
                                        </div>
                                        <div class="col-xs-2" style="text-align: center;padding-top: 7px">
                                            <span>至</span>
                                        </div>
                                        <div class="col-xs-5" style="padding: 0px">
                                            <input id="endTimeAM" placeholder="结束时间" class="form-control"
                                                   onclick="WdatePicker({el:this,dateFmt:'HH',minDate:'#F{$dp.$D(\'beginTimeAM\')}',minTime:'08:00:00',maxTime:'12:00:00'})">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="PM">
                                <div class="row" style="padding-top: 30px">
                                    <div class="col-xs-12 form-group">
                                        <input id="datePM" class="form-control" placeholder="预约日期"
                                               onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd ',minDate:'%y-%M-{%d+1}'})">
                                    </div>
                                    <div class="col-xs-12" style="padding-top: 20px">
                                        <div class="col-xs-5" style="padding: 0px">
                                            <input id="beginTimePM" placeholder="开始时间" class="form-control"
                                                   onclick="WdatePicker({el:this,dateFmt:'HH',maxDate:'#F{$dp.$D(\'endTimePM\')}',minTime:'14:00:00',maxTime:'17:00:00'})">
                                        </div>
                                        <div class="col-xs-2" style="text-align: center;padding-top: 7px">
                                            <span>至</span>
                                        </div>
                                        <div class="col-xs-5" style="padding: 0px">
                                            <input id="endTimePM" placeholder="结束时间" class="form-control"
                                                   onclick="WdatePicker({el:this,dateFmt:'HH',minDate:'#F{$dp.$D(\'beginTimePM\')}',minTime:'14:00:00',maxTime:'17:00:00'})">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="ZD">
                                <div class="row" style="padding-top: 20px">
                                    <div class="col-xs-12 form-group">
                                        <input id="dateZD" class="form-control" placeholder="预约日期"
                                               onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd ',minDate:'%y-%M-{%d+1}'})">
                                    </div>
                                    <div class="row" style="padding-top: 20px">
                                        <div class="col-xs-4 form-group input-group">
                                            <input id="beginTimeZD" placeholder="开始时间" class="form-control"
                                                   onclick="WdatePicker({el:this,dateFmt:'HH',maxDate:'#F{$dp.$D(\'endTimeZD\')}'})">
                                            <span class="input-group-addon">点</span>
                                        </div>
                                        <div class="col-xs-4"></div>
                                        <div class="col-xs-4 form-group input-group">
                                            <input id="endTimeZD" placeholder="结束时间" class="form-control"
                                                   onclick="WdatePicker({el:this,dateFmt:'HH',minDate:'#F{$dp.$D(\'be   ginTimeAM\')}'       })">
                                            <span class="input-group-addon">点</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.panel-body -->
                    <div class="panel">
                        <button type="button" id="submitBtn" class="btn btn-primary btn-lg btn-block">提交</button>
                    </div>
                </div>
                <!-- /.panel -->
            </div>
        </div>
    </div>
</div>
<script>
    $(".titleTab").on("click", function () {
        var sign = $(this).attr("sign");
        $("#tabSign").val(sign);
    });

    $("#submitBtn").on("click", function () {
        var sign = $("#tabSign").val();
        var date = $("#date" + sign).val();
        var beginTime = date + $("#beginTime" + sign).val();
        var endTime = date + $("#endTime" + sign).val();
        window.location.href = "${basePath}mobile/stationList?appoTime="+date+"&begin=" + $("#beginTime" + sign).val() + "&end=" + $("#endTime" + sign).val();
    })

</script>
</body>
</html>
