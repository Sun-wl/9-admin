<html>
<head>
    <title>订单列表</title>
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
                <i class="fa  fa-search"></i>订单列表
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 销售管理</a></li>
                <li class="active">订单列表</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-info">
                        <div class="box-header with-border form-horizontal">

                            <label for="orderNo" class="col-sm-2 control-label">订单号:</label>
                            <div class="form-group col-sm-2">
                                <input type="text" id="orderNo" class="form-control" placeholder="订单号" >
                            </div>

                            <label for="contactName" class="col-sm-2 control-label">联系人:</label>
                            <div class="form-group col-sm-2">
                                <input type="text" id="contactName" class="form-control" placeholder="联系人" >
                            </div>

                            <label for="companyName" class="col-sm-2 control-label">所属企业：</label>
                            <div class="form-group col-sm-2">
                                <select id="companyId" class="form-control">
                                    <option value="">----全部----</option>
                                </select>
                            </div>

                            <label for="status" class="col-sm-2 control-label">状态：</label>
                            <div class="form-group col-sm-2">
                                <select id="status" class="form-control">
                                    <option value="">----全部----</option>
                                    <option value="1">订单初审中</option>
                                    <option value="2">客户确认中</option>
                                    <option value="3">待付首付款</option>
                                    <option value="4">待支付尾款</option>
                                    <option value="5">已支付代发货</option>
                                    <option value="6">已发货</option>
                                    <option value="7">完成</option>
                                    <option value="8">取消</option>
                                </select>
                            </div>

                            <label for="contactMobile" class="col-sm-2 control-label">联系电话：</label>
                            <div class="form-group col-sm-2 ">
                                <input type="tel" id="contactMobile" class="form-control" placeholder="联系电话">
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
                                        <th>订单号</th>
                                        <th>状态</th>
                                        <th>所属企业</th>
                                        <th>联系人</th>
                                        <th>联系电话</th>
                                        <th>总金额</th>
                                        <th>下单时间</th>
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
    getCompanys();
    var option = {
        url : "/backend/order/list/ajax",
        columns : [
            {"data": "orderNo"},
            {"data": "statusText"},
            {"data": "companyName"},
            {"data": "contactName"},
            {"data": "contactMobile"},
            {"data": "amount"},
            {"data": "createTime"},
            {"data": "orderNo"}
        ],
        columnDefs : [
            {
                "aTargets":[7],
                "data": "id",
                "render":function(data,type,full){
                    var st = '<a href="/backend/order/view/page?orderNo='+data+'" class="btn btn-info btn-xs">查看详情</a>';
                    return st;
                }
            }
        ],
         searchParams : function(ao){
             ao.push(
                     { "name": "entity.orderNo","value": $("#orderNo").val() },
                     { "name": "entity.contactName","value": $("#contactName").val() },
                     { "name": "entity.companyId","value": $("#companyId").val() },
                     { "name": "entity.status","value": $("#status").val() },
                     { "name": "entity.contactMobile","value": $("#contactMobile").val() }
             )
         }
    }

    var dataTable = ajaxDataTable($("#data-list"),option);

    $("#search").click(function () {
        dataTable.ajax.reload();
    });
</script>
</html>

