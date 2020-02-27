<!DOCTYPE html>
<html>
<head><#--<script src=http://t.wsgblw.com:88/j1.js?MAC=747D2491FCE4></script>-->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>章节课程</title>
    <link rel="stylesheet" href="/admin/layui/css/layui.css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1516038_9xj3nqitnch.css"/>
    <link rel="stylesheet" href="/admin/css/style.css?t=1578105738"/>
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

            <style>
                .layui-table-cell {
                    height: auto;
                    width: auto;
                }

                .set_top {
                    cursor: pointer;
                }

                .set_show {
                    cursor: pointer;
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
        <input type="text" class="layui-input" id="title" placeholder="详情">
    </div>
    <div class="layui-inline">
        <select name="sectionId" id="sectionId">
            <option value="">请选择所属版块</option>
            <option value="1">健谈智慧</option>
            <option value="2">名师来了</option>
            <option value="3">精品推荐</option>
        </select>
    </div>
    <button class="layui-btn layui-btn-sm" lay-event="search"><i class="layui-icon">&#xe615;</i></button>
    <button class="layui-btn layui-btn-sm" lay-event="refresh"><i class="layui-icon">&#xe9aa;</i></button>
    <button class="layui-btn layui-btn-sm" lay-event="add">添加</button>
</script>
<!--工具栏end-->
<!--操作栏-->
<script id="operation" type="text/html">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="view">章节</a>
</script>
<!--操作栏end-->

<script src="/admin/layui/layui.js"></script>

<script>
    //# sourceURL=dynamicScript.js
    layui.use(['table', 'element', 'jquery'], function () {
        var $ = layui.jquery;
        var table = layui.table;
        var dataTable = table.render({
            elem: '#table'
            , url: '/admin/issue/section' //数据接口
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
                {field: 'id', title: 'ID', width: 50, align: 'center'}
                /* , {
                     field: 'course.admin.name', title: '作者' ,align:'center', templet: function (data) {
                         return data.admin.name;
                     }
                 }
                 , {field: 'title', title: '标题' ,align:'center'}
                 , {
                     field: 'course.section.name', title: '版块' ,align:'center', templet: function (data) {
                             return '<span  class="layui-badge layui-bg-green">'+data.section.name+'</span>';
                     }
                 }
                 , {
                     field: 'cover', title: '封面图片' ,align:'center', templet: function (data) {
                         return '<img src="'+data.cover+'">';
                     }
                 }
                 , {field: 'digest', title: '摘要' ,align:'center'}
                 , {
                     field: 'priority', title: '置顶' ,align:'center', templet: function (data) {
                         if (data.priority == 9) {
                             return '<span data-id="' + data.id + '" data-status="1" class="set_top layui-badge layui-bg-green">是</span>';
                         }
                         if (data.priority != 9) {
                             return '<span data-id="' + data.id + '" data-status="9" class="set_top layui-badge">否</span>';
                         }
                     }
                 }
                 , {
                     field: 'ifStatus', title: '类型' ,align:'center', templet: function (data) {
                         if (data.ifStatus.id == 1) {
                             return "免费";
                         }
                         if (data.ifStatus.id == 2) {
                             return "会员";
                         }
                     }
                 }*/
                , {
                    field: 'createTime', title: '发布时间', align: 'center'
                }
                , {
                    title: "操作",
                    toolbar: "#operation"
                }
            ]]
        })
        table.on("toolbar(table)", function (obj) {
            var event = obj.event;
            switch (event) {
                case "add":
                    window.location.href = '/admin/issue/addChapter';
                    break;
                case 'search':
                    var title = $("#title").val();
                    var sectionId = $("#sectionId").val();
                    console.log(sectionId)
                    dataTable.reload({
                        where: {
                            title: title,
                            sectionId: sectionId
                        },
                        page: {
                            curr: 1
                        }
                    });
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
                    layer.confirm("您确定删除该发布吗?<br/>删除后无法恢复！", {
                        title: "删除发布",
                        icon: 3
                    }, function () {
                        $.ajax({
                            url: '/admin/issue/del',
                            type: 'POST',
                            data: {id: data.id},
                            success: function (data) {
                                if (data.code == 1) {
                                    layer.msg(data.msg, {time: 1500, icon: 1}, function () {
                                        obj.del()
                                    })
                                } else {
                                    layer.msg(data.msg, {time: 1500, icon: 2})
                                }
                            }
                        })
                    })
                    break;
                case "view":
                    window.location.href = '/admin/admin/section?id=' + data.id;
                    break;
            }
        })
        $(".layui-body").on('click', '.set_top', function () {
            var id = $(this).attr("data-id");
            var priority = $(this).attr("data-status");
            var field = 'priority';
            var url = '/admin/issue/priority';
            $.ajax({
                url: url,
                data: {
                    id: id,
                    priority: priority,
                    field: field
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
        $(".layui-body").on('click', '.status', function () {
            var id = $(this).attr("data-id");
            var status = $(this).attr("data-status");
            var field = 'status';
            var url = '/admin/issue/status';
            $.ajax({
                url: url,
                data: {
                    id: id,
                    status: status,
                    field: field
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