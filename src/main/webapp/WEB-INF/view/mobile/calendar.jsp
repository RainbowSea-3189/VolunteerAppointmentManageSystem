<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<c:set var="basePath" value="<%=basePath%>"/>
<!DOCTYPE html>
<html>
<head>
    <title>志愿者预约系统</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

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

    <script type="text/javascript" src="${basePath}/static/common/common.js"></script>

    <link href='${basePath}/static/assets/libs/FullCalendar/fullcalendar.min.css' rel='stylesheet' />
    <link href='${basePath}/static/assets/libs/FullCalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
    <script src='${basePath}/static/assets/libs/FullCalendar/lib/moment.min.js'></script>
    <%--<script src='${basePath}/static/assets/libs/FullCalendar/lib/jquery.min.js'></script>--%>
    <script src='${basePath}/static/assets/libs/FullCalendar/fullcalendar.min.js'></script>
    <script src='${basePath}/static/assets/libs/FullCalendar/locale/zh-cn.js'></script>

    <style>
        #calendar {
            max-width: 100%;
            margin: 0 auto;
        }

        h2 {
            font-size: 18px;
            padding-top: 5px;
        }
    </style>
</head>
<body>

<!-- Button trigger modal -->
<button class="btn btn-primary btn-lg hidden" id="chooseDate" data-toggle="modal" data-target="#chooseDateModel">
    设置预约时间弹出框
</button>
<!-- chooseModal -->
<div class="modal fade" id="chooseDateModel" tabindex="-1" data-backdrop="false" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">选择预约时间</h4>
            </div>
            <div class="modal-body">
                <div style="text-align: center">
                    <img src="${basePath}/static/assets/picture/fy-logo.jpg" height="75%" width="75%" />
                </div><br/>
                您预约的岗位是：<span style="color: #ac2925">${stationName}</span><br/>
                <span id="showNum"></span><br/>
                <span id="showName"></span><br/>
                预约
                <button type="button" id="minus" class="btn btn-success btn-sm">
                    <i class="fa fa-minus-circle fa-btn"></i>
                </button>
                <input class="form-control" id="addTime" style="width: 35px;display: inline;" value="1"/>
                <button type="button" id="add" class="btn btn-success btn-sm">
                    <i class="fa fa-plus-circle fa-btn"></i>
                </button>
                小时,预约时间:<br/>
                从<span id="beginTimeShow" style="color: #ac2925"></span><br/>至<span id="endTimeShow" style="color: #ac2925"></span><br/>
                志愿者注意事项
                <button title="信息"  type="button" id="tip" data-placement="left" data-toggle="modal" data-target="#tipModal"
                        class="btn btn-sm btn-link">查看
                </button>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="submitAppo">确认预约</button>
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
<!-- msgModal -->
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

<!-- tipModal -->
<div class="modal fade" id="tipModal" tabindex="-1" role="dialog" data-backdrop="false" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div id="tipContent" class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">志愿者注意事项</h4>
            </div>
            <div class="modal-body">
                <p> 1、志愿者应仪表端庄、佩戴（衣着）标识及工作牌，准时上岗，不脱岗，不闲谈，不玩手机。</p>
                <p> 2、志愿者上岗必须衣表整洁规范、微笑服务，并使用文明用语，接待每一位患者，都要“请”字当头，说一声“您好”，严禁使用禁语，态度要和蔼、解释要耐心。</p>
                <p> 3、熟练掌握全院每个科室所处的位置等全院情况，以便于做好咨询和引导患者就医。</p>
                <p> 4、对年老体弱、行动不便的患者就医没有家人陪同的，要主动、热情上前服务。</p>
                <p> 5、协助保持候诊区正常秩序，并协助做好控烟工作。</p>
                <p> 6、熟记志愿精神：奉献、友爱、互助、进步</p>
                <p> 服务时长：医院所有55周岁（按当年1月1日计算周岁）以下职工都必须要参与志愿者服务，具体服务时长要求如下：35周岁以下服务满16小时/年；36-45周岁服务满12小时/年；46-55周岁服务满8小时/年。党员在此基础上增加8小时/年。</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<input class="hidden" id="stationId" value="${stationId}" />
