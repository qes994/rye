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
            background: #FAFAFE;
        }

        .main {
            margin-top: 0.54rem;
            padding: 0 0.14rem;
            background: #ffffff;
        }

        .int {
            height: 0.5rem;
            line-height: 0.5rem;
            border-bottom: 1px solid #eeeeee;
        }

        .noHit {
            pointer-events: none;
        }

        .int:last-child {
            border-bottom: none;
        }

        .int input {
            height: 0.21rem;
            padding: 0;
            margin-bottom: 0;
            border: none;
            font-size: 0.16rem;
            color: #333333;
        }

        .yzm {
            width: 1.2rem;
            text-align: right;
            color: #01C475;
        }

        .tijiao {
            width: 3.47rem;
            height: 0.44rem;
            line-height: 0.44rem;
            text-align: center;
            background: linear-gradient(-56deg, rgba(10, 209, 128, 1), rgba(1, 196, 117, 1));
            box-shadow: 0px 4px 5px 0px rgba(1, 196, 117, 0.22);
            border-radius: 0.05rem;
            margin: 0 auto;
            margin-top: 1rem;
            font-size: 0.18rem;
            color: #ffffff;
            font-weight: bold;
        }

        #phone {
            color: #999999;
        }

    </style>
</head>
<body>
<div class="app">
    <!-- 主页面标题 -->
    <header class="header mui-bar mui-bar1 mui-bar-nav">
        <span class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></span>
        <h1 class="mui-title">登录密码</h1>
    </header>
    <form id="form">
        <div class="main">
            <div class="int fle fle_a_c cor9">
                <input type="text" placeholder="请输入新的手机号" name="phone" value="" id="phone"/>
            </div>
            <div class="int fle fle_a_c cor9">
                <input type="text" placeholder="请输入验证码" value="" name="code" id="code"/>
                <span class="yzm" id="auth">获取验证码</span>
            </div>
            <div class="int fle fle_a_c cor9">
                <input type="text" id="password" placeholder="请输入新的登录密码" value="" name="password"/>
            </div>
            <div class="int fle fle_a_c cor9">
                <input type="text" id="password1" name="password1" placeholder="请再次输入新的登录密码" value=""/>
            </div>
        </div>
    </form>
    <div class="tijiao" id="confirm">确定</div>
</div>
</body>
<script type="text/javascript" src="/home/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/home/js/common.js"></script>
<script type="text/javascript" src="/home/js/mui.min.js"></script>
<script>
    //登录
    $("#confirm").click(function () {
        var url = '/home/user/setPassword';
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
                    setTimeout(function () {
                    }, 1500)
                } else {
                    return false;
                }
            }
        })

    })
    $("#auth").click(function () {
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