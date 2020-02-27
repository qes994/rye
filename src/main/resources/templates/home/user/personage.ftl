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
    <link rel="stylesheet" href="/home/css/mui.picker.min.css"/>
    <link rel="stylesheet" href="/home/webuploader/webuploader.css" charset="UTF-8"/>
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

    </style>
</head>
<body>
<input type="hidden" name="id" value="${user.id}" id="id">
<div class="app">
    <!-- 主页面标题 -->
    <header class="header mui-bar mui-bar1 mui-bar-nav">
        <span class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></span>
        <h1 class="mui-title">个人信息</h1>
    </header>
    <div class="main font16">
        <div class="set">
            <div class="setlist fle fle_b fle_a_c">
                <div class="cor6" id="upload">头像</div>
                <div class="sethead" id="setHead">
                    <img src="${user.head!}" class="head"/>
                </div>
                <input type="hidden" name="head" id="head">
            </div>
            <div class="setlist fle fle_b">
                <div class="cor6">昵称</div>
                <div class="cor3">
                    <span><input type="text" id="userName" name="userName" value="${user.userName}"
                                 style="border:none;"></span>
                    <#--<span class="icon iconfont icon-gengduo"></span>-->
                </div>
            </div>
            <div class="setlist fle fle_b">
                <div class="cor6">性别</div>
                <div class="cor3 fle" id="sex">
                    <input type="hidden" id="checked" value="${user.sex!}">
                    <label>
                        <div class="fle fle_a_c sex">
                            <input type="radio" id="radio2" class="xuanzhong" name="sex" value="2" sexid="2"/>
                            <span id="sex">女</span>
                        </div>
                    </label>
                    <label>
                        <div class="fle fle_a_c">
                            <input type="radio" id="radio1" class="xuanzhong" name="sex" value="1" sexid="1" checked/>
                            <span id="sex">男</span>
                        </div>
                    </label>
                </div>
            </div>
            <div class="setlist fle fle_b">
                <div class="cor6">出生年月</div>
                <div class="cor3 btn" id="birthday" data-options='{"type":"date"}'>
                    <span id="result">${user.birthday!}</span>
                    <span class="icon iconfont icon-gengduo"></span>
                </div>
            </div>
        </div>


        <div class="set">

            <div class="setlist fle fle_b">
                <div class="cor6">地区</div>
                <div class="cor3" id="address">
                    <span id="addcen">${user.address!}</span>
                    <span class="icon iconfont icon-gengduo"></span>
                </div>
            </div>

            <div class="setlist fle fle_b">
                <div class="cor6">邀请码</div>
                <div class="cor3">
                    <span class="cor9 font14">${user.invitationCode}</span>
                    <#--<span class="icon iconfont icon-gengduo"></span>-->
                </div>
            </div>
        </div>
        <div class="set">
            <div class="setlist fle fle_b">
                <div class="cor6">微信绑定</div>
                <a href="/oauth/authGitHub">
                    <div class="cor3" id="wechat">
                        <span id="wenxin" class="cor9 font14">未绑定</span>
                        <span class="icon iconfont icon-gengduo"></span>
                    </div>
                </a>
            </div>
        </div>
        <div class="set">
            <div class="setlist fle fle_b">
                <div class="cor6">gitHub</div>
                <a href="/oauth/authGitHub">
                    <div class="cor3" id="git">
                        <span id="git" class="cor9 font14">未绑定</span>
                        <span class="icon iconfont icon-gengduo"></span>
                    </div>
                </a>
            </div>
        </div>


    </div>
