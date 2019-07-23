<html>
<head>
    <title>客户审核列表</title>
    <link href="${request.contextPath}/static/common.css" rel="stylesheet" type="text/css"/>
	<#include "../common/resource.ftl">
</head>
<body class="sidebar-mini wysihtml5-supported skin-blue">
<div class="wrapper">
	<#include "../common/top.ftl">
	<#include "../common/left.ftl">
    <@leftMenu pageName="sales"/>
    <div class="content-wrapper" style="min-height: 916px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <i class="fa  fa-search"></i>客户审核列表
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 销售管理</a></li>
                <li class="active">客户审核列表</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-info">
                        <div class="box-header with-border form-horizontal">

                            <label for="custName" class="col-sm-2 control-label">企业名称:</label>
                            <div class="form-group col-sm-2">
                                <input type="text" id="companyName" class="form-control" placeholder="企业名称" >
                            </div>

                            <label for="name" class="col-sm-1 control-label">联系人：</label>
                            <div class="form-group col-sm-2 ">
                                <input type="text" id="custName" class="form-control" placeholder="联系人">
                            </div>

                            <label for="custPhone" class="col-sm-1 control-label">注册手机:</label>
                            <div class="form-group col-sm-2">
                                <input type="tel" id="mobile" class="form-control" placeholder="注册手机" >
                            </div>

                            <div class="form-group col-sm-2">
                                <button id="search" class="btn pull-right btn-primary "><i class="fa fa-search "></i>查询</button>
                            </div>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                <table id="data-list" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                                    <thead>
                                    <tr role="row">
	                                    <th> 企业名称</th>
	                                    <th> 联系人</th>
                                        <th> 注册手机</th>
                                        <th> 申请时间</th>
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
        url : "/backend/customer/list/ajax",
        columns : [
            {"data": "companyName"},
            {"data": "realName"},
            {"data": "mobile"},
            {"data": "createTime"},
            {"data": "id"}
        ],
        columnDefs : [
            {
                "aTargets": [4],
                "data": "id",
                "render": function (data, type, full) {

                    var st = '<a href="/backend/customer/audit/'+data+'" class="btn btn-info btn-xs">审核</a>';
                    return st;
                }
            },
        ],
        searchParams : function(ao){
            ao.push(
                    { "name": "entity.status","value": 0 },
                    { "name": "entity.realName","value": $("#custName").val() },
                    { "name": "entity.mobile","value": $("#mobile").val() },
                    { "name": "entity.companyName","value": $("#companyName").val() },
                    { "name": "entity.startDate","value": $("#startDate").val() },
                    { "name": "entity.endDate","value": $("#endDate").val() }

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

