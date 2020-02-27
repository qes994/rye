<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->

        <ul class="layui-nav layui-nav-tree" lay-filter="nav">
            <li class="layui-nav-item <#if controller=="AdminController">layui-nav-itemed</#if>">
                <a class="" href="javascript:;"><i class="iconfont icon-guanli"></i>系统设置</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="/admin/admin/index"><i class="iconfont icon-xitonggaikuang"></i>系统概况</a>
                    </dd>
                </dl>
            </li>
            <li class="layui-nav-item <#if controller=="UserController">layui-nav-itemed</#if>">
                <a class="" href="javascript:;"><i class="iconfont icon-geren"></i>用户管理</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="/admin/user/index"><i class="iconfont icon-yonghu"></i>用户列表</a>
                    </dd>
                </dl>
            </li>
            <li class="layui-nav-item <#if controller=="IssueController">layui-nav-itemed</#if>">
                <a class="" href="javascript:;"><i class="iconfont icon-luntanguanli"></i>发布管理</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="/admin/issue/wit"><i class="iconfont icon-pinglunguanli"></i>健谈智慧</a>
                    </dd>
                   <#-- <dd>
                        <a href="/admin/issue/education"><i class="iconfont icon-pinglunguanli"></i>家庭教育</a>
                    </dd>
                    <dd>
                        <a href="/admin/issue/taoke"><i class="iconfont icon-pinglunguanli"></i>麦田淘课</a>
                    </dd>-->
                </dl>
            </li>
            <li class="layui-nav-item <#if controller=="ManageController">layui-nav-itemed</#if>">
                <a href="javascript:;"><i class="iconfont icon-guanliyuanguanli"></i>权限管理</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="/admin/manage/index"><i class="iconfont icon-guanliyuanliebiao"></i>权限列表</a>
                    </dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="/admin/admin/add">
                    <i class="iconfont icon-increase">添加管理员</i>
                </a>
            </li>
        </ul>

    </div>
</div>