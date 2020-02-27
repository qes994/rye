<link href="/home/css/mui.min.css" rel="stylesheet"/>
<style>
    body {
        background: #F5F5F7;
    }

    .mui-tab-item {
        position: relative;
    }

    .mui-tab-item div.mui-tab-label {
        font-size: 0.1rem;
        color: #999999;
    }

    .mui-bar-tab {
        height: 0.5rem;
    }

    .mui-bar {
        background: #FFFFFF;
        box-shadow: none;
    }

    .mui-bar-tab .mui-tab-item.mui-active .mui-tab-label {
        color: #01A449;
        font-weight: bold;
    }

    .mui-bar-tab .mui-tab-item {
        color: #808A98;
        position: relative;
        line-height: 0.17rem;
    }

    .mui-tab-item .iconfont {
        color: #BBB9B9;
        font-size: 0.27rem;
        line-height: 0.27rem;
    }

    .addicon, .addhover {
        width: 0.24rem;
        height: 0.24rem;
        margin: 0 auto;
    }

    .addicon {
        display: block;
    }

    .addhover {
        display: none;
    }

    .addicon img, .addhover img {
        width: 0.24rem;
        height: 0.24rem;
    }

    .mui-active .addhover {
        display: block;
    }

    .mui-active .addicon {
        display: none;
    }
</style>
<nav class="mui-bar mui-bar-tab">
    <a class="mui-tab-item <#if controller=="PageController"!>mui-active</#if>" href="/">
        <div class="addicon"><img src="/home/image/nav1.png"/></div>
        <div class="addhover"><img src="/home/image/nav1h.png"/></div>
        <div class="mui-tab-label">健谈智慧</div>
    </a>
    <a class="mui-tab-item <#if controller==""!>mui-active</#if>" href="#">
        <div class="addicon"><img src="/home/image/nav2.png"/></div>
        <div class="addhover"><img src="/home/image/nav2h.png"/></div>
        <div class="mui-tab-label">家庭教育</div>
    </a>
    <a class="mui-tab-item <#if controller==""!>mui-active</#if>" href="#">
        <div class="addicon"><img src="/home/image/nav3.png"/></div>
        <div class="addhover"><img src="/home/image/nav3h.png"/></div>
        <div class="mui-tab-label">麦田淘课</div>
    </a>
    <a class="mui-tab-item <#if controller=="UserController"!>mui-active</#if>" href="/home/user/home">
        <div class="addicon"><img src="/home/image/nav4.png"/></div>
        <div class="addhover"><img src="/home/image/nav4h.png"/></div>
        <div class="mui-tab-label">我的</div>
    </a>
</nav>
<script type="text/javascript" src="/home/js/mui.min.js"></script>
<script>
    mui('body').on('tap', 'a', function () {
        if (this.href) {   //判断链接是否存在
            location.href = this.href;
        }
    });
</script>