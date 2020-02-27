<div class="layui-header">
    <div class="layui-logo">layui 后台布局</div>
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="javascript:;">
                <#if admin.head??>
                    <img src="${admin.head!}" class="layui-nav-img">
                <#else >
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                </#if>
                <#if admin.name??>
                    ${admin.name!}
                <#else >
                    贤心
                </#if>
            </a>
        </li>
        <li class="layui-nav-item"><a href="/admin/admin/quit">退出登录</a></li>
    </ul>
