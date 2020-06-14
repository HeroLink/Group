<%--
  Created by IntelliJ IDEA.
  User: Link Chen
  Date: 6/9/2020
  Time: 2:53 PM
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
    <title>组团管理界面</title>
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
            <form id="user-form">
                <div class="select-list">
                    <ul>
                        <li>
                            活动ID：<input type="text" name="eventid"/>
                        </li>
                        <li>
                            活动名：<input type="text" name="eventname"/>
                        </li>
                        <li>
                            <a class="btn btn-primary btn-rounded btn-sm" onclick="$.table.search()"><i
                                    class="fa fa-search"></i>&nbsp;搜索</a>
                            <a class="btn btn-warning btn-rounded btn-sm" onclick="$.form.reset()"><i
                                    class="fa fa-refresh"></i>&nbsp;重置</a>
                        </li>
                    </ul>
                </div>
            </form>
        </div>

        <div class="btn-group-sm" id="toolbar" role="group">
            <a class="btn btn-success" onclick="$.operate.add()">
                <i class="fa fa-plus"></i> 发布活动
            </a>
            <a class="btn btn-info multiple disabled" onclick="apply()">
                <i class="fa fa-ticket"></i> 申请加入
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

    function apply()
    {
        $.ajax(
            {

            }
        )

    }

    $(function ()
    {
        var options = {
            url: ctx + "/event/list",
            createUrl: ctx + "/event/add.jsp",
            striped: true,                      //是否显示行间隔色
            sortable: true,
            sortName: "eventid",
            sortOrder: "asc",
            sidePagination: "server",
            pagination: true,
            pageNumber: 1, //初始化页码
            pageSize: 20,  // 指定每页的大小
            pageList: [20, 30, 50], // 可以设置每页记录条数的列表
            dataField: "rows",
            uniqueId: "eventid",
            modalName: "活动",
            columns: [{
                checkbox: true
            },
                {
                    field: 'eventid',
                    title: '活动ID',
                    sortable: true,
                    align: 'center',
                },
                {
                    field: 'eventname',
                    title: '活动名'
                },
                {
                    field: 'content',
                    title: '活动详情',
                },
                {
                    field: 'starttime',
                    title: '开始时间',
                },
                {
                    field: 'length',
                    title: '持续时间/(天)',
                    align: 'center',
                },
                {
                    field: 'curperson',
                    title: '当前人数',
                    align: 'center',
                },
                {
                    field: 'maxperson',
                    title: '最大人数',
                    align: 'center',
                },
                {
                    field: 'curmoney',
                    title: '当前资金/(元)',
                    align: 'center',
                },
                {
                    field: 'totalmoney',
                    title: '总资金/(元)',
                    align: 'center',
                }
            ]
        };
        $.table.init(options);
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

