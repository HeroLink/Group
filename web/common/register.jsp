<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>登录拼团系统</title>
    <meta name="description" content="拼团后台管理框架">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/login.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/group-ui.css" rel="stylesheet"/>
    <!-- 360浏览器急速模式 -->
    <meta name="renderer" content="webkit">
    <!-- 避免IE使用兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <style type="text/css">label.error {
        position: inherit;
    }</style>
</head>
<body class="signin">
<div class="signinpanel">
    <div class="row">
        <div class="col-sm-7">
            <div class="signin-info">
                <div class="m-b"></div>
                <h4 style="font-size: 25px">欢迎使用 <strong>组团管理系统</strong></h4>
                <ul class="m-b">
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> Spring</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> SpringMVC</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> MyBatis</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> Bootstrap</li>
                </ul>
                <strong>已经注册过? <a href="${pageContext.request.contextPath}/common/login.jsp" style="color:red">直接登录&raquo;</a></strong>
            </div>
        </div>
        <div class="col-sm-5">
            <form id="registerForm" autocomplete="off">
                <h4 class="no-margins" style="font-size: 20px">注册：</h4>
                <input type="text" name="username" class="form-control uname" placeholder="用户名" maxlength="20"/>
                <input type="password" name="password" class="form-control pword" placeholder="密码" maxlength="20"/>
                <input type="password" name="confirmPassword" class="form-control pword" placeholder="确认密码"
                       maxlength="20"/>
                <div class="row m-t">
                    <div class="col-xs-6">
                        <input type="text" name="validateCode" class="form-control code" placeholder="验证码"
                               maxlength="5">
                    </div>
                    <div class="col-xs-6">
                        <a href="javascript:void(0);" title="点击更换验证码">
                            <img src="${pageContext.request.contextPath}/getcode" class="imgcode" width="85%"/>
                        </a>
                    </div>
                </div>
                <button style="font-size: 20px" class="btn btn-success btn-block" id="btnSubmit"
                        data-loading="正在验证注册，请稍后...">注册
                </button>
            </form>
        </div>
    </div>
    <div class="signup-footer">
        <div class="pull-left">
            &copy; 2020 All Rights Reserved. Chen, Xu <br>
        </div>
    </div>
</div>

<!-- 全局js -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- 验证插件 -->
<script src="${pageContext.request.contextPath}/ajax/libs/validate/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/ajax/libs/validate/messages_zh.min.js"></script>
<script src="${pageContext.request.contextPath}/ajax/libs/layer/layer.min.js"></script>
<script src="${pageContext.request.contextPath}/ajax/libs/blockUI/jquery.blockUI.js"></script>
<script src="${pageContext.request.contextPath}/js/group-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/register.js"></script>
</body>
</html>