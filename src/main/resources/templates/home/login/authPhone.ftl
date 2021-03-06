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

        .noHit {
            pointer-events: none;
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
        <h1 class="mui-title">绑定手机</h1>
    </header>
    <div class="main">
        <div class="ul_cen">
            <div class="cor9 tit">手机号</div>
            <div class="int">
                <input type="number" id="phone" name="phone" placeholder="请输入您的手机号码" value=""/>
            </div>
            <div class="cor9 tit">验证码</div>
            <div class="int fle fle_b fle_a_c">
                <input type="password" id="code1" name="code" placeholder="请输入您的验证码" value=""/>
                <span class="huoqu" id="code">获取验证码</span>
            </div>

        </div>
    </div>
    <div class="tijiao" id="auth">绑定</div>
</div>
</body>
<script type="text/javascript" src="/home/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/home/js/common.js"></script>
<script type="text/javascript" src="/home/js/mui.min.js"></script>
<script>
    //注册
    $("#auth").click(function () {
        var url = '/oauth/bound';
        var phone = $("#phone").val()
        var code = $("#code1").val()
        $.ajax({
            url: url,
            data: {"phone": phone, "code": code},
            type: 'POST',
            //contentType:"application/json;charset=utf-8",
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
    $("#code").click(function () {
        var phone = $("#phone").val()
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
                    $("#code1").val(codes)
                    $("#code").text("60");
                    var intval = setInterval(function () {
                        var $code = $("#code");
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