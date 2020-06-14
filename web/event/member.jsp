<%--
  Created by IntelliJ IDEA.
  User: Link Chen
  Date: 6/9/2020
  Time: 2:52 PM
  To change this template use File | Settings | File Templates.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>活动成员详情</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/jquery.contextMenu.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/skins.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/group-ui.css" rel="stylesheet"/>
</head>
<body class="gray-bg">
<div class="container-div">
    <div class="row">
        <div class="col-sm-12 search-collapse">
            <div class="text-box" style="font-size: 20px;margin-top:10px">
                <label for="content">活动详情：</label> <input type="text" id="content" value="${event.content}" disabled>
            </div>
        </div>

        <div class="btn-group-sm" id="toolbar" role="group">
            <a class="btn btn-success" onclick="$.operate.add()">
                <i class="fa fa-plus"></i> 邀请成员
            </a>
            <a class="btn btn-danger multiple disabled" onclick="$.operate.removeAll()">
                <i class="fa fa-remove"></i> 删除成员
            </a>
        </div>

        <div class="col-sm-12 select-table table-striped">
            <table id="bootstrap-table"></table>
        </div>
    </div>
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

<script>
    var ctx = getContextPath();

    $(function ()
    {
        var options = {
            url: ctx + "/member/listmember/${event.eventid}",
            createUrl: ctx + "/member/listuser/${event.eventid}",
            removeUrl: ctx + "/member/remove/${event.eventid}",
            striped: true,                      //是否显示行间隔色
            pagination: false,
            dataField: "rows",
            uniqueId: "uid",
            modalName: "成员",
            columns: [{
                checkbox: true
            },
                {
                    field: 'uid',
                    title: '用户ID',
                    sortable: true,
                    align: 'center',
                },
                {
                    field: 'username',
                    title: '用户名'
                },
                {
                    field: 'gender',
                    title: '性别',
                    align: 'center',
                    //通过formatter处理男女值
                    formatter: function (value)
                    {
                        if (value == "male")
                        {
                            return "男";
                        }
                        else
                        {
                            return "女";
                        }
                    }
                },
                {
                    field: 'phone',
                    title: '电话号码',
                },
                {
                    field: 'identity',
                    title: '队长',
                    align: 'center',
                    formatter(value, row, index)
                    {
                        return isleader(row);
                    }
                }
            ]
        };
        $.table.init(options);
    });

    function isleader(row)
    {
        if ("${leader.uid}" == "")
        {
            return '<i class=\"fa fa-toggle-off text-info fa-2x\" onclick="changeLeader(\'' + row.uid + '\')"></i> ';
        }
        if (row.uid == "${leader.uid}")
        {
            return '<i class=\"fa fa-toggle-on text-info fa-2x\"></i> ';
        }
        return '<i class=\"fa fa-toggle-off text-info fa-2x\" onclick="changeLeader(\'' + row.uid + '\')"></i> ';
    }

    function changeLeader(uid)
    {
        $.modal.confirm("确认将该成员设置为队长吗？", function ()
        {
            $.ajax({
                url: ctx + "/member/leader",
                type: 'post',
                dataType: 'json',
                data: {"uid": uid, "eventid":${event.eventid}},
                //这里必须禁止cache，因为el表达式需要重新加载整个页面信息
                cache: false,
                success: function (result)
                {
                    if (result.code == 0)
                    {
                        $.modal.msg("队长更换成功", "success");
                        window.location.reload();
                    }
                    else
                    {
                        $.modal.msg("队长更换失败", "error");
                    }
                }
            });
        })
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
