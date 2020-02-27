<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新增章节</title>
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
            margin-right: 0.06rem;
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
                    <input type="hidden" name="courseId" id="courseId" value="${Session.courseId}"><#--课程id-->
                    <input type="hidden" name="videoUrl" id="videoUrl" value=""><#--视频地址-->
                    <input type="hidden" name="duration" value="" id="duration"><#--视频时长-->
                    <input type="hidden" name="cover" id="cover" value=""><#--简介表的封面图片-->
                    <input type="hidden" name="image" id="images" value=""><#--上传多张图片-->
                    <div class="layui-form-item">
                        <label class="layui-form-label">目录</label>
                        <div class="layui-input-block">
                            <input type="text" name="catalog" required lay-verify="required" id="catalog"
                                   placeholder="请输入目录名称" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">类型</label>
                        <div class="layui-input-block">
                            <select name="type" id="type">
                                <option value="">请选择所属类型</option>
                                <option value="1">免费</option>
                                <option value="2">vip</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">上传视频</label>
                        <video src="" controls preload="auto" id="player"></video>
                        <#--视频-->
                        <input value="" style="border-width: 0;" id="hide1" readonly="readonly">
                        <div class="layui-progress" lay-showpercent="true" lay-filter="demo" id="hide">
                            <div class="layui-progress-bar layui-bg-red" lay-percent="0%"></div>
                        </div>
                        <div class="layui-input-block upload">
                            <button type="button" id="test5">上传视频</button>
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">简介</label>
                        <div class="layui-input-block">
                            <textarea name="intro" placeholder="请输入目录简介" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">上传封面图片</label>
                        <div class="layui-input-block">
                            <img src="/admin/images/image1.png" id="test1" width="100px" height="100px"/>
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">上传多张图文</label>
                        <div class="layui-input-block upload">
                            <div id="upbox">
                            </div>
                            <button type="button" id="upload">上传图片</button>
                        </div>
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
        //上传视频
        upload.render({
            elem: '#test5'
            , url: '/upload/image'
            , accept: 'video' //视频
            , xhr: xhrOnProgress
            , progress: function (value) {//上传进度回调 value进度值
                //console.log(value+"///")
                element.progress('demo', value + '%')//设置页面进度条
            }
            , done: function (res) {
                console.log(res.url)
                $("#videoUrl").val(res.url)
                $("#hide1").val(res.url)
                $("#player").attr("src", res.url);
                setTimeout(function () {
                    var pl = document.getElementById("player");
                    time = pl.duration;
                    var number = Math.floor(time);
                    $("#duration").val(number)
                    console.log(number)
                }, 800);
            }
            , error: function (index, upload) {
                element.progress('demo', '0%');
                layer.msg('上传失败');
            }
        });
    });

    $(function () {
        $("#hide").addClass("hide");
    });
    $("#test5").click(function () {
        $("#hide").removeClass("hide");
    })

    var uplaoder = WebUploader.create({
        swf: 'https://cdn.staticfile.org/webuploader/0.1.1/Uploader.swf',
        // 存在文件自动上传
        pick: "#upload",
        auto: true,
        // 文件接收服务端地址。
        server: '/upload/image',
        // 限制文件类型
        accept: {
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png',
            mimeTypes: 'image/!*'
        },
        //fileNumLimit:6,
        //允许重复上传
        duplicate: true,
        //上传方式
        method: 'post',
        //设定单个文件大小 不能超过20M
        fileSingleSizeLimit: 20 * 1024 * 1024

    });
    uplaoder.on('uploadSuccess', function (file, reponse) {
        if (reponse.code == 1) {
            var html = '<div class="joint"><img src="' + reponse.url + '"/><div class="del-mask">删除</div></div>';
            $("#upbox").append(html)
            var images = $("#images").val();
            var arr = images.split(",");
            var image = [];
            for (var i = 0; i < arr.length; i++) {
                image.push(arr[i])
            }
            /* if (image.length==5){
                 layer.msg("最大上传六张图文")
             }*/
            if (images == "") {
                $("#images").val(reponse.url)
            } else {
                $("#images").val(images + "," + reponse.url)
            }
        }
    });
    /** 上传失败 */
    uplaoder.on('uploadError', function (file) {
        $('#' + file.id).find('.state').text('上传出错！');
    });
    $("#upbox").on("click", ".del-mask", function () {
        var $parent = $(this).parents(".joint");
        var src = $parent.find("img").attr("src");
        $parent.remove();
        var images = $("#images").val();
        var arr = images.split(",");
        var tmp = [];
        for (var i = 0; i < arr.length; i++) {
            if (arr[i] != src && arr[i] != '') {
                tmp.push(arr[i])
            }
        }
        console.log(tmp.join(","))
        $("#images").val(tmp.join(","))
    })
    //发布
    $("#btn").click(function () {
        //var ifStatus = $("#ifStatus").val()
        var data = {}
        var froms = $("#form").serializeArray();
        $.each(froms, function () {
            data[this.name] = this.value;
        })
        var object = JSON.stringify(data);//转换成字符串
        alert(object)
        $.ajax({
            url: "/admin/issue/addChapter",
            data: object,
            type: "POST",
            contentType: "application/json;charset=utf-8",
            success: function (data) {
                var id = $("#courseId").val();
                if (data.code == 1) {
                    layer.msg(data.msg, {
                        icon: 1,
                        time: 1000
                    }, function () {
                        window.location.href = "/admin/issue/section?id=" + id;
                    })
                } else {
                    layer.msg(data.msg);
                }
            }
        })
    })

</script>
</body>
</html>