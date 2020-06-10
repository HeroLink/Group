<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>修改用户</title>
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
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form-role-update">
        <div class="form-group">
            <label class="col-sm-3 control-label is-required" for="username">用户名：</label>
            <div class="col-sm-8">
                <input class="form-control uname" type="text" name="username" id="username" placeholder="用户名"
                       disabled="disabled" required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required" for="password">密码：</label>
            <div class="col-sm-8">
                <input class="form-control pword" type="password" name="password" id="password" placeholder="密码"
                       required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required" for="confirmPassword">确认密码：</label>
            <div class="col-sm-8">
                <input class="form-control pword" type="password" name="confirmPassword" id="confirmPassword"
                       placeholder="确认密码" required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required" for="gender">性别：</label>
            <div class="col-sm-8">
                <select class="form-control" type="text" name="gender" id="gender" required>
                    <option value="male">男</option>
                    <option value="female">女</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required" for="phone">电话号码：</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" name="phone" id="phone"
                       placeholder="电话号码" required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required" for="identity">身份：</label>
            <div class="col-sm-8">
                <select class="form-control" type="text" name="identity" id="identity" required>
                    <option value="0">管理员</option>
                    <option value="1">用户</option>
                </select>
            </div>
        </div>
    </form>
</div>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- bootstrap-table 表格插件 -->
<script src="${pageContext.request.contextPath}/ajax/libs/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/ajax/libs/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="${pageContext.request.contextPath}/ajax/libs/bootstrap-table/extensions/mobile/bootstrap-table-mobile.js"></script>
<script src="${pageContext.request.contextPath}/ajax/libs/bootstrap-table/extensions/toolbar/bootstrap-table-toolbar.min.js"></script>
<script src="${pageContext.request.contextPath}/ajax/libs/bootstrap-table/extensions/columns/bootstrap-table-fixed-columns.js"></script>
<!-- jquery-validate 表单验证插件 -->
<script src="${pageContext.request.contextPath}/ajax/libs/validate/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/ajax/libs/validate/messages_zh.min.js"></script>
<script src="${pageContext.request.contextPath}/ajax/libs/validate/jquery.validate.extend.js"></script>
<!-- jquery-validate 表单树插件 -->
<script src="${pageContext.request.contextPath}/ajax/libs/bootstrap-treetable/bootstrap-treetable.js"></script>

<!-- 遮罩层 -->
<script src="${pageContext.request.contextPath}/ajax/libs/blockUI/jquery.blockUI.js"></script>
<script src="${pageContext.request.contextPath}/ajax/libs/iCheck/icheck.min.js"></script>
<script src="${pageContext.request.contextPath}/ajax/libs/layer/layer.min.js"></script>
<script src="${pageContext.request.contextPath}/ajax/libs/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script src="${pageContext.request.contextPath}/js/group-ui.js"></script>

<script type="text/javascript">
    var ctx = getContextPath();
    var icon = "<i class='fa fa-times-circle'></i> ";

    $(function ()
    {
        $("input[name='username']").val("${user.username}");
        $("input[name='password']").val("${user.password}");
        $("input[name='confirmPassword']").val("${user.password}");
        if ("${user.gender}" == "")
        {
            $("select[name='gender']").val("male")
        }
        else
        {
            $("select[name='gender']").val("${user.gender}");
        }
        $("input[name='phone']").val("${user.phone}");
        $("select[name='identity']").val("${user.identity}");
    });

    $("#form-role-update").validate({
        rules: {
            username: {
                required: true,
                minlength: 2
            },
            password: {
                required: true,
                minlength: 5
            },
            confirmPassword: {
                required: true,
                equalTo: "[name='password']"
            },
            phone: {
                required: true,
                isPhone: true
            }
        },
        messages: {
            username: {
                required: icon + "请输入您的用户名",
                minlength: icon + "用户名不能小于2个字符"
            },
            password: {
                required: icon + "请输入您的密码",
                minlength: icon + "密码不能小于5个字符",
            },
            confirmPassword: {
                required: icon + "请再次输入您的密码",
                equalTo: icon + "两次密码输入不一致"
            }
        }
    });

    function submitHandler()
    {
        if ($.validate.form())
        {
            update();
        }
    }

    function update()
    {
        var username = $.common.trim($("input[name='username']").val());
        var password = $.common.trim($("input[name='password']").val());
        var gender = $("select[name='gender'] option:selected").val();
        var phone = $.common.trim($("input[name='phone']").val());
        var identity = $("select[name='identity'] option:selected").val();
        $.ajax({
            type: "post",
            url: ctx + "/admin/update",
            data: {
                "uid": ${user.uid},
                "username": username,
                "password": password,
                "gender": gender,
                "phone": phone,
                "identity": identity
            },
            success: function (r)
            {
                if (r.code == 0)
                {
                    layer.alert("<font color='red'>修改用户：" + r.msg + " 成功！</font>", {
                            icon: 1,
                            title: "系统提示"
                        },
                        function ()
                        {
                            parent.layer.closeAll();
                            parent.location.reload();
                        }
                    )
                    ;
                }
                else
                {
                    $.modal.closeLoading();
                    $.modal.msg(r.msg);
                }
            }
        });
    }

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