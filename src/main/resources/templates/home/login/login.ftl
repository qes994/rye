<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <link href="/home/css/mui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/home/icon/iconfont.css"/>
    <link href="/home/css/common.css" rel="stylesheet"/>
    <style>
        body {
            background: #ffffff;
        }

        .ul_tab {
            width: 100%;
            padding: 0.15rem 0 0 0;
            background: #ffffff;
            border-bottom: 0.01rem solid #DDDDDD;
        }

        .ul_tab li {
            width: 50%;
            text-align: center;
            color: #666666;
            float: left;
        }

        .ul_tab li.active {
            color: #01C475;
            font-weight: bold;
        }

        .border {
            width: 0.17rem;
            height: 0.01rem;
            background: #01C475;
            margin: 0 auto;
            margin-top: 0.1rem;
            display: none;
        }

        .ul_tab li.active .border {
            display: block;
        }

        .tijiao {
            width: 2.95rem;
            height: 0.44rem;
            line-height: 0.44rem;
            text-align: center;
            background: linear-gradient(-56deg, rgba(10, 209, 128, 1), rgba(1, 196, 117, 1));
            box-shadow: 0px 4px 5px 0px rgba(1, 196, 117, 0.22);
            border-radius: 0.05rem;
            margin: 0 auto;
            margin-top: 0.6rem;
            font-size: 0.18rem;
            color: #ffffff;
            font-weight: bold;
        }

        .ul_cen {
            padding: 0 0.4rem;
            padding-top: 0.1rem;
        }

        .ul_cen li {
            display: none;
        }

        .int {
            line-height: 0.44rem;
            height: 0.44rem;
            background: #F7F7F7;
            border-radius: 0.04rem;
        }

        .int input {
            width: 1.8rem;
            height: 0.21rem;
            background: none;
            margin-bottom: 0;
            border: none;
            font-size: 0.16rem;
            font-weight: bold;
        }

        .tit {
            margin-top: 0.2rem;
            margin-bottom: 0.05rem;
        }

        .wangji {
            padding: 0.08rem 0;
            text-align: right;
            color: #01C475;
        }

        .zhuce {
            text-align: center;
            padding: 0.15rem 0;
            font-size: 0.16rem;
            font-weight: bold;
        }

        .borbg {
            width: 2.95rem;
            height: 1px;
            background: #EEEEEE;
            margin: 0 auto;
            text-align: center;
            margin-top: 0.9rem;
        }

        .noHit {
            pointer-events: none;
        }

        .borbg span {
            width: 1.26rem;
            background: #ffffff;
            position: relative;
            top: -0.1rem;
            display: inline-block;
        }

        .weixin {
            text-align: center;
            margin-top: 0.3rem;
        }

        .weixin img {
            width: 0.52rem;
            height: 0.52rem;
        }

        .gitHub {
            text-align: center;
            margin-top: 0.3rem;
        }

        .gitHub img {
            width: 0.52rem;
            height: 0.52rem;
        }

        .huoqu {
            width: 1rem;
            font-size: 0.12rem;
            color: #01C475;
            margin-right: 0.14rem;
            text-align: right;
        }
    </style>
</head>
<body>
<div class="app">
    <!-- 主页面标题 -->
    <header class="header mui-bar mui-bar2 mui-bar-nav">
        <span class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></span>
        <h1 class="mui-title">麦田微课</h1>
    </header>
    <form id="form">
        <div class="main">
            <ul class="ul_tab clearfloat">
                <li class="active">
                    <div class="hdtit">帐号登录</div>
                    <div class="border"></div>
                </li>
                <li>
                    <div class="hdtit">短信登录</div>
                    <div class="border"></div>
                </li>
            </ul>
            <ul class="ul_cen">
                <li style="display: block;">
                    <div class="cor9 tit">帐号</div>
                    <div class="int">
                        <input type="number" name="phone" id="phone" placeholder="请输入您的手机号码" value=""/>
                    </div>
                    <div class="cor9 tit">账户密码</div>
                    <div class="int">
                        <input type="password" name="password" id="password" placeholder="请输入您的登录密码" value=""/>
                    </div>
                    <a href="/home/user/find">
                        <div class="wangji" id="find">忘记登录密码？</div>
                    </a>
                </li>
                <li>
                    <div class="cor9 tit">手机号</div>
                    <div class="int">
                        <input type="number" name="number" id="phone1" placeholder="请输入您的手机号码" value=""/>
                    </div>
                    <div class="cor9 tit">验证码</div>
                    <div class="int fle fle_b fle_a_c">
                        <input type="password" name="code" id="code" placeholder="请输入您的验证码" value=""/>
                        <span class="huoqu" id="auth">获取验证码</span>
                    </div>
                </li>
            </ul>
        </div>
    </form>
    <div class="tijiao" id="login">立即登录</div>
    <a href="/home/user/register" style="color: black">
        <div class="zhuce" id="register">注册</div>
    </a>
    <div class="borbg cor9">
        <span>第三方快速登录</span>
    </div>
    <a href="/oauth/wx">
        <div class="weixin">
            <img src="/home/image/weixinloginm.png"/>
        </div>
    </a>
    <a href="/oauth/gitHub">
        <div class="gitHub" id="gitHub">
            <img src="https://gss0.bdstatic.com/94o3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=b339f649c7fc1e17e9b284632bf99d66/0dd7912397dda1445da42dedbab7d0a20df486c4.jpg"/>
        </div>
    </a>
</div>
</body>
<script type="text/javascript" src="/home/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/home/js/common.js"></script>
<script type="text/javascript" src="/home/js/mui.min.js"></script>
<script>
    //登录
    $("#login").click(function () {
        var url = '/home/user/login';
        var data = {}
        var froms = $("form").serializeArray();
        $.each(froms, function () {
            data[this.name] = this.value;
        })
        var user = JSON.stringify(data);//转换成字符串
        console.log(user)
        $.ajax({
            url: url,
            data: user,
            type: 'POST',
            contentType: "application/json;charset=utf-8",
            success: function (data) {
                mui.toast(data.msg, {duration: 'long', type: 'div'})
                if (data.code == 1) {
                    console.log(data.code)
                    setTimeout(function () {
                        console.log(data.code)
                        window.location.href = "/";
                    }, 1500)
                } else {
                    return false;
                }
            }
        })

    })
    //----------------------------------
    $('.ul_tab').on('click', 'li', function () {
        $('.ul_tab li').removeClass('active');
        $(this).addClass('active');
        var index = $(this).index();
        $('.ul_cen li').hide();
        $('.ul_cen li').eq(index).show();
        $(":password").attr("value", "");
    })
    $("#auth").click(function () {
        var phone = $("#phone1").val()
        $.ajax({
            url: "/home/user/code1",
            data: {"phone": phone},
            type: "POST",
            success: function (data) {
                mui.toast(data.msg, {duration: 'long', type: 'div'})
                if (data.code == 0) {
                    return false;
                } else {
                    var codes = data.object;
                    $("#code").val(codes)
                    $("#auth").text("60");
                    var intval = setInterval(function () {
                        var $code = $("#auth");
                        var html = $code.text();
                        var countDwon = parseInt(html);
                        $code.addClass("noHit");
                        $code.text(countDwon - 1);
                        if (countDwon <= 0) {
                            $code.removeClass("noHit");
                            $code.text("从新获取")
                            clearInterval(intval)
                        }
                    }, 1000)
                }
            }
        })
    })


</script>
</html>