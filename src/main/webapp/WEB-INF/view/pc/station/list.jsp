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
</head>
<body>
<div id="wrapper">
    <div class="panel-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="col-lg-6">
                            <button title="添加" type="button" id="insertBtn" data-placement="left" data-toggle="modal" data-target="#insertModal"
                                    class="btn btn-success btn-sm">
                                <i class="fa fa-plus"></i> 添加
                            </button>
                            <%--<button class="btn btn-sm btn-danger" id="deleteBatchBtn">--%>
                                <%--<i class="fa fa-trash fa-btn"></i>批量删除--%>
                            <%--</button>--%>
                            <!-- /.panel-heading -->
                        </div>
                        <div class="col-lg-6">
                            <form class="form-inline pull-right" action="">
                                <div class="form-group" style="margin:5px">
                                    <label for="stationNameQuery" class="control-label" style="padding:0 5px">岗位名称</label>
                                    <input type="text" class="form-control" id="stationNameQuery">
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
                                <th>岗位名称</th>
                                <th>岗位人数</th>
                                <th>说明</th>
                            <%--<th>类型</th>--%>
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
    <div class="modal fade" id="insertModal" tabindex="-1"   data-backdrop="false" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">添加岗位</h4>
                </div>
                <form class="form-inline" action="" style="padding-left: 15px">
                    <div class="modal-body">
                        <div class="row">
                            <div class="form-group">
                                <label for="stationNameInsert" class="control-label" style="padding:0 5px">岗位名称：</label>
                                <input id="stationNameInsert" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="numInsert" class="control-label" style="padding:0 5px">岗位人数：</label>
                                <input id="numInsert" class="form-control" required>
                            </div>
                            <div class="form-group hidden">
                                <label for="sortInsert" class="control-label" style="padding:0 5px">岗位类别：</label>
                                <select class="form-control" id="sortInsert">
                                    <option value="0">固定时间</option>
                                    <option value="1">不固定时间</option>
                                </select>
                            </div>
                        </div>
                        <div class="row" style="padding-top: 20px">
                            <div class="form-group">
                                <label for="detailsInsert" class="control-label" style="padding:0 5px">岗位说明：</label>
                                <textarea class="form-control" id="detailsInsert" style="width: 478px;" required></textarea>
                            </div>
                        </div>
                    </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="submitInsert">确认新增</button>
                </div>
                </form>
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
    <div class="modal fade" id="updateModal" tabindex="-1"   data-backdrop="false" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">修改岗位</h4>
                </div>
                <form class="form-inline" action="" style="padding-left: 15px">
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">
                            <label for="stationNameUpdate" class="control-label" style="padding:0 5px">岗位名称：</label>
                            <input id="stationNameUpdate" class="form-control">
                            <input id="stationIdUpdate" class="form-control hidden">
                        </div>
                        <div class="form-group">
                            <label for="numUpdate" class="control-label" style="padding:0 5px">岗位人数：</label>
                            <input id="numUpdate" class="form-control" required>
                        </div>
                        <div class="col-lg-6 form-group hidden">
                            <label for="sortUpdate" class="control-label" style="padding:0 5px">岗位类别：</label>
                            <select class="form-control" id="sortUpdate">
                                <option value="0">固定时间</option>
                                <option value="1">不固定时间</option>
                            </select>
                        </div>
                    </div>
                    <div class="row" style="padding-top: 20px">
                        <div class="form-group">
                            <label for="detailsUpdate" class="control-label" style="padding:0 5px">岗位说明：</label>
                            <textarea class="form-control" id="detailsUpdate" style="width: 478px;"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="submitUpdate">确认修改</button>
                </div>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <button title="删除" type="button" id="deleteBtn"  data-placement="left" data-toggle="modal" data-target="#deleteModal"
            class="btn btn-danger btn-sm hidden">
        <i class="fa fa-trash"></i> 删除
    </button>
    <!-- insertModal -->
    <div class="modal fade" id="deleteModal" tabindex="-1"   data-backdrop="false" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">删除岗位</h4>
                </div>
                <div class="modal-body">
                    <span id="deleteMsg">您确认要删除该岗位吗？</span>
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

    <button title="信息" type="button" id="msgBtn"  data-placement="left" data-toggle="modal" data-target="#msgModal"
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
                    "url": "${basePath}station/list",
                    "type": "post",
                    "data": function (d) {
                        d.stationName = $("#stationNameQuery").val();
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
                    {"data": "NUM"},
                    {"data": "DETAILS"},
                    // {"data": "sort"},
                    // {
                    //     "data": "INSERT_TIME",
                    //     render: function (data, type, row) {
                    //         return dateFmt("yyyy-MM-dd hh:mm:ss", new Date(data));
                    //     }
                    // },
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

        var validateForm;
        $(function () {

            //初始化datatable
            initDatatable();


        });

        //搜索
        $("#searchBtn").on("click", function () {
            datatable.ajax.reload(null, false);
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
            $("#stationNameInsert").val('');
            $("#sortInsert").val('0');
            $("#detailsInsert").val('')
        });

        //提交新增
        $("#submitInsert").on("click", function () {
            $.ajax({
                type: "POST",
                url: "${basePath}station/insert",
                data: {
                    name: $("#stationNameInsert").val(),
                    num: $("#numInsert").val(),
                    sort: $("#sortInsert").val(),
                    details: $("#detailsInsert").val()
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

        //获取岗位信息
        $(document).on("click", ".updateBtn", function () {
            var id = $(this).attr("rid");
            $.ajax({
                type: "POST",
                url: "${basePath}station/selectById",
                data: {
                    id: id
                },// 要提交的表单
                success: function (rb) {
                    if (rb.code == 0) {
                        var stationData = rb.data;
                        $("#stationIdUpdate").val(stationData.ID);
                        $("#stationNameUpdate").val(stationData.NAME);
                        $("#numUpdate").val(stationData.NUM);
                        $("#sortUpdate").val(stationData.SORT);
                        $("#detailsUpdate").val(stationData.DETAILS)
                        $("#updateBtn").trigger("click");
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
            $.ajax({
                type: "POST",
                url: "${basePath}station/update",
                data: {
                    id : $("#stationIdUpdate").val(),
                    name: $("#stationNameUpdate").val(),
                    num: $("#numUpdate").val(),
                    sort: $("#sortUpdate").val(),
                    details: $("#detailsUpdate").val()
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

        //确认该岗位是否有预约记录
        $(document).on("click", ".deleteBtn", function () {
            var id = $(this).attr("rid");
            $.ajax({
                type: "POST",
                url: "${basePath}station/selectByStationId",
                data: {
                    stationId: id
                },// 要提交的表单
                success: function (rb) {
                    if (rb.code == 0) {
                        var num = Number(rb.data);
                        if (num > 0) {
                            $("#deleteMsg").text("该岗位还有预约记录，您确定要删除吗？（岗位删除后预约记录也会删除）");
                        }
                        $("#deleteBtn").trigger("click");
                    } else {
                        $("#msgInfo").text(rb.msg);
                        $("#msgBtn").trigger("click");
                    }
                    $("#deleteId").val(id);
                },
                error: function () {
                    $("#msgInfo").text("提交失败！");
                    $("#msgBtn").trigger("click");
                }
            });
        });

        //删除岗位
        $(document).on("click", "#submitDelete", function () {
            var id = $("#deleteId").val();
            $.ajax({
                type: "POST",
                url: "${basePath}station/delete",
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
