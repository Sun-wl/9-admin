<html>
<head>
    <title></title>
    <link href="${request.contextPath}/static/common.css" rel="stylesheet" type="text/css"/>
	<#include "../common/resource.ftl">
</head>
<body class="sidebar-mini wysihtml5-supported skin-blue">
<div class="wrapper">
	<#include "../common/top.ftl">
	<#include "../common/left.ftl">
    <@leftMenu pageName="baseData"/>
    <div class="content-wrapper" style="min-height: 916px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <i class="fa  fa-search"></i>付款方式
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 基础数据管理</a></li>
                <li class="active">付款方式</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-info">
                        <div class="box-header with-border form-horizontal">

                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <a href="/backend/payment/view">
                                <button type="button" class="btn pull-left btn-primary ">添加付款方式</button>
                            </a>
                            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                <table id="data-list" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                                    <thead>
                                    <tr role="row">
	                                    <th> 收款姓名</th>
                                        <th> 银行名称</th>
                                        <th> 支行名称</th>
                                        <th> 账号</th>
                                        <th> 是否启用</th>
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
        url : "/backend/payment/list/ajax",
        columns : [
            {"data": "name"},
            {"data": "bankName"},
            {"data": "openBank"},
            {"data": "bankNo"},
            {"data": "isUse"},
            {"data": "id"}
        ],
        columnDefs : [
            {
                "aTargets":[4],
                "data": "id",
                "render":function(data,type,full){
                    if(data){
                        return '是';
                    }else{
                        return '否';
                    }

                }
            },
            {
                "aTargets":[5],
                "data": "id",
                "render":function(data,type,full){
                    var st = '<a href="/backend/payment/view?id='+data+'" class="btn btn-info btn-xs">编辑</a>';
                    return st;
                }
            }
        ],
        searchParams : function(ao){
            ao.push(
            )
        }
    }
    var dataTable = ajaxDataTable($("#data-list"),option);


</script>
</html>

