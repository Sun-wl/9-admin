<html>
<head>
    <title>产品维护</title>
    <link href="${request.contextPath}/static/common.css" rel="stylesheet" type="text/css"/>
<#include "../common/resource.ftl">
</head>
<body class="sidebar-mini wysihtml5-supported skin-blue">
<div class="wrapper">
<#include "../common/top.ftl">
<#include "../common/left.ftl">
<@leftMenu pageName="product"/>
    <div class="content-wrapper" style="min-height: 916px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <i class="fa  fa-search"></i>产品维护
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 产品管理</a></li>
                <li class="active">产品维护</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-info">
                        <div class="box-header with-border form-horizontal">

                            <label for="name" class="col-sm-2 control-label">产品名称:</label>
                            <div class="form-group col-sm-3">
                                <input type="text" id="name" class="form-control" placeholder="名称">
                            </div>

                            <label for="metalTypeId" class="col-sm-2 control-label">产品分类:</label>
                            <div class="form-group col-sm-3">
                                <select id="metalTypeId" class="form-control">
                                    <option value="">----全部----</option>
                                    <#list metalTypeList as item>
                                        <option value="${item.id?c}">${item.name}</option>
                                    </#list>
                                </select>
                            </div>

                            <div class="form-group col-sm-2">
                                <button id="search" class="btn pull-right btn-primary "><i class="fa fa-search "></i>查询
                                </button>
                            </div>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <a href="/backend/product/view">
                                <button class="btn btn-primary" style="margin:10px;">添加产品</button>
                            </a>
                            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                <table id="data-list" class="table table-bordered table-hover dataTable" role="grid"
                                       aria-describedby="example2_info">
                                    <thead>
                                    <tr role="row">
                                        <th>产品排序</th>
                                        <th>产品名称</th>
                                        <th>产品代码</th>
                                        <th>产品分类</th>
                                        <th>基础价格</th>
                                        <th>订货批量(千克)</th>
                                        <th>是否启用</th>
                                        <!--<th>销量(kg)</th>
                                        <th>库存</th>-->
                                        <th>创建时间</th>
                                        <th>最后修改时间</th>
                                        <th>操作</th>
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
        url: "/backend/product/list/ajax",
        columns: [
            {"data": "rank"},
            {"data": "name"},
            {"data": "code"},
            {"data": "metalTypeName"},
//            {"data": "库存"},
            {"data": "basePrice"},
            {"data": "minimumQuantity"},
            {"data": "use"},
            {"data": "createTime"},
            {"data": "lastUpdateTime"},
            {"data": "id"}
        ],
        columnDefs: [
            {
                "aTargets": [6],
                "data": "use",
                "render": function (data, type, full) {

                    if(data == true) return "是";
                    else return "否";
                }
            },
            {
                "aTargets": [9],
                "data": "id",
                "render": function (data, type, full) {
                    var st = '<a href="/backend/product/view?id=' + data + '" class="btn btn-info btn-xs">编辑</a>';
                    return st;
                }
            }
        ],
        searchParams: function (ao) {
            ao.push(
                    {"name": "entity.metalTypeId", "value": $("#metalTypeId").val()},
                    {"name": "entity.name", "value": $("#name").val()}
            )
        }
    }

    var dataTable = ajaxDataTable($("#data-list"), option);

    $("#search").click(function () {
        dataTable.ajax.reload();
    });
</script>
</html>

