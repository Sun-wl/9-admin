<html>
<head>
    <title>账户管理</title>
    <link href="${request.contextPath}/static/common.css" rel="stylesheet" type="text/css"/>
	<#include "../common/resource.ftl">
</head>
<body class="sidebar-mini wysihtml5-supported skin-blue">
<div class="wrapper">
	<#include "../common/top.ftl">
	<#include "../common/left.ftl">
    <@leftMenu pageName="account"/>
    <div class="content-wrapper" style="min-height: 916px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <i class="fa  fa-search"></i>账户管理
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 基础数据管理</a></li>
                <li class="active">账户管理</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-info">
                        <div class="box-header with-border form-horizontal">
                            <div class="form-group">
                                <label for="username" class="col-sm-2 control-label">账号:</label>
                                <div class="form-group col-sm-3">
                                    <input type="tel" id="username" class="form-control" placeholder="账号" >
                                </div>

                                <label for="name" class="col-sm-2 control-label">联系人:</label>
                                <div class="form-group col-sm-3">
                                    <input type="text" id="realName" class="form-control" placeholder="联系人" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="mobile" class="col-sm-2 control-label">账号角色:</label>
                                <div class="form-group col-sm-3">
                                    <select name="entity.roleId" id="roleId" class="form-control">
                                        <option value="">----请选择----</option>
                                        <option value="1">超级管理员</option>
                                        <option value="10">助理</option>
                                        <option value="20">销售</option>
                                    </select>
                                </div>

                                <label for="mobile" class="col-sm-2 control-label">联系电话:</label>
                                <div class="form-group col-sm-3">
                                    <input type="tel" id="mobile" class="form-control" placeholder="联系电话" >
                                </div>

                                <div class="col-sm-2">
                                    <button id="search" class="btn pull-right btn-primary "><i class="fa fa-search "></i>查询</button>
                                </div>
                            </div>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <a href="/backend/admin/view">
                                <button class="btn btn-primary" style="margin:10px;">添加账号</button>
                            </a>
                            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                <table id="data-list" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                                    <thead>
                                    <tr role="row">
	                                    <th> 账号</th>
                                        <th> 用户角色</th>
                                        <th> 联系人</th>
                                        <th> 联系电话</th>
                                        <th> 状态</th>
                                        <th> 创建时间</th>
                                        <th> 最后登录时间</th>
                                        <th> 操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                    <tfoot>
                                    </tfoot>
                                </table>
                            </div>
                        </div><!-- /.box-body -->
                    </div><!-- /.box -->
                </div><!-- /.col -->
            </div><!-- /.row -->
        </section>
    </div>
<#include "../common/footer.ftl">
</div>
</body>
<script>
    var option = {
        url : "/backend/admin/list/ajax",
        columns : [
            {"data": "username"},
            {"data": "roleId"},
            {"data": "realName"},
            {"data": "mobile"},
            {"data": "status"},
            {"data": "createTime"},
            {"data": "lastLoginTime"},
            {"data": "id"}
        ],
        columnDefs : [
            {
                "aTargets": [1],
                "data": "roleId",
                "render": function (data, type, full) {

                    if(data){

                        if(data ==1) return "超级管理员";
                        if(data ==10) return "助理";
                        if(data ==20) return "销售";
                        if(data ==0) return "已禁用";
                    }else{
                        return "";
                    }
                }
            },
            {
                "aTargets": [4],
                "data": "status",
                "render": function (data, type, full) {

                    if(data != undefined){

                        if(data ==1) return "可登陆";
                        if(data ==0) return "已禁用";
                    }else{
                        return "";
                    }
                }
            },
            {
                "aTargets": [7],
                "data": "id",
                "render": function (data, type, full) {

                    var st = '<a href="/backend/admin/view?id=' + data + '" class="btn btn-info btn-xs">编辑</a>';
                    return st;
                }
            }
        ],
        searchParams : function(ao){
            ao.push(
                    { "name": "entity.roleId","value": $("#roleId").val() },
                    { "name": "entity.realName","value": $("#realName").val() },
                    { "name": "entity.mobile","value": $("#mobile").val() },
                    { "name": "entity.username","value": $("#username").val() }
            )
        }
    }
    var dataTable = ajaxDataTable($("#data-list"),option);

    $("#search").click(function () {
        dataTable.ajax.reload();
    });

    $('#startDate').datepicker({
        format: 'yyyy-mm-dd'
    });

    $('#endDate').datepicker({
        format: 'yyyy-mm-dd'
    });

</script>
</html>

