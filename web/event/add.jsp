<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>添加活动</title>
    <meta name="description" content="拼团后台管理框架">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/jquery.contextMenu.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/skins.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/group-ui.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/ajax/libs/datepicker/bootstrap-datetimepicker.css" rel="stylesheet"/>

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
    <form class="form-horizontal m" id="form-role-add">
        <div class="form-group">
            <label class="col-sm-3 control-label is-required" for="eventname">活动名：</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" name="eventname" id="eventname" placeholder="活动名" required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required" for="content">活动详情：</label>
            <div class="col-sm-8">
                <textarea class="form-control" type="text" name="content" id="content" required></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required" for="starttime">开始时间：</label>
            <div class="col-sm-8">
                <input class="datepicker" type="text" name="starttime" id="starttime" placeholder="请选择日期" readonly
                       required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required" for="length">持续时间/(天)：</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" name="length" id="length" placeholder="持续时间" required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required" for="maxperson">最大人数：</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" name="maxperson" id="maxperson"
                       placeholder="最大人数" required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required" for="totalmoney">总金额/(元)：</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" name="totalmoney" id="totalmoney" placeholder="总金额" required>
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
<script src="${pageContext.request.contextPath}/ajax/libs/datepicker/bootstrap-datetimepicker.js"></script>
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
    $("input[name='starttime']").datetimepicker({
        minView: "day", //  选择时间时，最小可以选择到那层；默认是‘hour’也可用0表示
        language: 'zh-CN', // 语言
        autoclose: true, //  true:选择时间后窗口自动关闭
        format: 'yyyy-mm-dd hh:00', // 文本框时间格式，设置为0,最后时间格式为2017-03-23
        todayBtn: true, // 如果此值为true 或 "linked"，则在日期时间选择器组件的底部显示一个 "Today" 按钮用以选择当前日期。
        startDate: new Date() // 窗口可选时间从今天开始
    });
    jQuery.validator.addMethod("validateInt", function (value, element)
    {
        var Val = parseInt(value);
        return Val > 0 && (Val + "") == value;
    }, "请输入正整数");
    jQuery.validator.addMethod("lessTen", function (value, element)
    {
        var Val = parseInt(value);
        return Val > 0 && Val <= 10 && (Val + "") == value;
    }, "请输入正整数，且不大于10");
    var ctx = getContextPath();
    var icon = "<i class='fa fa-times-circle'></i> ";
    $("#form-role-add").validate({
        rules: {
            eventname: {
                required: true
            },
            content: {
                required: true,
                maxlength: 200
            },
            starttime: {
                required: true
            },
            length: {
                required: true,
                validateInt: true,
                lessTen: true
            },
            maxperson: {
                required: true,
                validateInt: true,
                lessTen: true
            },
            totalmoney: {
                required: true,
                validateInt: true
            }
        },
        messages: {
            eventname: {
                required: icon + "请输入活动名称"
            },
            content: {
                required: icon + "请输入活动详情",
                maxlength: icon + "最大长度为200"
            },
            starttime: {
                required: icon + "请输入活动开始时间"
            },
            length: {
                required: icon + "请输入活动持续时间",
                validateInt: icon + "必须是正整数",
                lessTen: icon + "最多10天"
            },
            maxperson: {
                required: icon + "请输入活动最大人数",
                validateInt: icon + "必须是正整数",
                lessTen: icon + "最多10人"
            },
            totalmoney: {
                required: icon + "请输入活动总资金",
                validateInt: icon + "必须是正整数",
            }
        }
    });

    function submitHandler()
    {
        if ($.validate.form())
        {
            add();
        }
    }

    function add()
    {
        var eventname = $.common.trim($("input[name='eventname']").val());
        var content = $.common.trim($("textarea[name='content']").val());
        var starttime = $("input[name='starttime']").val();
        var length = $("input[name='length']").val();
        var maxperson = $("input[name='maxperson']").val();
        var totalmoney = $("input[name='totalmoney']").val();

        $.ajax({
            type: "post",
            url: ctx + "/event/add",
            data: {
                "eventname": eventname,
                "content": content,
                "starttime": starttime,
                "length": length,
                "maxperson": maxperson,
                "totalmoney": totalmoney
            },
            success: function (r)
            {
                if (r.code == 0)
                {
                    layer.alert("<font color='red'>添加活动：" + r.msg + " 成功！</font>", {
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