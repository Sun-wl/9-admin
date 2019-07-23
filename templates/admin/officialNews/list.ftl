<html>
<head>
    <title>官网新闻维护</title>
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
                <i class="fa  fa-search"></i>官网新闻维护
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 基础数据管理</a></li>
                <li class="active">官网新闻维护</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-info">
                        <div class="box-header with-border form-horizontal">

                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <a href="/backend/officialNews/view">
                                <button class="btn btn-primary" style="margin:10px;">添加新闻</button>
                            </a>
                            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                <table id="data-list" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                                    <thead>
                                    <tr role="row">
	                                    <th> 新闻名称</th>
                                        <th> 新闻分类</th>
                                        <th> 新闻时间</th>
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
        url : "/backend/officialNews/list/ajax",
        columns : [
            {"data": "title"},
            {"data": "newsTypeText"},
            {"data": "time"},
            {"data": "id"}
        ],
        columnDefs : [
            {
                "aTargets": [3],
                "data": "id",
                "render": function (data, type, full) {

                    var st = '<a href="/backend/officialNews/view?id=' + data + '" class="btn btn-info btn-xs">编辑</a>';
                    return st;
                }
            }
        ]
    }
    var dataTable = ajaxDataTable($("#data-list"),option);

    $("#search").click(function () {
        dataTable.ajax.reload();
    });


</script>
</html>

