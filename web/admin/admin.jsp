<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>拼团系统首页</title>
    <meta name="description" content="拼团后台管理框架">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/jquery.contextMenu.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/skins.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/group-ui.css" rel="stylesheet"/>
    <!-- 360浏览器急速模式 -->
    <meta name="renderer" content="webkit">
    <!-- 避免IE使用兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <style type="text/css">label.error {
        position: inherit;
    }</style>
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow: hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close">
            <i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li>
                    <div class="user-panel">
                        <a title="个人中心"
                           href="javascript:void(0)"
                           onclick="$.modal.open('个人中心', '${pageContext.request.contextPath}/admin/update/${user.uid}')">
                            <div class="hide">个人中心</div>
                            <div class="pull-left image">
                                <img src="${pageContext.request.contextPath}/img/profile.PNG"
                                     class="img-circle" alt="User Image">
                            </div>
                        </a>
                        <div class="pull-left info">
                            <p><strong>${user.username}</strong></p>
                            <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
                            <a href="/logout" style="padding-left:5px;"><i class="fa fa-sign-out text-danger"></i>
                                注销</a>
                        </div>
                    </div>
                </li>
                <li>
                    <a class="menuItem" href="${pageContext.request.contextPath}/common/index.jsp"><i
                            class="fa fa-home"></i> <span class="nav-label">首页</span></a>
                </li>
                <li>
                    <a class="menuItem" href="${pageContext.request.contextPath}/admin/manageuser.jsp"><i
                            class="fa fa-gear"></i><span class="nav-label">用户管理</span></a>
                </li>
                <li>
                    <a class="menuItem" href="${pageContext.request.contextPath}/event/manageevent.jsp"><i
                            class="fa fa-cubes" aria-hidden="true"></i><span class="nav-label">组团管理</span></a>
                </li>

                <li>
                    <a class="menuBlank" href="#">
                        <i class="fa fa-location-arrow"></i>
                        <span class="nav-label">码云链接</span>
                        <span></span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->

    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2" style="color:#FFF;" href="#" title="收起菜单">
                        <i class="fa fa-bars"></i>
                    </a>
                </div>
                <ul class="nav navbar-top-links navbar-right welcome-message">
                    <li><a title="全屏显示" href="javascript:void(0)" id="fullScreen"><i class="fa fa-arrows-alt"></i> 全屏显示</a>
                    </li>
                    <li><h1 style="color:white">欢迎您，${user.username}！</h1></li>
                    <li class="dropdown user-menu">
                        <a href="javascript:void(0)" class="dropdown-toggle" data-hover="dropdown">
                            <img src="${pageContext.request.contextPath}/img/profile.PNG"
                                 class="user-image">
                        </a>
                        <ul class="dropdown-menu">
                            <li class="mt5">
                                <a title="个人中心"
                                   href="javascript:void(0)"
                                   onclick="$.modal.open('个人中心', '${pageContext.request.contextPath}/admin/update/${user.uid}')">
                                    <i class="fa fa-user"></i>个人中心</a>
                            </li>
                            <li>
                                <a onclick="resetPwd()">
                                    <i class="fa fa-key"></i> 修改密码</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="${pageContext.request.contextPath}/user/logout">
                                    <i class="fa fa-sign-out"></i> 退出登录</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="row content-tabs">
            <button class="roll-nav roll-left tabLeft">
                <i class="fa fa-backward"></i>
            </button>
            <nav class="page-tabs menuTabs">
                <div class="page-tabs-content">
                    <a href="${pageContext.request.contextPath}/common/index.jsp" class="active menuTab">首页</a>
                </div>
            </nav>
            <button class="roll-nav roll-right tabRight">
                <i class="fa fa-forward"></i>
            </button>
            <a href="javascript:void(0);" class="roll-nav roll-right tabReload"><i class="fa fa-refresh"></i> 刷新</a>
        </div>

        <a id="ax_close_max" class="ax_close_max" href="#" title="关闭全屏"> <i class="fa fa-times-circle-o"></i> </a>

        <div class="row mainContent" id="content-main">
            <iframe class="RuoYi_iframe" name="iframe0" width="100%" height="100%"
                    src="${pageContext.request.contextPath}/common/index.jsp" frameborder="0" seamless></iframe>
        </div>

        <div class="footer">
            <div class="pull-right"> &copy; 2020 All Rights Reserved. Chen, Xu</div>
        </div>
    </div>
    <!--右侧部分结束-->
</div>


<!-- 全局js -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.contextMenu.min.js"></script>
<script src="${pageContext.request.contextPath}/ajax/libs/blockUI/jquery.blockUI.js"></script>
<script src="${pageContext.request.contextPath}/ajax/libs/layer/layer.min.js"></script>
<script src="${pageContext.request.contextPath}/js/group-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
<script src="${pageContext.request.contextPath}/ajax/libs/fullscreen/jquery.fullscreen.js"></script>

<script>
    var ctx = getContextPath();
    // 皮肤缓存
    var skin = storage.get("skin");
    // history（表示去掉地址的#）否则地址以"#"形式展示
    var mode = "history";
    // 历史访问路径缓存
    var historyPath = storage.get("historyPath");

    // 本地主题优先，未设置取系统配置
    if ($.common.isNotEmpty(skin))
    {
        $("body").addClass(skin.split('|')[0]);
        $("body").addClass(skin.split('|')[1]);
    }
    else
    {
        $("body").addClass([[${sideTheme}]]);
        $("body").addClass([[${skinName}]]);
    }

    /* 用户管理-重置密码 */
    function resetPwd()
    {
        var url = ctx + 'system/user/profile/resetPwd';
        $.modal.open("重置密码", url, '770', '380');
    }

    /** 刷新时访问路径页签 */
    function applyPath(url)
    {
        $('a[href$="' + decodeURI(url) + '"]').click();
        if (!$('a[href$="' + url + '"]').hasClass("noactive"))
        {
            $('a[href$="' + url + '"]').parent("li").addClass("selected").parents("li").addClass("active").end().parents("ul").addClass("in");
        }
    }

    $(function ()
    {
        if ($.common.equals("history", mode) && window.performance.navigation.type == 1)
        {
            var url = storage.get('publicPath');
            if ($.common.isNotEmpty(url))
            {
                applyPath(url);
            }
        }
        else
        {
            var hash = location.hash;
            if ($.common.isNotEmpty(hash))
            {
                var url = hash.substring(1, hash.length);
                applyPath(url);
            }
        }
    });

    function getContextPath()
    {
        var pathName = document.location.pathname;
        var index = pathName.substr(1).indexOf("/");
        var result = pathName.substr(0, index + 1);
        return result;
    }

</script>
</body>
</html>