<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018-11-24
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018-11-24
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="../../common/common.jsp" %>
    <script type="text/javascript" src="${basePath}/static/common/common.js"></script>
    <!-- MyDate97 -->
    <script src="${basePath}/static/assets/libs/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<div id="wrapper">
    <div class="panel-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="col-lg-2">
                            <button title="添加" type="button" id="insertBtn" data-placement="left" data-toggle="modal"
                                    data-target="#insertModal"
                                    class="btn btn-success btn-sm">
                                <i class="fa fa-plus"></i> 添加
                            </button>
                            <%--<button class="btn btn-sm btn-danger" id="deleteBatchBtn">--%>
                            <%--<i class="fa fa-trash fa-btn"></i>批量删除--%>
                            <%--</button>--%>
                            <!-- /.panel-heading -->
                        </div>
                        <div class="col-lg-10">
                            <form class="form-inline pull-right" action="">
                                <div class="form-group" style="margin:5px">
                                    <label for="appointmentName" class="control-label"
                                           style="padding:0 5px">预约人姓名：</label>
                                    <input type="text" class="form-control" id="appointmentName">
                                </div>
                                <div class="form-group" style="margin:5px">
                                    <label for="stationNameQuery" class="control-label"
                                           style="padding:0 5px">预约人岗位名称：</label>
                                    <input type="text" class="form-control" id="stationNameQuery">
                                </div>
                                <div class="form-group" style="margin:5px">
                                    <label for="beginTimeQuery" class="control-label"
                                           style="padding:0 5px">开始时间：</label>
                                    <input type="text" class="form-control" id="beginTimeQuery" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH',maxDate:'#F{$dp.$D(\'endTimeQuery\')}'})">
                                </div>
                                <div class="form-group" style="margin:5px">
                                    <label for="endTimeQuery" class="control-label"
                                           style="padding:0 5px">结束时间：</label>
                                    <input type="text" class="form-control" id="endTimeQuery" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH',minDate:'#F{$dp.$D(\'beginTimeQuery\')}'})">
                                </div>
                                <div class="form-group">
                                    <div class="text-center">
                                        <button type="button" id="searchBtn" class="btn btn-primary btn-sm">
                                            <i class="fa fa-search fa-btn"></i>搜索
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <table id="datatable" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>姓名</th>
                                <th>科室</th>
                                <th>电话号码</th>
                                <th>预约岗位</th>
                                <th>开始时间</th>
                                <th>结束时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="modals">
    <!-- insertModal -->
    <div class="modal fade" id="insertModal" tabindex="-1" data-backdrop="false" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">添加记录</h4>
                </div>
                <div class="modal-body">
                    <form class="form-inline" action="">
                        <div class="row">
                            <div class="col-lg-6 form-group">
                                <label for="nameInsert" class="control-label" style="padding:0 5px">姓名：</label>
                                <input id="nameInsert" class="form-control">
                            </div>
                            <div class="col-lg-6 form-group">
                                <label for="depNameInsert" class="control-label" style="padding:0 5px">所属科室：</label>
                                <input id="depNameInsert" class="form-control">
                                <input id="depIdInsert" value="1" class="form-control hidden">
                            </div>
                        </div>
                        <div class="row" style="padding-top: 20px">
                            <div class="col-lg-6 form-group">
                                <label for="phoneInsert" class="control-label" style="padding:0 5px">电话：</label>
                                <input id="phoneInsert" class="form-control">
                            </div>
                            <div class="col-lg-6 form-group">
                                <label for="stationIdInsert" class="control-label" style="padding:0 5px">预约岗位：</label>
                                <select class="form-control" id="stationIdInsert">
                                    <c:forEach items="${stationList}" var="stations">
                                        <option sign="optionInsert" value="${stations.ID}">${stations.NAME}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row" style="padding-top: 20px">
                            <div class="col-lg-6 form-group">
                                <label for="dateInsert" class="control-label" style="padding:0 5px">预约日期：</label>
                                <input id="dateInsert" class="form-control" style="width: 168px"
                                       onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd ',minDate:'%y-%M-{%d+1}'})">
                            </div>
                            <div class="col-lg-6 form-group" style="padding-top: 5px">
                                <label class="control-label" style="padding:0 5px">选择时段</label>
                                <label class="radio-inline">
                                    <input type="radio" class="timeInterval" name="time" sign="AM" checked>上午
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" class="timeInterval" name="time" sign="PM">下午
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" class="timeInterval" name="time" sign="ZD">自定义
                                </label>
                            </div>
                        </div>
                        <div class="row" style="padding-top: 20px">
                            <div class="col-lg-6 form-group">
                                <label for="beginTimeInsert" class="control-label" style="padding:0 5px">开始时间：</label>
                                <input id="beginTimeInsert" class="form-control beginTime" style="width: 168px">
                            </div>
                            <div class="col-lg-6 form-group">
                                <label for="endTimeInsert" class="control-label" style="padding:0 5px">结束时间：</label>
                                <input id="endTimeInsert" class="form-control endTime" style="width: 172px">
                            </div>
                        </div>
                    </form>
                </div>
                <span></span>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="submitInsert">确认新增</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <button title="修改" type="button" id="updateBtn" data-placement="left" data-toggle="modal" data-target="#updateModal"
            class="btn btn-warning btn-sm hidden">
        <i class="fa fa-edit"></i> 修改
    </button>
    <!-- updateModal -->
    <div class="modal fade" id="updateModal" tabindex="-1" data-backdrop="false" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">修改记录</h4>
                </div>
                <div class="modal-body">
                    <form class="form-inline" action="">
                        <div class="row">
                            <div class="col-lg-6 form-group">
                                <label for="nameUpdate" class="control-label" style="padding:0 5px">姓名：</label>
                                <input id="nameUpdate" class="form-control">
                                <input id="idUpdate" class="form-control hidden">
                            </div>
                            <div class="col-lg-6 form-group">
                                <label for="depNameUpdate" class="control-label" style="padding:0 5px">所属科室：</label>
                                <input id="depNameUpdate" class="form-control">
                                <input id="depIdUpdate" value="1" class="form-control hidden">
                            </div>
                        </div>
                        <div class="row" style="padding-top: 20px">
                            <div class="col-lg-6 form-group">
                                <label for="phoneUpdate" class="control-label" style="padding:0 5px">电话：</label>
                                <input id="phoneUpdate" class="form-control">
                            </div>
                            <div class="col-lg-6 form-group">
                                <label for="stationIdUpdate" class="control-label" style="padding:0 5px">预约岗位：</label>
                                <select class="form-control" id="stationIdUpdate">
                                    <c:forEach items="${stationList}" var="stations">
                                        <option value="${stations.ID}">${stations.NAME}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row" style="padding-top: 20px">
                            <div class="col-lg-6 form-group">
                                <label for="dateUpdate" class="control-label" style="padding:0 5px">预约日期：</label>
                                <input id="dateUpdate" class="form-control" style="width: 168px"
                                       onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd ',minDate:'%y-%M-{%d+1}'})">
                            </div>
                            <div class="col-lg-6 form-group" style="padding-top: 5px">
                                <label class="control-label" style="padding:0 5px">选择时段</label>
                                <label class="radio-inline">
                                        <input type="radio" class="timeIntervalUpdate timeInterval" name="time" sign="AM" checked>上午
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" class="timeIntervalUpdate timeInterval" name="time" sign="PM">下午
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" class="timeIntervalUpdate timeInterval" name="time" sign="ZD">自定义
                                </label>
                            </div>
                        </div>
                        <div class="row" style="padding-top: 20px">
                            <div class="col-lg-6 form-group">
                                <label for="beginTimeUpdate" class="control-label" style="padding:0 5px">开始时间：</label>
                                <input id="beginTimeUpdate" class="form-control beginTime" style="width: 168px">
                            </div>
                            <div class="col-lg-6 form-group">
                                <label for="endTimeUpdate" class="control-label" style="padding:0 5px">结束时间：</label>
                                <input id="endTimeUpdate" class="form-control endTime" style="width: 172px">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="submitUpdate">确认修改</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <button title="删除" type="button" id="deleteBtn" data-placement="left" data-toggle="modal" data-target="#deleteModal"
            class="btn btn-danger btn-sm hidden">
        <i class="fa fa-trash"></i> 删除
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
        var datatable;

        function initDatatable() {
            datatable = $('#datatable').DataTable({
                "dom": 'rt<"dataTables_page"<"col-sm-6 col-xs-12"il><"col-sm-6 col-xs-12"p>>',
                "lengthChange": true,//选择lenth
                "autoWidth": false,//自动宽度
                "searching": false,//搜索
                "processing": false,//loding
                "serverSide": true,//服务器模式
                "ordering": false,//排序
                "pageLength": 10,//初始化lenth
                "deferRender": true,
                "language": {
                    "url": "${basePath}static/assets/language/zh_cn.json"
                },
                "ajax": {
                    "url": "${basePath}record/list",
                    "type": "post",
                    "data": function (d) {
                        d.stationName = $("#stationNameQuery").val();
                        d.appointmentName = $("#appointmentName").val();
                        d.beginTime = $("#beginTimeQuery").val();
                        d.endTime = $("#endTimeQuery").val();
                    }
                },
                "columns": [
                    {
                        "data": "ID",
                        render: function (data, type, row, hang) {
                            return (datatable.context[0]._iDisplayStart + (hang.row + 1));
                        }
                    },
                    {"data": "NAME"},
                    {"data": "DEP_NAME"},
                    {"data": "PHONE"},
                    {"data": "STATIONNAME"},
                    {
                        "data": "BEGIN_TIME",
                        render: function (data, type, row) {
                            return dateFmt("yyyy-MM-dd hh:mm:ss", new Date(data));
                        }
                    },
                    {
                        "data": "END_TIME",
                        render: function (data, type, row) {
                            return dateFmt("yyyy-MM-dd hh:mm:ss", new Date(data));
                        }
                    },
                    {
                        "data": "ID",
                        "render": function (data, type, row) {
                            return '<button class="btn btn-xs btn-warning updateBtn" rid="' + row.ID + '">'
                                + '<i class="fa fa-edit fa-btn"></i>修改'
                                + '</button>&nbsp;&nbsp;'
                                + '<button class="btn btn-xs btn-danger deleteBtn" rid="' + row.ID + '">'
                                + '<i class="fa fa-trash fa-btn"></i>删除'
                                + '</button>';
                        }
                    }
                ],
                "fnDrawCallback": function () {

                }
            });
        }

        $(function () {

            //初始化datatable
            initDatatable();

            $("#beginTimeInsert").bind("click", function () {
                WdatePicker({el:this,dateFmt:'HH',maxDate:'#F{$dp.$D(\'endTimeInsert\')}',minTime:'08:00:00',maxTime:'12:00:00'})
            });
            $("#endTimeInsert").bind("click", function () {
                WdatePicker({el:this,dateFmt:'HH',minDate:'#F{$dp.$D(\'beginTimeInsert\')}',minTime:'08:00:00',maxTime:'12:00:00'})
            });

        });

        //搜索
        $("#searchBtn").on("click", function () {
            datatable.ajax.reload(null, false);
        });

        $(".timeInterval").on("click", function () {
            var sign = $(this).attr("sign");
            $(".beginTime").unbind();
            $(".endTime").unbind();
            if (sign == 'AM') {
                $(".beginTime").bind("click", function () {
                    WdatePicker({el:this,dateFmt:'HH',maxDate:'#F{$dp.$D(\'endTimeInsert\')}',minTime:'08:00:00',maxTime:'12:00:00'})
                });
                $(".endTime").bind("click", function () {
                    WdatePicker({el:this,dateFmt:'HH',minDate:'#F{$dp.$D(\'beginTimeInsert\')}',minTime:'08:00:00',maxTime:'12:00:00'})
                });
            } else if (sign == 'PM') {
                $(".beginTime").bind("click", function () {
                    WdatePicker({el:this,dateFmt:'HH',maxDate:'#F{$dp.$D(\'endTimeInsert\')}',minTime:'14:00:00',maxTime:'17:00:00'})
                });
                $(".endTime").bind("click", function () {
                    WdatePicker({el:this,dateFmt:'HH',minDate:'#F{$dp.$D(\'beginTimeInsert\')}',minTime:'14:00:00',maxTime:'17:00:00'})
                });
            } else if (sign == 'ZD') {
                $(".beginTime").bind("click", function () {
                    WdatePicker({el:this,dateFmt:'HH',maxDate:'#F{$dp.$D(\'endTimeInsert\')}'})
                });
                $(".endTime").bind("click", function () {
                    WdatePicker({el:this,dateFmt:'HH',minDate:'#F{$dp.$D(\'beginTimeInsert\')}'})
                });
            }
        });

        //一起弹
        // $(document).on("click", "#insertBtn", function () {
        //     alert("休息休息");
        // });
        //先弹
        // $("#insertBtn").on("click", function () {
        //     alert("休息休息");
        // });

        //插入前清空输入框
        $("#insertBtn").on("click", function () {
            $("#nameInsert").val('');
            $("#depIdInsert").val(0);
            $("#depNameInsert").val('');
            $("#phoneInsert").val('');
            $("#dateInsert").val('');
            $("#beginTimeInsert").val('');
            $("#endTimeInsert").val('');
        });

        $(document).on("click", "option [sign='optionInsert']", function () {
            alert();
        });

        //提交新增
        $("#submitInsert").on("click", function () {
            var dateInsert = $("#dateInsert").val().toString();
            var beginTime = dateInsert + $("#beginTimeInsert").val().toString() + ':00:00';
            var endTime = dateInsert + $("#endTimeInsert").val().toString() + ':00:00';
            $.ajax({
                type: "POST",
                url: "${basePath}record/insert",
                data: {
                    name: $("#nameInsert").val(),
                    depId: $("#depIdInsert").val(),
                    depName: $("#depNameInsert").val(),
                    phone: $("#phoneInsert").val(),
                    stationId: $("#stationIdInsert").val(),
                    date: dateInsert,
                    beginTime: new Date(beginTime),
                    endTime:  new Date(endTime),
                    begin: Number($("#beginTimeInsert").val()),
                    end: Number($("#endTimeInsert").val())
                },// 要提交的表单
                success: function (rb) {
                    if (rb.code == 0) {
                        datatable.ajax.reload(null, false);
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
            $("#insertModal").modal("hide");
        });

        //获取记录信息
        $(document).on("click", ".updateBtn", function () {
            var id = $(this).attr("rid");
            $.ajax({
                type: "POST",
                url: "${basePath}record/selectById",
                data: {
                    id: id
                },// 要提交的表单
                success: function (rb) {
                    if (rb.code == 0) {
                        var recordData = rb.data;
                        $("#idUpdate").val(recordData.ID);
                        $("#nameUpdate").val(recordData.NAME);
                        $("#depIdUpdate").val(recordData.DEP_ID);
                        $("#depNameUpdate").val(recordData.DEP_NAME);
                        $("#phoneUpdate").val(recordData.PHONE);
                        $("#stationIdUpdate").val(recordData.STATION_ID);
                        $("#dateUpdate").val(dateFmt("yyyy-MM-dd ", new Date(recordData.BEGIN_TIME)));
                        $("#beginTimeUpdate").val(dateFmt("hh", new Date(recordData.BEGIN_TIME)));
                        $("#endTimeUpdate").val(dateFmt("hh", new Date(recordData.END_TIME)));
                        $("#updateBtn").trigger("click");
                        var beginH = Number(dateFmt("hh", new Date(recordData.BEGIN_TIME)));
                        var endH = Number(dateFmt("hh", new Date(recordData.END_TIME)));
                        if (beginH >= 8 && beginH <= 12 && endH >= 8 && endH <= 12) {
                            $(".timeIntervalUpdate").each(function () {
                                $(this).removeAttr("checked");
                                if ($(this).attr("sign") == 'AM') {
                                    $(this).trigger("click");
                                }
                            });
                        } else if (beginH >= 14 && beginH <= 17 && endH >= 14 && endH <= 17) {
                            $(".timeIntervalUpdate").each(function () {
                                $(this).removeAttr("checked");
                                if ($(this).attr("sign") == 'PM') {
                                    $(this).trigger("click");
                                }
                            });
                        } else {
                            $(".timeIntervalUpdate").each(function () {
                                $(this).removeAttr("checked");
                                if ($(this).attr("sign") == 'ZD') {
                                    $(this).trigger("click");
                                }
                            });
                        }
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

        //确认修改
        $("#submitUpdate").on("click", function () {
            var dateUpdate = $("#dateUpdate").val().toString();
            var beginTime = dateUpdate + $("#beginTimeUpdate").val().toString() + ':00:00';
            var endTime = dateUpdate + $("#endTimeUpdate").val().toString() + ':00:00';
            $.ajax({
                type: "POST",
                url: "${basePath}record/update",
                data: {
                    id: $("#idUpdate").val(),
                    name: $("#nameUpdate").val(),
                    depId: $("#depIdUpdate").val(),
                    depName: $("#depNameUpdate").val(),
                    phone: $("#phoneUpdate").val(),
                    stationId: $("#stationIdUpdate").val(),
                    date: dateUpdate,
                    beginTime: new Date(beginTime),
                    endTime:  new Date(endTime),
                    begin: Number($("#beginTimeUpdate").val()),
                    end: Number($("#endTimeUpdate").val())
                },// 要提交的表单
                success: function (rb) {
                    if (rb.code == 0) {
                        datatable.ajax.reload(null, false);
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
            $("#updateModal").modal("hide");
        });

        //触发弹框
        $(document).on("click", ".deleteBtn", function () {
            var id = $(this).attr("rid");
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
                        datatable.ajax.reload(null, false);
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
        })
    </script>
</div>
</body>
</html>
