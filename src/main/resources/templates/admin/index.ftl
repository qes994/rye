<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>管理后台</title>
    <link rel="stylesheet" href="/admin/layui/css/layui.css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1516038_9xj3nqitnch.css"/>
    <link rel="stylesheet" href="/admin/css/style.css?t=1578049660"/>
    <link rel="stylesheet" href="/admin/css/style1.css"/>
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1597383_cm5k7u5qtoq.css"/>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <#include "common/head.ftl"/>

    <#include "common/right.ftl"/>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <script src="http://code.highcharts.com/highcharts.js"></script>
            <#-- <script src="https://code.highcharts.com.cn/highcharts/highcharts.js"></script>-->
            <div class="box">
                <div class="title">快捷方式</div>
                <div class="body">
                    <ul class="ul_list menu_list clearfloat">
                        <li onclick="openurl('/admin/admin/index');">
                            <i class="iconfont icon-geren"></i>
                            <div class="name">系统概况</div>
                        </li>
                        <li onclick="openurl('/admin/user/index');">
                            <i class="iconfont icon-geren"></i>
                            <div class="name">用户管理</div>
                        </li>
                        <li onclick="openurl('/admin/issue/wit');">
                            <i class="iconfont icon-wenzhang-copy"></i>
                            <div class="name">发布管理</div>
                        </li>
                        <li onclick="openurl('/admin/admin/index');">
                            <i class="iconfont icon-pinglunguanli"></i>
                            <div class="name">权限管理</div>
                        </li>
                        <li onclick="openurl('/admin/admin/add');">
                            <i class="iconfont icon-increase"></i>
                            <div class="name">添加管理员</div>
                        </li>
                    </ul>
                </div>
                <div class="box data-graph">
                    <div class="title">数据概览</div>
                    <div class="body">
                        <div class="left" id="left"></div>
                        <div class="right" id="right"></div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
        <#include "common/footer.ftl"/>
    </div>


</div>

<script src="/admin/layui/layui.all.js"></script>
<script>
    var carousel = layui.carousel;
    var form = layui.form;
    var $ = layui.jquery;
    var jQuery = $;
</script>
<script>
    layui.use(['table', 'element', 'jquery'], function () {
    })

    function openurl(url) {
        window.location.href = url;
    }

    //查出用户的

    $.ajax({
        url: "/admin/admin/chart",
        type: "POST",
        success: function (data) {
            console.log(data)
            var data1 = [{
                "name": "\u7528\u6237\u6ce8\u518c\u603b\u91cf",
                "data": [2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            }];
            var t1 = '2020年各月份注册用户量';
            Highcharts.setOptions({
                colors: ['#058DC7', '#5cb85c']
            });
            setdata('left', t1, '数据来源：麦田微课', '人', data1);

            function setdata(dv, title, laiyuan, danwei, data) {
                console.log(data)
                Highcharts.chart(dv, {
                    chart: {
                        type: 'spline'
                    },
                    title: {
                        text: title
                    },
                    subtitle: {
                        text: laiyuan
                    },
                    xAxis: {
                        categories: data
                    },
                    yAxis: {
                        title: {
                            text: danwei
                        }
                    },
                    exporting: {
                        enabled: false
                    },
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        line: {
                            dataLabels: {
                                // 开启数据标签
                                enabled: true
                            },
                            // 关闭鼠标跟踪，对应的提示框、点击事件会失效
                            enableMouseTracking: false
                        }
                    },
                    series: data
                });

            }
        }
    })

</script>

</body>
</html>