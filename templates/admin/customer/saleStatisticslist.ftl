<html>
<head>
    <title>客户销售统计</title>
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
                <i class="fa  fa-search"></i>客户销售统计
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 销售管理</a></li>
                <li class="active">客户销售统计</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-info">
                        <div class="box-header with-border form-horizontal">

                            <label for="metalTypeId" class="col-sm-2 control-label">客户姓名:</label>
                            <div class="form-group col-sm-2">
                                <select id="metalTypeId" class="form-control">
                                    <option value="">----全部----</option>
                                    <#list metalTypeList as item>
                                        <option value="${item.id?c}">${item.name}</option>
                                    </#list>
                                </select>
                            </div>

                            <label for="name" class="col-sm-1 control-label">企业名称:</label>
                            <div class="form-group col-sm-2">
                                <input type="text" id="name" class="form-control" placeholder="名称">
                            </div>
                            <label for="name" class="col-sm-1 control-label">时间:</label>
                            <div class="form-group col-sm-2">
                                <input type="text" name="daterange" id="" class="form-control">
                            </div>

                            <div class="col-sm-2">
                                <button id="search" class="btn pull-right btn-primary "><i class="fa fa-search "></i>查询
                                </button>
                            </div>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                <table id="data-list" class="table table-bordered table-hover dataTable" role="grid"
                                       aria-describedby="example2_info">
                                    <thead>
                                    <tr role="row">
                                        <th>企业名称</th>
                                        <th>客户姓名</th>
                                        <th>产品名称</th>
                                        <th>1-3月份采购量</th>
                                        <th>4-9月份采购量</th>
                                        <th>10-12月份采购量</th>
                                        <th>其他时间采购量</th>
                                        <th>计量</th>
                                        <th>总采购量</th>
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
    $('input[name="daterange"]').daterangepicker({//时间控件选择
        calender_style: "picker_4",
        locale: {
            format: 'YYYY-MM-DD'
        },
    }, function (start, end, label) {
        // console.log(start.format('YYYY-MM-DD'));
    });
    var date = new Date();
    var year = date.getFullYear();
    var month = (date.getMonth() + 1) < 10 ? '0'+ (date.getMonth() + 1) : date.getMonth() + 1;
    var day = (date.getDate()) < 10 ? '0'+ (date.getDate()) : date.getDate();
    $('input[name="daterange"]').val(year + '-' + month + '-' + '01 - ' + year + '-' + month + '-' + day)
    var option = {
        url: "/backend/product/saleStatisticsList/ajax",
        columns: [
            {"data": "name"},
            {"data": "code"},
            {"data": "metalTypeName"},
            {"data": "saleCount"},
            {"data": "saleCount"}
        ],
        columnDefs: [

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

