<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>个人界面</title>
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <link href="/home/css/mui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/home/icon/iconfont.css"/>
    <link href="/home/css/common.css" rel="stylesheet"/>
    <style>
        body {
            background: #ffffff;
        }

        .main {
            margin-top: 0;
        }

        .usertop {
            width: 100%;
            height: 1.2rem;
            background: #01C475;
            padding: 0 0.14rem;
        }

        .topbtn {
            padding: 0.15rem 0;
        }

        .topbtn .iconfont {
            font-size: 0.22rem;
            color: #ffffff;
        }

        .mess {
            position: relative;
        }

        .dian {
            width: 0.05rem;
            height: 0.05rem;
            background: #FF366C;
            border-radius: 0.05rem;
            display: block;
            position: absolute;
            right: -0.05rem;
            top: -0.05rem;
        }

        .usermess {
            width: 3.47rem;
            background: #ffffff;
            padding: 0.15rem;
            border-radius: 0.04rem;
            margin: 0 auto;
            box-shadow: 0px 3px 3px 0px rgba(209, 209, 209, 0.22);
        }

        .messleft, .messleft img {
            width: 0.64rem;
            height: 0.64rem;
            border-radius: 0.64rem;
        }

        .messright {
            width: 2.58rem;
            margin-left: 0.1rem;
            padding: 0.05rem 0;
        }

        .messname {
            font-size: 0.18rem;
            font-weight: bold;
        }

        .yqmnum {
            font-size: 0.14rem;
            color: #111111;
            font-weight: bold;
        }

        .tuiguang {
            width: 0.54rem;
            height: 0.2rem;
            line-height: 0.2rem;
            text-align: center;
            background: #01C475;
            font-size: 0.1rem;
            color: #FFFFFF;
            border-radius: 0.02rem;
        }

        .fuzhi {
            width: 0.72rem;
            height: 0.2rem;
            line-height: 0.18rem;
            text-align: center;
            border: 1px solid #FFEABD;
            font-size: 0.1rem;
            color: #FF9C00;
            border-radius: 0.1rem;
        }

        .icon-bianji {
            font-size: 0.16rem;
            color: #999999;
            margin-left: 0.05rem;
        }

        .uservip {
            padding: 0.15rem 0.3rem 0 0.3rem;
        }

        .vip {
            text-align: center;
        }

        .vipimg, .vipimg img {
            width: 0.85rem;
            height: 0.14rem;
        }

        .border {
            width: 1px;
            height: 17px;
            background: #EEEEEE;
            margin-top: 0.15rem;
        }

        .gongneng {
            margin-top: 0.8rem;
            padding: 0.2rem 0.14rem;
        }

        .gntit {
            font-size: 0.16rem;
            color: #111111;
            font-weight: bold;
        }

        .gongneng ul {
            margin-top: 0.15rem;
        }

        .gongneng ul li {
            text-align: center;
        }

        .gongneng ul li img {
            width: 0.35rem;
            height: 0.35rem;
            margin-bottom: -0.1rem;
        }

        .xufei {
            width: 3.75rem;
            background: #FAFAFE;
            padding: 0.15rem 0 0.05rem 0;
            text-align: center;
        }

        .xufei img {
            width: 3.61rem;
            height: 0.68rem;
        }

        .fxlist {
            padding: 0.15rem 0.14rem;
            border-bottom: 1px solid #EEEEEE;
        }

        .fxtit {
            font-weight: bold;
        }

        .fxbtn {
            background: linear-gradient(0deg, rgba(58, 182, 253, 1), rgba(42, 177, 254, 1));
            border: 1px solid rgba(18, 150, 228, 0.74);
            box-shadow: 0px 4px 11px 0px rgba(147, 213, 251, 1);
            width: 0.9rem;
            height: 0.34rem;
            line-height: 0.34rem;
            border-radius: 0.03rem;
            font-weight: bold;
            color: #ffffff;
            text-align: center;
        }

        .kcmain {
            width: 3.3rem;
            padding: 0.18rem 0;
            border-bottom: 1px solid #EEEEEE;
        }

        .kctiao {
            padding: 0 0 0 0.14rem;
        }

        .kctiao > div.iconfont {
            font-size: 0.2rem;
            color: #FF9C00;
        }

        .kcmain {
            margin-left: 0.1rem;
        }

        .kcmain span.iconfont {
            margin-right: 0.14rem;
            font-size: 0.14rem;
            color: #DDDDDD;
        }

        .yqbtn {
            width: 0.87rem;
            height: 0.87rem;
            position: fixed;
            bottom: 0.35rem;
            right: 0.28rem;
        }

        .yqbtn img {
            width: 0.87rem;
            height: 0.87rem;
        }

        /*全部跳过*/
        .fix {
            width: 100%;
            height: 100%;
            background: url(/home/image/my-fix1.png) no-repeat;
            background-size: 100% 100%;
            position: fixed;
            top: 0;
            left: 0;
        }

        .tiaoguo {
            width: 100%;
            position: absolute;
            text-align: center;
            bottom: 0.26rem;
        }

        .tiaoguo img {
            width: 1.08rem;
            height: 0.41rem;
        }
    </style>
