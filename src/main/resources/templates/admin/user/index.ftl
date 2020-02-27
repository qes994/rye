<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>用户管理后台</title>
    <link rel="stylesheet" href="/admin/layui/css/layui.css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1516038_9xj3nqitnch.css"/>
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1597383_cm5k7u5qtoq.css"/>
    <link rel="stylesheet" href="/admin/css/style.css?t=1578051216"/>
    <link rel="stylesheet" href="/admin/css/style1.css"/>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <#include "../common/head.ftl"/>

    <#include "../common/right.ftl"/>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <style>
                .layui-table-cell {
                    height: auto;
                    width: auto;
                }
            </style>
            <table id="table" lay-filter="table"></table>
        </div>
        <#include "../common/footer.ftl"/>
    </div>

</div>
<!--工具栏start-->
<script id="toolbar" type="text/html">
    <div class="layui-inline">
        <input type="text" class="layui-input" id="name" placeholder="输入用户昵称">
    </div>
    <button class="layui-btn layui-btn-sm" lay-event="search"><i class="layui-icon">&#xe615;</i></button>
    <button class="layui-btn layui-btn-sm" lay-event="refresh"><i class="layui-icon">&#xe9aa;</i></button>
</script>
<!--工具栏end-->
<!--操作栏-->
<script id="operation" type="text/html">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="auth">详情</a>
</script>
<!--操作栏end-->

<script src="/admin/layui/layui.all.js"></script>
<script>
    layui.use(['table', 'element', 'layer', 'jquery'], function () {
        var $ = layui.jquery;
        var table = layui.table;
        var dataTable = table.render({
            elem: '#table'
            , url: '/admin/user/index' //数据接口
            , method: 'POST'
            , page: true //开启分页
            , parseData: function (ret) {
                console.log(ret.data[1].status.name)
                return {
                    code: ret.code,
                    msg: ret.msg,
                    count: ret.count,
                    data: ret.data
                }
            }
            , toolbar: '#toolbar'
            , cols: [[ //表头
                {field: 'id', title: 'ID', width: 80, align: 'center'}
                , {field: 'userName', title: '昵称', align: 'center'}
                , {
                    field: 'head', title: '头像', align: 'center', templet: function (data) {
                        return '<img src="' + data.head + '" width="50" height="50">';
                    }
                }
                , {field: 'phone', title: '手机号', align: 'center'}
                , {
                    field: 'status', title: '用户状态', align: 'center', templet: function (data) {
                        if (data.status.id == 1) {
                            return '<span data-user-status="1" data-user-id="' + data.id + '" class="ustatus layui-badge layui-bg-green" style="cursor: pointer">正常</span>';
                        }
                        if (data.status.id == 2) {
                            return '<span data-user-status="2" data-user-id="' + data.id + '" class="ustatus layui-badge layui-bg-red" style="cursor: pointer">冻结</span>';
                        }
                    }
                }
                , {field: 'createTime', align: 'center', title: '注册时间'},
                {
                    title: "操作",
                    toolbar: "#operation"
                }
            ]]
        })
        table.on("toolbar(table)", function (obj) {
            var event = obj.event;
            switch (event) {
                case "add":
                    break;
                case 'search':
                    var name = $("#name").val();
                    var phone = $("#phone").val();
                    var status = $("#status").val();
                    dataTable.reload({
                        where: {
                            name: name,
                            phone: phone,
                            status: status
                        },
                        page: {
                            curr: 1
                        }
                    });
                    $("#name").val(name);
                    $("#phone").val(phone);
                    $("#status").val(status);
                    break;
                case 'refresh':
                    window.location.reload();
                    break;
            }
        })
        table.on("tool(table)", function (obj) {
            var event = obj.event;
            var data = obj.data;
            switch (event) {
                case "del":
                    layer.confirm("您确定删除该用户吗?<br/>删除后无法恢复！", {
                        title: "删除用户",
                        icon: 3
                    }, function () {
                        $.ajax({
                            url: '/admin/user/del',
                            type: 'POST',
                            data: {"id": data.id},
                            success: function (data) {
                                if (data.code == 1) {
                                    layer.msg(data.msg, {time: 1500, icon: 1}, function () {
                                        //window.location.reload();
                                        obj.del()
                                    })
                                } else {
                                    layer.msg(data.msg, {time: 1500, icon: 2})
                                }
                            }
                        })
                    })
                    break;
                case "auth":

                    if (data.realName == 3) {
                        layer.msg("该用户未提交审核要求", {icon: 2, time: 2000});
                    }
                    if (data.realName == 1) {
                        layer.msg("该账户已实名", {icon: 2, time: 2000});
                    }
                    if (data.realName == 2) {
                        //layer.msg("请慎重审核",{icon:2,time:2000});
                        window.location.href = "/admin/user/auth?id=" + data.id;
                    }

                    break;
            }
        })
        $(".layui-body").on('click', '.ustatus', function () {
            var id = $(this).attr("data-user-id");
            var status = $(this).attr("data-user-status");
            $.ajax({
                url: '/admin/user/status',
                data: {
                    id: id,
                    status: status
                },
                type: 'POST',
                success: function (data) {
                    if (data.code == 0) {
                        layer.msg(data.msg, {icon: 2, time: 2000});
                        return false;
                    }
                    layer.msg(data.msg, {icon: 1, time: 2000}, function () {
                        window.location.reload();
                    })
                }
            })
        })
    });
</script>
</body>
</html>