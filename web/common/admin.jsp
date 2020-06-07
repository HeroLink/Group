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
    <script>
        if (window.top !== window.self)
        {
            alert('未登录或登录超时。请重新登录');
            window.top.location = window.location
        }
        ;
    </script>
</head>
<body>
<h1>登录成功，显示admin主页！</h1>
<!-- 全局js -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- 验证插件 -->
<script src="${pageContext.request.contextPath}/ajax/libs/validate/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/ajax/libs/validate/messages_zh.min.js"></script>
<script src="${pageContext.request.contextPath}/ajax/libs/layer/layer.min.js"></script>
<script src="${pageContext.request.contextPath}/ajax/libs/blockUI/jquery.blockUI.js"></script>
<script src="${pageContext.request.contextPath}/js/group-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/login.js"></script>
</body>
</html>