<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <link href="/home/css/mui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/home/icon/iconfont.css"/>
    <link href="/home/css/common.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/home/css/swiper.min.css"/>
    <style>
        body {
            overflow: hidden;
        }

        .banner {
            text-align: center;
            background: #ffffff;
            padding: 0.03rem 0 0.05rem 0;
        }

        .banner img {
            width: 3.47rem;
            height: 1.58rem;
        }

        .swiper-pagination-bullet {
            border: 1px solid #FFFFFF;
            background: none;
            opacity: 1;
            width: 0.05rem;
            height: 0.05rem;
        }

        .swiper-pagination-bullet-active {
            background: #ffffff;
        }

        .headleft {
            width: 0.28rem;
            position: relative;
        }

        .headleft span.iconfont {
            color: #666666;
            font-size: 0.22rem;
        }

        .dian {
            width: 0.05rem;
            height: 0.05rem;
            background: #FF366C;
            border-radius: 0.05rem;
            display: block;
            position: absolute;
            top: 0.1rem;
            right: 0;
        }

        .headcen {
            width: 2.74rem;
            height: 0.34rem;
            background: #F7F7F7;
            border-radius: 0.17rem;
            justify-content: center;
            margin: 0 0.15rem;
        }

        .headcen span.iconfont {
            font-size: 0.14rem;
            color: #AAAAAA;
        }

        .headcen input {
            margin-bottom: 0;
            padding: 0;
            border: none;
            height: 0.21rem;
            background: none;
            width: 1.3rem;
            line-height: 0.21rem;
            font-size: 0.14rem;
            margin-left: 0.1rem;
        }

        .icon-lishijilu {
            font-size: 0.22rem;
            color: #666666;
        }

        .nav {
            font-size: 0.13rem;
            color: #111111;
            background: #ffffff;
            padding-bottom: 0.15rem;
        }

        .navlist {
            width: 25%;
            text-align: center;
            position: relative;
        }

        .nav::-webkit-scrollbar {
            display: none;
        }

        .navlist img {
            width: 0.56rem;
            height: 0.56rem;
            border-radius: 0.56rem;
        }

        .navlist div {
            line-height: 0.14rem;
            margin-top: -0.05rem;
        }

        .tjbiao {
            position: absolute;
            right: 0;
            top: 0;
        }

        .tjbiao, .tjbiao img {
            width: 0.37rem;
            height: 0.16rem;
        }

        .tiyan, .yuer, .guanxi, .jingpin {
            padding: 0 0.14rem;
            background: #ffffff;
            margin-top: 0.1rem;
            padding-bottom: 0.1rem;
        }

        .title {
            padding: 0.15rem 0;
        }

        .titlf {
            font-size: 0.18rem;
            font-weight: bold;
            border-left: 0.03rem solid #01C475;
            height: 0.1rem;
            line-height: 0.1rem;
            padding-left: 0.08rem;
        }

        .more span.iconfont {
            font-size: 0.12rem;
        }

        .tyimg {
            position: relative;
        }

        .tyimg > img {
            width: 1.05rem;
            height: 1.56rem;
        }

        .topright {
            position: absolute;
            top: 0;
            left: 0;
        }

        .topright img {
            width: 0.5rem;
            height: 0.48rem;
        }

        .tytit {
            font-weight: bold;
        }

        .study1 span.iconfont {
            font-size: 0.13rem;
            color: #FFAA01;
        }

        .tylist:nth-child(2) {
            margin: 0 0.16rem;
        }

        .tylist {
            width: 1.05rem;
        }

        .spimg {
            width: 1.06rem;
            height: 1.57rem;
            position: relative;
        }

        .spimg > img {
            width: 1.06rem;
            height: 1.57rem;
        }

        .xuan {
            width: 0.57rem;
            height: 0.57rem;
            position: absolute;
            top: 0;
            left: 0;
        }

        .xuan img {
            width: 0.57rem;
            height: 0.57rem;
            border-radius: 0.05rem;
        }

        .splist {
            padding-bottom: 0.15rem;
        }

        .splist:last-child {
            border-bottom: none;
        }

        .spright {
            width: 2.2rem;
            position: relative;
            margin-left: 0.14rem;
        }

        .spright h4 {
            font-size: 0.16rem;
        }

        .number span.iconfont {
            color: #FFAA01;
            font-size: 0.13rem;
        }

        .price {
            font-size: 0.18rem;
            color: #FF366C;
            font-weight: bold;
        }

        .study {
            width: 100%;
            position: absolute;
            bottom: 0.05rem;
        }

        /*夫妻关系*/
        .gximg, .gximg img {
            width: 3.47rem;
            height: 1.96rem;
            border-radius: 0.05rem;
        }

        .gxmain h4 {
            font-size: 0.16rem;
            font-weight: bold;
            margin: 0.12rem 0 0.05rem 0;
        }

        .gxlist {
            margin-bottom: 0.1rem;
        }

        /*悬浮*/
        .xuanfu {
            position: fixed;
            bottom: 0;
            left: 0;
        }

        .xuanfu > img {
            width: 1.79rem;
            height: 1.69rem;
        }

        .close {
            position: absolute;
            right: 0;
            top: 0;
        }

        .close img {
            width: 0.15rem;
            height: 0.15rem;
        }

        /*精品推荐*/
        .jplist {
            width: 1.67rem;
            float: left;
            margin-bottom: 0.14rem;
        }

        .jpimg img {
            width: 1.67rem;
            height: 0.94rem;
            border-radius: 0.05rem;
        }

        .jpmain h4 {
            font-size: 0.16rem;
        }

        .jplist:nth-child(even) {
            margin-left: 0.13rem;
        }

        .huanyipi {
            height: 0.34rem;
            line-height: 0.34rem;
            background: #F3F3F3;
            color: #666666;
            text-align: center;
            justify-content: center;
            border-radius: 0.03rem;
        }

        .huanyipi span.iconfont {
            font-size: 0.16rem;
            margin-right: 0.05rem;
        }

        /*全部跳过*/
        .fix {
            width: 100%;
            height: 100%;
            background: url(/home/image/tk-fix1.png) no-repeat;
            background-size: 100% 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 9663;
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
    <!-- 主页面标题 -->
    <header class="header mui-bar mui-bar2 mui-bar-nav fle fle_a_c">
        <div class="headleft">
            <span class="icon iconfont icon-xiaoxi2"></span>
            <span class="dian"></span>
        </div>
        <div class="headcen fle fle_a_c">
            <span class="icon iconfont icon-sousuo"></span>
            <input type="text" placeholder="请输入关键字搜索"/>
        </div>
        <div class="icon iconfont icon-lishijilu"></div>
    </header>
    <div class="main">
        <div class="banner">
            <div class="swiper-container banner">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"><img src="/home/image/zhihui.png"></div>
                    <div class="swiper-slide"><img src="/home/image/zhihui.png"></div>
                    <div class="swiper-slide"><img src="/home/image/zhihui.png"></div>
                </div>
                <!-- Add Pagination -->
                <div class="swiper-pagination"></div>
            </div>
            <div class="topfloat clearfloat">
                <div class="topbtn fl">
                    <span class="icon iconfont iconfanhui-"></span>
                </div>
                <div class="topbtn fr fenxiang">
                    <span class="icon iconfont iconxingzhuang31"></span>
                </div>
            </div>
        </div>

        <!--导航-->
        <div class="nav fle">
            <div class="navlist">
                <img src="/home/image/sy1.png"/>
                <div>最新</div>
                <div class="tjbiao">
                    <img src="/home/image/tuijian.png"/>
                </div>
            </div>
            <div class="navlist">
                <img src="/home/image/sy2.png"/>
                <div>最热</div>
            </div>
            <div class="navlist">
                <img src="/home/image/sy3.png"/>
                <div>免费</div>
            </div>
            <div class="navlist">
                <img src="/home/image/sy4.png"/>
                <div>全部</div>
            </div>
        </div>

        <!--免费体验-->
        <div class="tiyan">
            <div class="title fle fle_b fle_a_c">
                <div class="titlf">免费体验</div>
                <div class="more font12 cor9">
                    <span>更多</span>
                    <span class="icon iconfont icon-gengduo"></span>
                </div>
            </div>

            <div class="tycen fle">
                <div class="tylist">
                    <div class="tyimg">
                        <img src="/home/image/sp1.png"/>
                        <div class="topright">
                            <img src="/home/image/biao1.png"/>
                        </div>
                    </div>
                    <div class="tytit w_s">
                        这五句话让你这五句话让你...
                    </div>
                    <div class="study1 font12">
                        <span class="icon iconfont icon-icon-test"></span>
                        <span class="cor9">7.5万人学习</span>
                    </div>
                </div>

                <div class="tylist">
                    <div class="tyimg">
                        <img src="/home/image/sp1.png"/>
                        <div class="topright">
                            <img src="/home/image/biao1.png"/>
                        </div>
                    </div>
                    <div class="tytit w_s">
                        这五句话让你...
                    </div>
                    <div class="study1 font12">
                        <span class="icon iconfont icon-icon-test"></span>
                        <span class="cor9">7.5万人学习</span>
                    </div>
                </div>

                <div class="tylist">
                    <div class="tyimg">
                        <img src="/home/image/sp1.png"/>
                        <div class="topright">
                            <img src="/home/image/biao1.png"/>
                        </div>
                    </div>
                    <div class="tytit w_s">
                        这五句话让你...
                    </div>
                    <div class="study1 font12">
                        <span class="icon iconfont icon-icon-test"></span>
                        <span class="cor9">7.5万人学习</span>
                    </div>
                </div>
            </div>
        </div>

        <!--健谈智慧-->
        <div class="yuer">
            <div class="title fle fle_b fle_a_c">
                <div class="titlf">健谈智慧</div>
                <div class="more font12 cor9">
                    <span>更多</span>
                    <span class="icon iconfont icon-gengduo"></span>
                </div>
            </div>
            <div class="spcen">
                <div class="splist fle">
                    <div class="spimg">
                        <img src="/home/image/sp1.png"/>
                        <div class="xuan">
                            <img src="/home/image/biao2.png"/>
                        </div>
                    </div>
                    <div class="spright">
                        <h4 class="w_s">生而为人，直面焦虑</h4>
                        <div class="font14 cor9 mart10">当自己越想积极乐观的时候，心里的负能量就越是喷薄欲出。怎么做才能走出阴影，直面焦虑呢？</div>
                        <div class="font12 cor9 mart5">2019-06-22</div>
                        <div class="study fle fle_b">
                            <div class="number">
                                <span class="icon iconfont icon-icon-test"></span>
                                <span class="font12 cor3">3.5万人学习</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="splist fle">
                    <div class="spimg">
                        <img src="/home/image/sp1.png"/>
                        <div class="xuan">
                            <img src="/home/image/biao2.png"/>
                        </div>
                    </div>
                    <div class="spright">
                        <h4 class="w_s">生而为人，直面焦虑</h4>
                        <div class="font14 cor9 mart10">当自己越想积极乐观的时候，心里的负能量就越是喷薄欲出。怎么做才能走出阴影，直面焦虑呢？</div>
                        <div class="font12 cor9 mart5">2019-06-22</div>
                        <div class="study fle fle_b">
                            <div class="number">
                                <span class="icon iconfont icon-icon-test"></span>
                                <span class="font12 cor3">3.5万人学习</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="splist fle">
                    <div class="spimg">
                        <img src="/home/image/sp1.png"/>
                        <div class="xuan">
                            <img src="/home/image/biao2.png"/>
                        </div>
                    </div>
                    <div class="spright">
                        <h4 class="w_s">生而为人，直面焦虑</h4>
                        <div class="font14 cor9 mart10">当自己越想积极乐观的时候，心里的负能量就越是喷薄欲出。怎么做才能走出阴影，直面焦虑呢？</div>
                        <div class="font12 cor9 mart5">2019-06-22</div>
                        <div class="study fle fle_b">
                            <div class="number">
                                <span class="icon iconfont icon-icon-test"></span>
                                <span class="font12 cor3">3.5万人学习</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="jingpin">
            <div class="title fle fle_b fle_a_c">
                <div class="titlf">精品推荐</div>
                <div class="more font12 cor9">
                    <span>更多</span>
                    <span class="icon iconfont icon-gengduo"></span>
                </div>
            </div>
            <div class="jpcen clearfloat">
                <div class="jplist">
                    <div class="jpimg">
                        <img src="/home/image/jingpin.png"/>
                    </div>
                    <div class="jpmain">
                        <h4 class="w_s">寒门再难出贵子</h4>
                        <div class="w_s cor9">现实的困顿，虽时刻给我 现实的困顿，虽时刻给我...</div>
                    </div>
                </div>
                <div class="jplist">
                    <div class="jpimg">
                        <img src="/home/image/jingpin.png"/>
                    </div>
                    <div class="jpmain">
                        <h4 class="w_s">寒门再难出贵子</h4>
                        <div class="w_s cor9">现实的困顿，虽时刻给我 现实的困顿，虽时刻给我...</div>
                    </div>
                </div>
                <div class="jplist">
                    <div class="jpimg">
                        <img src="/home/image/jingpin.png"/>
                    </div>
                    <div class="jpmain">
                        <h4 class="w_s">寒门再难出贵子</h4>
                        <div class="w_s cor9">现实的困顿，虽时刻给我 现实的困顿，虽时刻给我...</div>
                    </div>
                </div>
                <div class="jplist">
                    <div class="jpimg">
                        <img src="/home/image/jingpin.png"/>
                    </div>
                    <div class="jpmain">
                        <h4 class="w_s">寒门再难出贵子</h4>
                        <div class="w_s cor9">现实的困顿，虽时刻给我 现实的困顿，虽时刻给我...</div>
                    </div>
                </div>
            </div>

            <div class="huanyipi fle fle_a_c">
                <span class="icon iconfont icon-shuaxinhuanyipi"></span>
                <span>换一批</span>
            </div>
        </div>

        <!--名师来了-->
        <div class="guanxi">
            <div class="title fle fle_b fle_a_c">
                <div class="titlf">名师来了</div>
                <div class="more font12 cor9">
                    <span>更多</span>
                    <span class="icon iconfont icon-gengduo"></span>
                </div>
            </div>

            <div class="gxcen">
                <div class="gxlist">
                    <div class="gximg">
                        <img src="/home/image/sp3.png"/>
                    </div>
                    <div class="gxmain">
                        <h4>你多久没有投资你自己了？</h4>
                        <div class="cor9">从负债400万到身价4个亿，为什么他可以成功？</div>
                    </div>
                </div>
                <div class="gxlist">
                    <div class="gximg">
                        <img src="/home/image/sp3.png"/>
                    </div>
                    <div class="gxmain">
                        <h4>你多久没有投资你自己了？</h4>
                        <div class="cor9">从负债400万到身价4个亿，为什么他可以成功？</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="xuanfu">
        <a href="/home/user/pay"><img src="/home/image/vip.png"/></a>
        <div class="close">
            <img src="/home/image/close.png"/>
        </div>
    </div>

    <!--全部跳过-->
    <div class="fix">
        <div class="tiaoguo">
            <img src="/home/image/tiaoguo.png"/>
        </div>
    </div>
</div>
<#include "../common/footer.ftl"/>
</body>
<script type="text/javascript" src="/home/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/home/js/common.js"></script>
<script type="text/javascript" src="/home/js/swiper.min.js"></script>
<script type="text/javascript" src="/home/js/mui.min.js"></script>
<script>
    /*banner*/
    var swiper = new Swiper('.swiper-container', {
        loop: true,
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        autoplay: {
            disableOnInteraction: false,
        },
    });

    /*全部跳过*/
    $('.tiaoguo').click(function () {
        $('.fix').hide();
        $('body').css('overflow-y', 'scroll');
    })

    /*点击关闭*/
    $('.close').click(function () {
        $('.xuanfu').hide();
    })
</script>
</html>