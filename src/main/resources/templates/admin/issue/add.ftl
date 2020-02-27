<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新增课程</title>
    <link rel="stylesheet" type="text/css" href="/admin/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="/admin/css/style.css"/>
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1597383_cm5k7u5qtoq.css"/>
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1516038_9xj3nqitnch.css"/>
    <link rel="stylesheet" href="/admin/css/style.css?t=1578051216"/>
    <link rel="stylesheet" href="/admin/css/style1.css"/>
    <link rel="stylesheet" href="/home/webuploader/webuploader.css" charset="UTF-8"/>
    <style>
        .hide {
            display: none;
            padding-top: 15px;
        }

        .joint {
            float: left;
            margin-right: 0.07rem;
            position: relative;
        }

        .joint, .joint img {
            width: 80px;
            height: 80px;
            border-radius: 0.03rem;
            position: relative;
        }

        .joint .del-mask {
            height: 0.20rem;
            color: #fff;
            line-height: 0.20rem;
            background-color: rgba(0, 0, 0, 0.4);
            text-align: center;
            position: absolute;
            bottom: 0px;
            width: 100%;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <#include "../common/head.ftl"/>
    <#include "../common/right.ftl"/>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
           <span class="layui-breadcrumb">
              <a href="/admin/issue/wit">首页</a>
            </span>
            <div class="box">
                <form class="layui-form" id="form">
                    <div class="layui-form-item">
                        <label class="layui-form-label">标题</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" required lay-verify="required" id="title"
                                   placeholder="请输入标题" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">类型</label>
                        <div class="layui-input-block">
                            <select name="ifStatus" id="ifStatus">
                                <option value="">请选择所属类型</option>
                                <option value="1">免费</option>
                                <option value="2">vip</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">版块</label>
                        <div class="layui-input-block">
                            <select name="sectionId" lay-verify="required">
                                <option value=""></option>
                                <option value="1">健谈智慧</option>
                                <option value="2">名师来了</option>
                                <option value="3">精品推荐</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">摘要</label>
                        <div class="layui-input-block">
                            <textarea name="digest" placeholder="请输入摘要" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">上传封面图片</label>
                        <div class="layui-input-block">
                            <img src="/admin/images/image1.png" id="test1" width="100px" height="100px"/>
                        </div>
                        <input type="hidden" name="cover" id="cover">
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" type="button" id="btn" lay-filter="formDemo">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <#include "../common/footer.ftl"/>
</div>
<script type="text/javascript" src="/admin/layui/layui.all.js"></script>
<script type="text/javascript" src="/admin/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/home/webuploader/webuploader.js"></script>
<script>
    var element = layui.element;
    var form = layui.form
    var carousel = layui.carousel;
    var form = layui.form;
    var $ = layui.jquery;
    var jQuery = $;
</script>
<script>
    layui.use('upload', function () {
        var upload = layui.upload;

        //执行实例
        var uploadInst = upload.render({
            elem: '#test1' //绑定元素
            , url: '/upload/image' //上传接口
            , done: function (res) {
                $("#cover").val(res.url);
                $("#test1").attr("src", res.url);
                console.log(res)
                //上传完毕回调
            }
            , error: function () {
                //请求异常回调
            }
        });
        //发布
        $("#btn").click(function () {
            console.log("111")
            var data = {}
            var froms = $("#form").serializeArray();
            $.each(froms, function () {
                data[this.name] = this.value;
            })
            var object = JSON.stringify(data);//转换成字符串
            $.ajax({
                url: "/admin/issue/addWit",
                data: object,
                type: "POST",
                contentType: "application/json;charset=utf-8",
                success: function (data) {
                    if (data.code == 1) {
                        layer.msg(data.msg, {
                            icon: 1,
                            time: 1000
                        }, function () {
                            window.location.href = "/admin/issue/wit"
                        })
                    } else {
                        layer.msg(data.msg);
                    }
                }
            })
        })
    });
</script>
</body>
</html>