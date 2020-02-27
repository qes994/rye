<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加管理员</title>
    <link rel="stylesheet" type="text/css" href="/admin/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="/admin/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="/admin/css/style7.css"/>
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1516038_9xj3nqitnch.css"/>
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1597383_cm5k7u5qtoq.css"/>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <#include "../common/head.ftl"/>
    <#include "../common/right.ftl"/>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div class="box">
                <form class="layui-form" action="">
                    <div class="layui-form-item">
                        <label class="layui-form-label">用户名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="name" required lay-verify="required" placeholder="请输入用户名"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">手机号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="phone" required lay-verify="required" placeholder="请输入手机号"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">密码框</label>
                        <div class="layui-input-inline">
                            <input type="password" name="password" required lay-verify="required" placeholder="请输入密码"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">上传头像</label>
                        <div class="layui-input-block">
                            <img src="/admin/images/image1.png" id="test1" width="100px" height="100px"/>
                        </div>
                        <input type="hidden" name="head" id="head">
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
        <#include "../common/footer.ftl"/>
    </div>


</div>

<script type="text/javascript" src="/admin/layui/layui.all.js"></script>
<script type="text/javascript" src="/admin/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/admin/plugins/jparticle.min.js"></script>
<script>
    var element = layui.element;
    var form = layui.form
    $("#btn").click(function () {
        var data = {}
        var froms = $("form").serializeArray();
        $.each(froms, function () {
            data[this.name] = this.value;
        })
        var admin = JSON.stringify(data);//转换成字符串
        console.log(admin)
        $.ajax({
            url: "/admin/admin/add",
            contentType: "application/json;charset=utf-8",
            data: admin,
            type: 'POST',
            success: function (data) {
                console.log(data)

                if (data.code == 1) {
                    layer.msg(data.msg, {
                        icon: 1,
                        time: 1500
                    }, function () {
                        //window.location.href="";
                    })
                } else {
                    layer.msg(data.msg)
                }

            }
        })
    })
    layui.use('upload', function () {
        var upload = layui.upload;
        var uploadInst = upload.render({
            elem: '#test1' //绑定元素
            , url: '/upload/image' //上传接口
            , done: function (res) {
                $("#head").val(res.url);
                $("#test1").attr("src", res.url);
                console.log(res)
                //上传完毕回调
            }
            , error: function () {
                //请求异常回调
            }
        });
    });
</script>

</body>
</html>