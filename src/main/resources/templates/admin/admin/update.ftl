<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/admin/layui/css/layui.css">
</head>
<body>
<style>
    .layui-form {
        width: 90%;
        margin: 0 auto;
        padding-top: 20px;
    }
</style>
<form class="layui-form layui-form-pane">
    <input type="hidden" name="id" value="${admin.id!}" class="layui-input must">
    <div class="layui-form-item">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-block">
            <input type="text" name="name" value="${admin.name!}" class="layui-input must">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input type="password" name="password" placeholder="请输入管理员密码" class="layui-input must">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">选择框</label>
        <div class="layui-input-block">
            <select name="roleId" lay-verify="required">
                <option value=""></option>
                <option value="1">老板</option>
                <option value="2">经理</option>
                <option value="3">组长</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="button" class="layui-btn" lay-submit lay-filter="add">修改</button>
            <button type="reset" class="layui-btn layui-btn-normal">重置</button>
        </div>
    </div>

</form>
<script src="/admin/layui/layui.js"></script>
<script>
    layui.use(['form', 'layer', 'jquery'], function () {
        let form = layui.form;
        let $ = layui.jquery;
        let layer = layui.layer;

        form.on("submit(add)", function (obj) {
            $.ajax({
                url: "/admin/admin/update",
                type: "post",
                data: JSON.stringify(obj.field),
                contentType: "application/json;charset=utf-8",
                success: function (ret) {
                    if (ret.code == 1) {
                        layer.msg(ret.msg, {icon: 1, time: 1000}, function () {
                            window.parent.location.reload();
                        });
                    } else {
                        layer.msg(ret.msg, {icon: 2});
                    }
                }
            });
            return false;
        });
    })
</script>
</body>
</html>