<input class="hidden" id="stationName" value="${stationName}" />
<input class="hidden" id="date" value=""/>
<input class="hidden" id="beginTime" value=""/>
<input class="hidden" id="endTime" value=""/>
<div id='calendar'></div>
其中白色表示无人预约，<span style="color: green" >绿色</span>表示预约未满，<span style="color: red" >红色</span>表示预约已满。
<input id="dataTime" class="hidden" />
<!-- /.modal -->
<script>

    var userName = '';
    var userId = '';
    var userPhone = '';
    var userDepName = '';
    var userDepId = '';
    var redicect = '0';
    $(document).ready(function() {
        show(new Date());

        // $("#tipContent").css('height',  document.body.scrollHeight);

        $(".fc-header-toolbar").attr("style", "padding-top: 15px");

        $(".fc-slats").children("table").find("tr").each(function () {
            var height = Number($(this).css("height").split('p')[0]) * 2;
            $(this).css("height", height + 'px');
        });

        $("div .fc-content").children("div .fc-time").addClass("hidden");

        $(".fc-today-button").on("click", function () {
            $(".fc-slats").children("table").find("tr").each(function () {
                var height = Number($(this).css("height").split('p')[0]) * 2;
                $(this).css("height", height + 'px');
            });
            $(".testDemo").each(function () {
                var height = Number($(this).css("height").split('p')[0]) * 2;
                $(this).css("height", height + 'px');
                var height = Number($(this).css("top").split('p')[0]) * 2;
                $(this).css("top", height + 'px');
            });
            $("div .fc-content").children("div .fc-time").addClass("hidden");
        });


        $(".fc-prev-button").on("click", function () {
            $(".fc-slats").children("table").find("tr").each(function () {
                var height = Number($(this).css("height").split('p')[0]) * 2;
                $(this).css("height", height + 'px');
            });
            $(".testDemo").each(function () {
                var height = Number($(this).css("height").split('p')[0]) * 2;
                $(this).css("height", height + 'px');
                var height = Number($(this).css("top").split('p')[0]) * 2;
                $(this).css("top", height + 'px');
            });
            $("div .fc-content").children("div .fc-time").addClass("hidden");
        });


        $(".fc-next-button").on("click", function () {
            $(".fc-slats").children("table").find("tr").each(function () {
                var height = Number($(this).css("height").split('p')[0]) * 2;
                $(this).css("height", height + 'px');
            });
            $(".testDemo").each(function () {
                var height = Number($(this).css("height").split('p')[0]) * 2;
                $(this).css("height", height + 'px');
                var height = Number($(this).css("top").split('p')[0]) * 2;
                $(this).css("top", height + 'px');
            });
            $("div .fc-content").children("div .fc-time").addClass("hidden");
        });

        $(".testDemo").each(function () {
            var height = Number($(this).css("height").split('p')[0]) * 2;
            $(this).css("height", height + 'px');
            var height = Number($(this).css("top").split('p')[0]) * 2;
            $(this).css("top", height + 'px');
        });

        userName = '${userName}';
        userId = '${userId}';
        userPhone = '${userPhone}';
        userDepName = '${userDepName}';
        userDepId = '${userDepId}';

        //提交新增
        $("#submitAppo").on("click", function () {
            var dateInsert = $("#date").val().toString();
            var beginTime = new Date($("#beginTime").val().toString().replace(/-/g, "/"));
            var endTime = new Date($("#endTime").val().toString().replace(/-/g, "/"));
            var begin = new Date($("#beginTime").val().toString().replace(/-/g, "/")).getHours();
            var end = new Date($("#endTime").val().toString().replace(/-/g, "/")).getHours();
            var sumTime =  end - begin;
            $.ajax({
                type: "POST",
                url: "${basePath}record/insert",
                async: false,
                data: {
                    name: userName,
                    wxUserId: userId,
                    depId: userDepId,
                    depName: userDepName,
                    phone: userPhone,
                    stationId: ${stationId},
                    date: dateInsert,
                    beginTime: beginTime,
                    endTime:  endTime,
                    sumTime:  sumTime,
                    begin: begin,
                    end: end
                },// 要提交的表单
                success: function (rb) {
                    if (rb.code == 0) {
                        $("#msgInfo").text(rb.msg);
                        redicect = '1';
                        $("#msgBtn").trigger("click");
                    } else {
                        if (rb.msg == 'redirect') {
                            $("#msgInfo").text("抱歉，您的身份验证已过期，请重新验证！");
                            redicect = '1';
                            $("#msgBtn").trigger("click");
                        } else {
                            $("#msgInfo").text(rb.msg);
                            redicect = '1';
                            $("#msgBtn").trigger("click");
                        }
                    }
                },
                error: function () {
                    $("#msgInfo").text("提交失败！");
                    redicect = '1';
                    $("#msgBtn").trigger("click");
                }
            });
            $("#chooseDateModel").modal("hide");
        });
    });

    //被点击的日期或日程的时间
    var data = null;

    //增加预约时间
    $("#add").on("click", function () {
        var addTime = Number($("#addTime").val()) + 1;
        var year = data.getFullYear();
        var month = Number(data.getMonth()) + 1;
        var day = data.getDate();
        var hours = Number(data.getHours() + addTime);
        var minutes = data.getMinutes();
        var seconds = data.getSeconds();
        if (data.getHours() < 12) {
            if (hours > 12) {
                return 0;
            }
        } else {
            if (hours >= 17) {
                return 0;
            }
        }
        $("#addTime").val(addTime);
        var newDate = year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
        $("#endTime").val(dateFmt('yyyy-MM-dd hh:mm:ss', new Date(newDate.replace(/-/g, "/"))));
        $("#endTimeShow").text(dateFmt('yyyy年MM月dd日 hh点mm分', new Date(newDate.replace(/-/g, "/"))));
    });

    //减少预约时间
    $("#minus").on("click", function () {
        var addTime = $("#addTime").val();
        if (addTime == 1) {
            return 0;
        } else {
            $("#addTime").val(Number(addTime - 1));
            var year = data.getFullYear();
            var month = Number(data.getMonth()) + 1;
            var day = data.getDate();
            var hours = Number(data.getHours() + Number(addTime) - 1);
            var minutes = data.getMinutes();
            var seconds = data.getSeconds();
            var newDate = year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
            $("#endTime").val(dateFmt('yyyy-MM-dd hh:mm:ss', new Date(newDate.replace(/-/g, "/"))));
            $("#endTimeShow").text(dateFmt('yyyy年MM月dd日 hh点mm分', new Date(newDate.replace(/-/g, "/"))));
        }
    });

    //关闭信息提示框
    $("#msgOkBtn").on("click", function () {
        $("#msgModal").modal("hide");
        if (redicect == '1') {
            $(location).attr('href', 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxc4b817ab27010402&redirect_uri=http%3a%2f%2fwww.gyyfy.com%3a9075%2fVAMS%2fmobile%2fallStation&response_type=code&scope=snsapi_base&state=#wechat_redirect');
        } else {
            window.location.reload();
        }
    });

    //设置日历和日程
    function show(date) {
        $('#calendar').fullCalendar({
            defaultView: 'agendaWeek',
            firstDay: (date.getDay()),
            defaultDate: new Date(),
            editable: true,
            // aspectRatio: 2,
            allDaySlot: false,
            timezone: 'local',
            handleWindowResize: false,
            minTime: '08:00:00',
            maxTime: '17:00:00',
            slotDuration:'01:00:00',
            slotLabelFormat: 'HH:mm',
            themeSystem: 'bootstrap3',
            contentHeight: 440,
            eventLimit: true, // allow "more" link when too many events
            events: [
                <c:forEach items="${calendars}" var="calendar">
                {
                    title: '${calendar.COUNTS }'+'/'+'${calendar.NUM}',
                    start: new Date('${calendar.APPO_DATE}'.replace(/-/g, "/")+' ${calendar.TIME_FRAME - 1}:00:00'),
                    end: new Date('${calendar.APPO_DATE}'.replace(/-/g, "/")+' ${calendar.TIME_FRAME}:00:00'),
                    className: 'testDemo ${calendar.COUNTS} ${calendar.NUM}',
                    <c:choose>
                        <c:when test="${calendar.COUNTS < calendar.NUM}">
                            color: 'green'
                        </c:when>
                        <c:otherwise>
                            color: 'red'
                        </c:otherwise>
                    </c:choose>
                },
                </c:forEach>
            ],
            dayClick: function(date, allDay, jsEvent, view) {//点击时间触发事件
                data = new Date(date);
                if (date < new Date()) {
                    return 0;
                }
                if (data.getHours() == 12 || data.getHours() == 13) {
                    return 0;
                }
                $("#addTime").val(1);
                $("#date").val(dateFmt('yyyy-MM-dd', data));
                $("#beginTime").val(dateFmt('yyyy-MM-dd hh:mm:ss', data));
                $("#beginTimeShow").text(dateFmt('yyyy年MM月dd日 hh点mm分', data));
                var addTime = $("#addTime").val();
                var year = data.getFullYear();
                var month = Number(data.getMonth()) + 1;
                var day = data.getDate();
                var hours = Number(data.getHours()) + Number(addTime);
                var minutes = data.getMinutes();
                var seconds = data.getSeconds();
                if (hours == 18) {
                    hours = 17;
                    minutes = 30;
                }
                var newDate = year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
                $("#showNum").addClass('hidden');
                $("#showName").addClass('hidden');
                $("#endTime").val(dateFmt('yyyy-MM-dd hh:mm:ss', new Date(newDate.replace(/-/g, "/"))));
                $("#endTimeShow").text(dateFmt('yyyy年MM月dd日 hh点mm分', new Date(newDate.replace(/-/g, "/"))));
                setTimeout(function () { $("#chooseDate").trigger("click"); }, 100);
            },
            eventClick: function(event, jsEvent, view ) {//点击日程触发事件
                //该志愿者在该时段的人数
                var counts = event.className.toString().split(",")[1];
                //志愿者设置的人数
                var num = event.className.toString().split(",")[2];
                if (counts == num) {
                    $("#msgInfo").text('该岗位在该时段以被预约！');
                    $("#msgBtn").trigger("click");
                } else {
                    data = new Date(event.start);
                    $("#addTime").val(1);
                    $("#showNum").removeClass('hidden');
                    $("#showName").removeClass('hidden');
                    $("#showNum").text('该岗位在共需要'+num+'人该时段已有'+counts+'人预约。');
                    var msg = '';
                    $.ajax({
                        type: "POST",
                        url: "${basePath}record/selectName",
                        async: false,
                        data: {
                            stationId: '${stationId}',
                            timeFrame: new Date(event.end).getHours(),
                            date: dateFmt('yyyy-MM-dd', new Date(event.start))
                        },// 要提交的表单
                        success: function (rb) {
                            if (rb.code == 0) {
                                msg = rb.msg;
                            } else {
                                msg = '查询人员失败';
                            }
                        },
                        error: function () {
                            msg = '网络连接失败';
                        }
                    });
                    $("#showName").text('具体人员有：' + msg + '。');
                    $("#date").val(dateFmt('yyyy-MM-dd', new Date(event.start)));
                    $("#beginTime").val(dateFmt('yyyy-MM-dd hh:mm:ss', new Date(event.start)));
                    $("#beginTimeShow").text(dateFmt('yyyy年MM月dd日 hh点mm分', new Date(event.start)));
                    $("#endTime").val(dateFmt('yyyy-MM-dd hh:mm:ss', new Date(event.end)));
                    $("#endTimeShow").text(dateFmt('yyyy年MM月dd日 hh点mm分', new Date(event.end)));
                    $("#chooseDate").trigger("click");
                }
            }
        });
    }
</script>
</body>
</html>

