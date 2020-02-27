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
            background: #292C3B;
        }

        .logo {
            padding: 0.25rem 0.14rem;
        }

        .logo img {
            width: 0.98rem;
            height: 0.22rem;
        }

        .vip {
            width: 3.52rem;
            height: 2.34rem;
            background: url(/home/image/vipbg.png) no-repeat;
            background-size: 100% 100%;
            margin: 0 auto;
            padding-top: 0.4rem;
        }

        .vip h4 {
            text-align: center;
            font-size: 0.16rem;
            color: #BD8F56;
        }

        .daoqi {
            padding-right: 0.4rem;
            text-align: right;
            margin-top: 0.3rem;
        }

        .dqcen {
            margin-bottom: 0.15rem;
            color: #353A50;
        }

        .title {
            font-size: 0.24rem;
            color: #ECD8AC;
            font-weight: bold;
            text-align: center;
            padding: 0.25rem 0;
        }

        .xuanze {
            width: 3.5rem;
            background: #ffffff;
            margin: 0 auto;
            padding: 0.15rem 0;
            border-radius: 0.11rem;
            margin-bottom: 0.15rem;
        }

        .xuanze h4 {
            font-size: 0.16rem;
            color: #292C3B;
            padding-left: 0.1rem;
            border-left: 0.04rem solid #EBD6A8;
        }

        .viptype {
            padding: 0 0.15rem;
            margin: 0.15rem 0 0.3rem 0;

        }

        .vipcen {
            width: 1.53rem;
            height: 1.53rem;
            border: 1px solid #F3DBA4;
            background: #FFFFFF;
            border-radius: 0.02rem;
            text-align: center;
            padding: 0.25rem 0;
            position: relative;
        }

        .vipcen.active {
            background: #FFFAEE;
        }

        .price {
            font-size: 0.15rem;
            color: #46433D;
        }

        .price span {
            font-size: 0.29rem;
            font-weight: bold;
        }

        .leixing {
            color: #BD8F56;
            font-weight: bold;
            margin: 0.1rem 0 0.25rem 0;
        }

        .ktbtn {
            width: 1rem;
            height: 0.26rem;
            background: #EBD6A8;
            border: 1px solid #F3DBA4;
            color: #FFFFFF;
            font-size: 0.12rem;
            justify-content: center;
            border-radius: 0.13rem;
            margin: 0 auto;
            text-shadow: 0px 1px 1px rgba(82, 82, 82, 0.18);
        }

        .ktbtn span.iconfont {
            font-size: 0.14rem;
            margin-right: 0.05rem;
        }

        .int {
            position: absolute;
            top: 0.04rem;
            left: 0.06rem;
            padding: 0.05rem;
        }

        .xuanzhong:checked {
            background: #292C3B;
            border: 0;
        }

        .xuanzhong {
            width: 0.15rem;
            height: 0.15rem;
            border: 0.01rem solid #292C3B;
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
            height: 0.04rem;
            width: 0.07rem;
            -moz-transform: rotate(-45deg);
            -ms-transform: rotate(-45deg);
            -webkit-transform: rotate(-45deg);
            transform: rotate(-45deg);
        }

        .xuanzhong1:checked {
            background: #292C3B;
            border: 0;
        }

        .xuanzhong1 {
            width: 0.25rem;
            height: 0.25rem;
            border: 0.01rem solid #292C3B;
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
            margin-top: 0.05rem;
        }

        .xuanzhong1:checked::after {
            content: '';
            top: 0.06rem;
            left: 0.06rem;
            position: absolute;
            background: transparent;
            border: #fff solid 0.02rem;
            border-top: none;
            border-right: none;
            height: 0.06rem;
            width: 0.1rem;
            -moz-transform: rotate(-45deg);
            -ms-transform: rotate(-45deg);
            -webkit-transform: rotate(-45deg);
            transform: rotate(-45deg);
        }

        .zhifu {
            padding: 0 0.14rem;
            margin-top: 0.25rem;
        }

        .zfimg img {
            width: 0.45rem;
            height: 0.45rem;
        }

        .zfcen {
            color: #111111;
            margin-left: 0.1rem;
        }

        .zflist {
            margin-bottom: 0.15rem;
        }

        .kaitong {
            width: 3.32rem;
            height: 0.59rem;
            margin: 0 auto;
        }

        .kaitong img {
            width: 3.32rem;
            height: 0.59rem;
        }

        /*说明*/
        .shuoming {
            padding: 0 0.14rem;
        }

        .shuoming h4 {
            font-size: 0.16rem;
            color: #EBD6A8;
            padding: 0.15rem 0;
        }

        .smcen {
            font-size: 0.12rem;
            color: #999999;
            margin-bottom: 0.1rem;
        }

        .zhuyi {
            text-align: center;
            font-size: 0.12rem;
            color: #5D606D;
            padding-bottom: 0.2rem;
            margin-top: 0.35rem;
        }
    </style>