</div>
</body>
<script type="text/javascript" src="/home/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/home/js/common.js"></script>
<script type="text/javascript" src="/home/js/mui.min.js"></script>
<script type="text/javascript" src="/home/js/city.data.js"></script>
<script type="text/javascript" src="/home/js/mui.picker.min.js"></script>
<script type="text/javascript" src="/home/webuploader/webuploader.js"></script>
<script>
    /*$("#git").click(function () {
        var way = "1";
        $.ajax({
            url:"/oauth/authGitHub",
            data:{"way":way},
            type:"POST",
            success:function (data) {
                mui.toast(data.msg,{ duration:'long',type:'div'})
            }
        })
    })
    $("#wechat").click(function () {
        var way = "2";
        $.ajax({
            url:"/oauth/authGitHub",
            data:{"way":way},
            type:"POST",
            success:function (data) {
                mui.toast(data.msg,{ duration:'long',type:'div'})
            }
        })
    })*/
    $(document).ready(function () {
        $.ajax({
            url: "/home/user/auth",
            type: "GET",
            success: function (data) {
                if (data.code == 1) {
                    $("#git").text(data.msg)
                }
                if (data.code == 2) {
                    $("#wenxin").text(data.msg)
                }
            }
        })

    });

    function changes() {
        var birthday = $("#result").text();
        //console.log(birthday)
        var id = $("#id").val()
        $.ajax({
            url: "/home/user/birthDay",
            data: {"birthday": birthday, "id": id},
            type: "POST",
            success: function (data) {
                mui.toast(data.msg, {duration: 'long', type: 'div'})
            }
        })
    }

    function changes1() {
        var address = $("#addcen").text();
        console.log(address)
        var id = $("#id").val()
        $.ajax({
            url: "/home/user/adress",
            data: {"address": address, "id": id},
            type: "POST",
            success: function (data) {
                mui.toast(data.msg, {duration: 'long', type: 'div'})
            }
        })
    }

    $("#addcen").bind("DOMNodeInserted", changes1);
    $("#result").bind("DOMNodeInserted", changes);
    //性别默认选择
    var sex = $("#checked").val();
    if (sex == 1) {
        //默认选择男
        $("#radio1").attr("checked", "checked");
        $("#radio2").removeAttr("checked");
    } else if (sex == 2) {
        //默认选择女
        $("#radio2").attr("checked", "checked");
        $("#radio1").removeAttr("checked");
    }
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
            $('#addcen').html(_getParam(items[0], 'text') + '-' + _getParam(items[1], 'text') + '-' + _getParam(items[1], 'text'))
        });
    });
    //设置头像
    var uplaoder = WebUploader.create({
        swf: 'https://cdn.staticfile.org/webuploader/0.1.1/Uploader.swf',
        // 存在文件自动上传
        pick: "#setHead",
        auto: true,
        // 文件接收服务端地址。
        server: '/upload/image',
        // 限制文件类型
        accept: {
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png',
            mimeTypes: 'image/!*'
        },
        //允许重复上传
        duplicate: true,
        //上传方式
        method: 'post',
        //设定单个文件大小 不能超过20M
        fileSingleSizeLimit: 20 * 1024 * 1024
    });
    uplaoder.on('uploadSuccess', function (file, reponse) {
        console.log(reponse);
        $("#head").val(reponse.url)
        $(".head").attr("src", reponse.url)
        //修改头像
        var id = $("#id").val()
        var head = $("#head").val()
        $.ajax({
            url: "/home/user/head",
            data: {"head": head, "id": id},
            type: "POST",
            success: function (data) {
                mui.toast(data.msg, {duration: 'long', type: 'div'})
                /*if (data.code==1){

                }*/
            }
        })
        if (reponse.state == 'succ') {
            console.log(response);
            //alert(reponse.msg);
            //alert(reponse.url);
            //this.options.formData.type = '';
            this.options.formData.age = '';
            this.options.formData.uname = '';
            this.options.formData.pw = '';
            //uplaoder.removeFile(uploader.getFile(file.id));
            //uplaoder.getFiles('inited');
        } else {
            //上传失败将文件从队列中移出避免再次添加统一文件时不显示名称
            //uplaoder.removeFile(uplaoder.getFile(file.id));
            //uplaoder.getFiles('inited');
            //alert(reponse.msg);
        }
    });
    /** 上传失败 */
    uplaoder.on('uploadError', function (file) {
        $('#' + file.id).find('.state').text('上传出错！');
    });
    //修改名称
    $("#userName").blur(function () {
        //console.log("获取1次失去触发")
        var id = $("#id").val()
        var userName = $("#userName").val()
        $.ajax({
            url: "/home/user/userName",
            data: {"userName": userName, "id": id},
            type: "POST",
            success: function (data) {
                mui.toast(data.msg, {duration: 'long', type: 'div'})
            }
        })
    });
    $("#sex").click(function () {
        var sex = $('input[type="radio"]:checked').val();
        var id = $("#id").val()
        $.ajax({
            url: "/home/user/sex",
            data: {"sex": sex, "id": id},
            type: "POST",
            success: function (data) {
                mui.toast(data.msg, {duration: 'long', type: 'div'})
            }
        })
    })
</script>
</html>