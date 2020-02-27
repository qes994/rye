<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录页面</title>
    <link rel="stylesheet" type="text/css" href="/admin/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="/admin/css/style.css"/>
</head>
<body>
<!-- Head -->
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-sm12 layui-col-md12 zyl_mar_01">
            <blockquote class="layui-elem-quote">麦田微课后台登陆界面</blockquote>
        </div>
    </div>
</div>
<!-- Head End -->
<!-- Carousel -->
<div class="layui-row">
    <div class="layui-col-sm12 layui-col-md12">
        <div class="layui-carousel zyl_login_height" id="zyllogin" lay-filter="zyllogin">
            <div carousel-item="">
                <div>
                    <div class="zyl_login_cont"></div>
                </div>
                <div>
                    <img src="/admin/images/01.jpg"/>
                </div>
                <div>
                    <div class="background">
                        <span></span><span></span><span></span>
                        <span></span><span></span><span></span>
                        <span></span><span></span><span></span>
                        <span></span><span></span><span></span>
                    </div>
                </div>
                <div>
                    <img src="/admin/images/03.jpg"/>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Carousel End -->

<#include "common/footer.ftl">
</div>
<!-- Footer End -->


<!-- LoginForm -->
<div class="zyl_lofo_main">
    <fieldset class="layui-elem-field layui-field-title zyl_mar_02">
        <legend>欢迎登陆 - 麦田微课,欢迎你</legend>
    </fieldset>
    <div class="layui-row layui-col-space15">
        <form class="layui-form zyl_pad_01" id="form">
            <div class="layui-col-sm12 layui-col-md12">
                <div class="layui-form-item">
                    <input type="text" name="phone" id="phone" autocomplete="off"
                           placeholder="手机号" class="layui-input">
                    <#--   <%-- <i class="layui-icon layui-icon-username zyl_lofo_icon"></i>--%>-->
                </div>
            </div>
            <div class="layui-col-sm12 layui-col-md12">
                <div class="layui-form-item">
                    <input type="password" id="password" name="password" autocomplete="off" placeholder="密码"
                           class="layui-input">
                    <i class="layui-icon layui-icon-password zyl_lofo_icon"></i>
                </div>
            </div>
            <div class="layui-col-sm12 layui-col-md12">
                <div class="layui-row">
                    <div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
                        <div class="layui-form-item">
                            <input type="text" name="code" id="vercode" autocomplete="off" placeholder="验证码"
                                   class="layui-input" maxlength="4">
                            <img id="verification" src="/verification" style="cursor: pointer;" title="看不清？换一张"/>
                            <i class="layui-icon layui-icon-vercode zyl_lofo_icon"></i>
                        </div>
                    </div>
                    <div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
                        <div class="zyl_lofo_vercode zylVerCode"></div>
                    </div>
                </div>
            </div>
            <div class="layui-col-sm12 layui-col-md12">
                <button class="layui-btn layui-btn-fluid" type="button" id="btn">立即登录</button>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript" charset="UTF-8" src="/admin/layui/layui.all.js"></script>
<script>
    var carousel = layui.carousel;
    var form = layui.form;
    var $ = layui.jquery;
    var jQuery = $;
</script>
<script type="text/javascript" charset="UTF-8" src="/admin/plugins/jparticle.min.js"></script>
<script>
    //1获取from表单数据,ajax请求,post提交方法
    $("#btn").click(function () {
        var vercode = $("#vercode").val()
        var phone = $("#phone").val()
        var password = $("#password").val()
        $.ajax({
            url: "/admin/admin/login",
            // contentType:"application/json;charset=utf-8",
            data: {"phone": phone, "password": password, "code": vercode},
            type: 'POST',
            success: function (data) {
                console.log(data)
                if (data.code == 1) {
                    layer.msg(data.msg, {
                        icon: 1,
                        time: 1000
                    }, function () {
                        window.location.href = "/admin/admin/index"
                    })
                } else {
                    layer.msg(data.msg);
                }
            }
        })
    })


    //设置轮播主体高度
    var zyl_login_height = $(window).height() / 1.3;
    var zyl_car_height = $(".zyl_login_height").css("cssText", "height:" + zyl_login_height + "px!important");


    //Login轮播主体
    carousel.render({
        elem: '#zyllogin'//指向容器选择器
        , width: '100%' //设置容器宽度
        , height: 'zyl_car_height'
        , arrow: 'always' //始终显示箭头
        , anim: 'fade' //切换动画方式
        , autoplay: true //是否自动切换false true
        , arrow: 'hover' //切换箭头默认显示状态||不显示：none||悬停显示：hover||始终显示：always
        , indicator: 'none' //指示器位置||外部：outside||内部：inside||不显示：none
        , interval: '5000' //自动切换时间:单位：ms（毫秒）
    });

    //监听轮播--案例暂未使用
    carousel.on('change(zyllogin)', function (obj) {
        var loginCarousel = obj.index;
    });

    //粒子线条
    $(".zyl_login_cont").jParticle({
        background: "rgba(0,0,0,0)",//背景颜色
        color: "#fff",//粒子和连线的颜色
        particlesNumber: 100,//粒子数量
        //disableLinks:true,//禁止粒子间连线
        //disableMouse:true,//禁止粒子间连线(鼠标)
        particle: {
            minSize: 1,//最小粒子
            maxSize: 3,//最大粒子
            speed: 30,//粒子的动画速度
        }
    });


    /*图片验证码*/
    $(function () {
        // 刷新验证码
        $("#verification").bind("click", function () {
            $(this).hide().attr('src', '/verification?random=' + Math.random()).fadeIn();
        });
    })
</script>
</body>
</html>