</head>
<body>
<div class="app">
    <!-- 主页面标题 -->
    <header class="header mui-bar mui-bar2 mui-bar-nav">
        <a href="/"><span class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></span></a>
        <h1 class="mui-title">升级VIP</h1>
    </header>
    <div class="main">
        <div class="logo">
            <img src="/home/image/logo.png"/>
        </div>
        <div class="vip">
            <h4>${user.userName!}(${user.phone})</h4>
            <div class="daoqi">
                <#list userVip as item >
                    <#if item.type=="健谈智慧vip"!>
                        <div class="dqcen">${item.endTime?string("yyyy-MM-dd")!}到期</div>
                    <#--<div class="dqcen">已开通</div>-->
                    <#elseif item.type=="家庭教育vip"!>
                        <div class="dqcen">${item.endTime?string("yyyy-MM-dd")!}到期</div>
                    <#else >
                        <div class="dqcen">未开通</div>
                    </#if>
                </#list>
            </div>
        </div>
        <div class="title">开通VIP，免费看全年课程</div>
        <div class="xuanze">
            <h4>选择会员类型</h4>
            <div class="viptype fle fle_b">
                <div class="vipcen active">
                    <div class="price">￥<span>365</span>元/年</div>
                    <div class="leixing">健谈智慧VIP</div>
                    <div class="ktbtn fle fle_a_c">
                        <span class="icon iconfont icon-huiyuan"></span>
                        <span>开通会员</span>
                    </div>
                    <div class="int">
                        <input type="radio" class="xuanzhong" checked="checked" name="radio"/>
                    </div>
                </div>

                <div class="vipcen">
                    <div class="price">￥<span>365</span>元/年</div>
                    <div class="leixing">健谈智慧VIP</div>
                    <div class="ktbtn fle fle_a_c">
                        <span class="icon iconfont icon-huiyuan"></span>
                        <span>开通会员</span>
                    </div>
                    <div class="int">
                        <input type="radio" class="xuanzhong" name="radio"/>
                    </div>
                </div>
            </div>

            <h4>选择支付方式</h4>
            <div class="zhifu">
                <div class="zflist clearfloat">
                    <div class="zfimg fl">
                        <img src="/home/image/zf2.png"/>
                    </div>
                    <div class="zfcen fl">
                        <div>支付宝支付</div>
                        <div class="font12 cor9">推荐已安装支付宝的用户使用</div>
                    </div>
                    <div class="fr">
                        <input type="radio" class="xuanzhong1" name="zhifu" checked="checked"/>
                    </div>
                </div>

                <div class="zflist clearfloat">
                    <div class="zfimg fl">
                        <img src="/home/image/zf3.png"/>
                    </div>
                    <div class="zfcen fl">
                        <div>微信支付</div>
                        <div class="font12 cor9">推荐已安装微信的用户使用</div>
                    </div>
                    <div class="fr">
                        <input type="radio" class="xuanzhong1" name="zhifu"/>
                    </div>
                </div>

            </div>

            <div class="kaitong">
                <img src="/home/image/ktbtn.png"/>
            </div>
        </div>

        <div class="shuoming">
            <h4>VIP会员权益说明：</h4>
            <div class="smcen">1.开通健谈智慧VIP，可以在会员内免费看健谈智慧板块所有内容； 开通家庭教育VIP，可以在会员期内免费看家庭教育板块所有内容</div>
            <div class="smcen">2.开通会员时间即可生效，从当日开始算起，至截止日24:00。 拷贝</div>
            <div class="smcen">3.已开通的会员可以继续追加开通，时间自动累加。 拷贝</div>
            <div class="smcen">4.会员一经开通，不可取消。</div>
        </div>

        <div class="zhuyi">*麦田微课vip会员最终解释权归平台所有</div>

    </div>
</div>
</body>
<script type="text/javascript" src="/home/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/home/js/common.js"></script>
<script>
    $('.viptype').on('click', '.vipcen', function () {
        $('.vipcen').removeClass('active');
        $(this).addClass('active');
        $('.viptype').find('.xuanzhong').prop('checked', false);
        $(this).find('.xuanzhong').prop('checked', true);
    })
</script>
</html>