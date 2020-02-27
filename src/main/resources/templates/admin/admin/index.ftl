<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>管理员列表</title>
    <link rel="stylesheet" href="/admin/layui/css/layui.css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1516038_9xj3nqitnch.css"/>
    <link rel="stylesheet" href="/admin/css/style.css?t=1578049660"/>
    <link rel="stylesheet" href="/admin/css/style1.css"/>
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1597383_cm5k7u5qtoq.css"/>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <#include "../common/head.ftl"/>
    <#include "../common/right.ftl"/>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">

            <table id="table" lay-filter="table"></table>

        </div>
        <#include "../common/footer.ftl"/>
    </div>


</div>

<!--工具栏start-->
<script id="toolbar" type="text/html">
    <div class="layui-inline">
        <input type="text" class="layui-input" id="name" placeholder="输入账号名称">
    </div>
    <button class="layui-btn layui-btn-sm" lay-event="search"><i class="layui-icon">&#xe615;</i></button>
    <button class="layui-btn layui-btn-sm" lay-event="refresh"><i class="layui-icon">&#xe9aa;</i></button>
    <button class="layui-btn layui-btn-sm" lay-event="add">添加</button>
</script>
<!--工具栏end-->
<!--操作栏-->
<script id="operation" type="text/html">
    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<!--操作栏end-->
<script src="/admin/layui/layui.js"></script>
<script>
    layui.use(['table', 'jquery', 'element'], function () {
        var $ = layui.jquery;
        var table = layui.table;
        var dataTable = table.render({
            elem: '#table'
            , url: '/admin/admin/index' //数据接口
            , method: 'POST'
            , page: true //开启分页
            , parseData: function (ret) {
                console.log(ret)
                return {
                    code: ret.code,
                    msg: ret.msg,
                    count: ret.count,
                    data: ret.data
                }
            }
            , toolbar: '#toolbar'
            , cols: [[ //表头
                {field: 'id', title: 'ID', width: 80, sort: true, fixed: 'left', align: 'center'}
                , {field: 'name', title: '用户名', align: 'center'}
                , {field: 'phone', title: '手机号', align: 'center'}
                , {field: 'createTime', title: '注册时间', align: 'center'}
                , {
                    title: "操作",
                    toolbar: "#operation"
                    , align: 'center'
                }
            ]]
        })
        table.on("toolbar(table)", function (obj) {
            if (obj.event == 'search') {
                var name = $("#name").val();
                dataTable.reload({
                    where: {
                        name: name,
                    },
                    page: {
                        curr: 1
                    }
                });
                $("#name").val(name);
            } else if (obj.event == 'add') {
                layer.open({
                    type: 2,
                    title: "添加管理员",
                    shadeClose: true,
                    shade: 0.6,
                    area: ["500px", "350px"],
                    content: "/admin/admin/add"
                })
            } else {
                window.location.reload();
            }
        })
        table.on("tool(table)", function (obj) {
            var event = obj.event;
            var data = obj.data;
            switch (event) {
                case "edit":
                    layer.open({
                        type: 2,
                        title: "修改管理员",
                        shadeClose: true,
                        shade: 0.6,
                        area: ["500px", "350px"],
                        content: "/admin/admin/update?id=" + data.id
                    })
                    break;
                case "del":
                    layer.confirm("您确定删除该用户吗?<br/>删除后无法恢复！", {
                        title: "删除用户",
                        icon: 3
                    }, function () {
                        $.ajax({
                            url: '/admin/admin/del',
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
            }
        })
    });
</script>
</body>
</html>