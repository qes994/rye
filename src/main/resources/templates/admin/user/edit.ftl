<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户信息</title>
    <link rel="stylesheet" type="text/css" href="/admin/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="/admin/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="/admin/css/style7.css"/>
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1516038_9xj3nqitnch.css"/>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <#include "../common/head.ftl"/>
    <#include "../common/right.ftl"/>

    <div class="layui-body">
        <input type="hidden" name="id" id="id" value="${user.id}">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div class="box">
                <form class="layui-form" action="">
                    <div class="layui-form-item">
                        <label class="layui-form-label">用户名</label>
                        <div class="layui-input-inline">
                            <input placeholder="${user.name!}" disabled="disabled" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">身份证号</label>
                        <div class="layui-input-inline">
                            <input placeholder="${auth.idCard!}" disabled="disabled" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">正面照片</label>
                        <img src="${auth.frontImage!}" width="300px" height="300px">
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">反面照片</label>
                        <img src="${auth.backImage!}" width="300px" height="300px">
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">是否</label>
                        <div class="layui-input-block">
                            <input type="radio" name="realName" value="1" title="实名">
                            <input type="radio" name="realName" value="2" title="未实名" checked>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button id="btn" class="layui-btn" type="button">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>


</div>

<script type="text/javascript" src="/admin/layui/layui.all.js"></script>
<script type="text/javascript" src="/admin/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/admin/plugins/jparticle.min.js"></script>
<script>
    var element = layui.element;
    var form = layui.form
    $("#btn").click(function () {
        var realName = $('input:radio[name="realName"]:checked').val()
        console.log(realName)
        var id = $("#id").val()
        $.ajax({
            url: "/admin/user/auth",
            data: {"realName": realName, "id": id},
            type: 'POST',
            success: function (data) {
                console.log(data)
                if (data.code == 1) {
                    layer.msg(data.msg);
                    window.location.href = "/admin/user/index";
                }
                layer.msg(data.msg);
            }
        })
    })

</script>

</body>
</html>