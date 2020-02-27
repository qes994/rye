<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>设置</title>
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <link href="/home/css/mui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/home/icon/iconfont.css"/>
    <link href="/home/css/common.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/home/css/mui.picker.min.css"/>
    <style>
        .main {
            margin-top: 0.54rem;
        }

        .set {
            background: #fff;
            margin-bottom: 0.1rem;
        }

        .setlist {
            padding: 0.16rem 0.14rem;
            border-bottom: 0.01rem solid #EEEEEE;
        }

        .set .setlist:last-child {
            border-bottom: none;
        }

        .setlist .icon {
            font-size: 0.14rem;
            color: #DDDDDD;
        }

        .sethead img {
            width: 0.48rem;
            height: 0.48rem;
            border-radius: 0.48rem;
        }

        .sethead span.icon {
            font-size: 0.11rem;
            color: #CCCCCC;
            margin-left: 0.09rem;
        }

        .xuanzhong:checked {
            background: #01C475;
            border: 0;
        }

        .xuanzhong {
            width: 0.16rem;
            height: 0.16rem;
            border: 0.01rem solid #333C3C;
            -webkit-border-radius: 50%;
            border-radius: 50%;
            margin: 0;
            padding: 0;
            position: relative;
            display: inline-block;
            vertical-align: middle;
            cursor: default;
            -webkit-appearance: none;
            -webkit-user-select: none;
            user-select: none;
            -webkit-transition: background-color ease 0.1s;
            transition: background-color ease 0.1s;
            margin: 0 0.05rem;
        }

        .xuanzhong:checked::after {
            content: '';
            top: 0.03rem;
            left: 0.03rem;
            position: absolute;
            background: transparent;
            border: #fff solid 0.01rem;
            border-top: none;
            border-right: none;
            height: 0.05rem;
            width: 0.08rem;
            -moz-transform: rotate(-45deg);
            -ms-transform: rotate(-45deg);
            -webkit-transform: rotate(-45deg);
            transform: rotate(-45deg);
        }

        .sex {
            margin-right: 0.4rem;
        }

        .tclogin {
            width: 3.47rem;
            height: 0.44rem;
            line-height: 0.44rem;
            border: 0.01rem solid #333333;
            border-radius: 0.22rem;
            text-align: center;
            font-size: 0.18rem;
            color: #333333;
            margin: 0 0.14rem;
            position: fixed;
            bottom: 0.4rem;
        }

        #name input {
            border: none;
            height: auto;
            padding: 0;
            text-align: right;
        }

        .dian {
            width: 0.05rem;
            height: 0.05rem;
            background: #FF0000;
            border-radius: 0.05rem;
            display: inline-block;
            margin-right: 0.08rem;
        }

        .yanse {
            color: #01C475;
            font-size: 0.14rem;
        }

        .tuichu {
            width: 3.47rem;
            height: 0.44rem;
            border: 1px solid #8BD9B9;
            margin: 0 auto;
            line-height: 0.44rem;
            text-align: center;
            border-radius: 0.05rem;
            font-size: 0.18rem;
            color: #01C475;
            font-weight: bold;
            margin-top: 1rem;
        }
    </style>
</head>
<body>
<div class="app">
    <!-- 主页面标题 -->
    <header class="header mui-bar mui-bar1 mui-bar-nav">
        <span class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></span>
        <h1 class="mui-title">设置</h1>
    </header>
    <div class="main font16">
        <div class="set">
            <div class="setlist fle fle_b">
                <div class="cor6">修改手机号</div>
                <div class="cor9">
                    <span>${user.phone}</span>
                    <a href="/home/user/setPhone"><span class="icon iconfont icon-gengduo"></span></a>
                </div>
            </div>

            <div class="setlist fle fle_b">
                <div class="cor6">登录密码</div>
                <#if password??>
                    <span class="font14"><#--${password!}--></span>
                <#else >
                    <span class="font14">未设定</span>
                </#if>
                <a href="/home/user/setPassword">
                    <div class="icon iconfont icon-gengduo"></div>
                </a>
            </div>
            <div class="setlist fle fle_b">
                <div class="cor6">提现密码</div>
                <div class="cor9 fle fle_a_c">
                    <span class="dian"></span>
                    <#if user.withdrawPassword??>
                        <span class="font14">${user.withdrawPassword}</span>
                    <#else>
                        <span class="font14">未设定</span>
                    </#if>
                    <a href="/home/user/withdraw"><span class="icon iconfont icon-gengduo marl5"></span></a>
                </div>
            </div>
        </div>


        <div class="set">
            <div class="setlist fle fle_b">
                <div class="cor6">联系我们</div>
                <a href="/home/user/contact">
                    <div class="icon iconfont icon-gengduo"></div>
                </a>
            </div>
            <div class="setlist fle fle_b">
                <div class="cor6">关于我们</div>
                <a href="/home/user/relation" class="icon iconfont icon-gengduo"></a>
            </div>
            <div class="setlist fle fle_b">
                <div class="cor6">当前版本</div>
                <div class="cor9">1.0.1</div>
            </div>
            <div class="setlist fle fle_b">
                <div class="cor6">清除缓存</div>
                <div class="yanse">40MB</div>
            </div>
        </div>

        <a href="/home/user/exit">
            <div class="tuichu">退出登录</div>
        </a>
    </div>
</div>


</body>
<script type="text/javascript" src="/home/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/home/js/common.js"></script>
<script type="text/javascript" src="/home/js/mui.min.js"></script>
<script type="text/javascript" src="/home/js/city.data.js"></script>
<script type="text/javascript" src="/home/js/mui.picker.min.js"></script>
<script>

    (function ($) {
        $.init();
        var result = $('#result')[0];
        var btns = $('.btn');
        btns.each(function (i, btn) {
            btn.addEventListener('tap', function () {
                var _self = this;
                if (_self.picker) {
                    _self.picker.show(function (rs) {
                        result.innerText = rs.text;
                        _self.picker.dispose();
                        _self.picker = null;
                    });
                } else {
                    var optionsJson = this.getAttribute('data-options') || '{}';
                    var options = JSON.parse(optionsJson);
                    var id = this.getAttribute('id');

                    _self.picker = new $.DtPicker(options);
                    _self.picker.show(function (rs) {

                        result.innerText = rs.text;
                        _self.picker.dispose();
                        _self.picker = null;
                    });
                }

            }, false);
        });
    })(mui);


    var _getParam = function (obj, param) {
        return obj[param] || '';
    };

    /*地址*/
    var cityPicker = new mui.PopPicker({
        layer: 3
    });
    cityPicker.setData(cityData);
    $('#address').click(function () {
        cityPicker.show(function (items) {
            $('#addcen').html(_getParam(items[0], 'text') + ' ' + _getParam(items[1], 'text'))
        });
    });

</script>
</html>