</head>
<body>
<div class="app">
    <div class="main">
        <div class="usertop">
            <div class="fle fle_b topbtn">
                <div class="mess">
                    <span class="icon iconfont icon-xiaoxi2"></span>
                    <span class="dian"></span>
                </div>
                <a href="set">
                    <div class="icon iconfont icon-shezhi"></div>
                </a>
            </div>
            <a href="personage">
                <div class="usermess">
                    <div class="fle fle_a_c">
                        <#if user.head??>
                            <div class="messleft">
                                <img src="${user.head}"/>
                            </div>
                        <#else >
                            <div class="messleft">
                                <img src="/home/image/tou.png"/>
                            </div>
                        </#if>

                        <div class="messright">
                            <div class="fle fle_b marb10">
                                <div>
                                    <#if user.userName??>
                                        <span class="messname">${user.userName!}</span>
                                    <#else >
                                        <span class="messname">雨后彩虹</span>
                                    </#if>

                                    <span class="icon iconfont icon-bianji"></span>
                                </div>
                                <div class="yqmnum">推广码: ${user.invitationCode}</div>
                            </div>
                            <div class="fle fle_b">
                                <div class="tuiguang">推广大使</div>
                                <div class="fuzhi">复制邀请码</div>
                            </div>
                        </div>
                    </div>
                    <div class="uservip fle fle_b">
                        <#list userVip as item>
                            <#if item.id??>
                                <div class="vip">
                                    <div class="vipimg">
                                        <img src="${item.head!}"/>
                                    </div>
                                    <div class="font12 cor9 mart5">${item.endTime?string("yyyy-MM-dd")!}</div>
                                </div>
                            <#else>
                                <div class="vip">
                                    <div class="vipimg">
                                        <img src="/home/image/no-jtvip.png"/>
                                    </div>
                                    <div class="font12 cor9 mart5">未开通</div>
                                </div>
                                <div class="border"></div>
                                <div class="vip">
                                    <div class="vipimg">
                                        <img src="/home/image/no-jtvip1.png"/>
                                    </div>
                                    <div class="font12 cor9 mart5">未开通</div>
                                </div>
                            </#if>
                        </#list>
                    </div>
                </div>
            </a>
        </div>

        <div class="gongneng">
            <div class="gntit">常用功能</div>
            <ul class="fle fle_b font12 cor3">
                <li>
                    <img src="/home/image/user1.png"/>
                    <div>线下活动</div>
                </li>
                <li class="border"></li>
                <li>
                    <img src="/home/image/user2.png"/>
                    <div>我的团队</div>
                </li>
                <li class="border"></li>
                <li>
                    <img src="/home/image/user3.png"/>
                    <div>我的帐户</div>
                </li>
            </ul>
        </div>

        <div class="xufei">
            <img src="/home/image/xufei.png"/>
        </div>

        <div class="fenxiang">
            <div class="fxlist fle fle_b fle_a_c">
                <span class="fxtit">每日必发课程</span>
                <span class="fxbtn">分享课程</span>
            </div>

            <div class="kctiao fle fle_a_c">
                <div class="icon iconfont icon-shipin"></div>
                <div class="kcmain fle fle_b">
                    <span>一起创业</span>
                    <span class="icon iconfont icon-gengduo"></span>
                </div>
            </div>

            <div class="kctiao fle fle_a_c">
                <div class="icon iconfont icon-collection"></div>
                <div class="kcmain fle fle_b">
                    <span>我的收藏</span>
                    <span class="icon iconfont icon-gengduo"></span>
                </div>
            </div>
            <div class="kctiao fle fle_a_c">
                <div class="icon iconfont icon-shipin"></div>
                <div class="kcmain fle fle_b">
                    <span>帮助中心</span>
                    <span class="icon iconfont icon-gengduo"></span>
                </div>
            </div>
            <div class="kctiao fle fle_a_c">
                <div class="icon iconfont icon-shipin"></div>
                <div class="kcmain fle fle_b">
                    <span>一起创业</span>
                    <span class="icon iconfont icon-gengduo"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="yqbtn">
        <img src="/home/image/yqbtn.png"/>
    </div>
    <#include "../common/footer.ftl">
</div>

<!--全部跳过-->
<div class="fix">
    <div class="tiaoguo">
        <img src="/home/image/tiaoguo.png"/>
    </div>
</div>
</body>
<script type="text/javascript" src="/home/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/home/js/common.js"></script>
<script type="text/javascript" src="/home/js/mui.min.js"></script>
<script>
    /*全部跳过*/
    $('.tiaoguo').click(function () {
        $('.fix').hide();
        $('body').css('overflow-y', 'scroll');
    })

</script>
</html>