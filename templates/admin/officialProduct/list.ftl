<html>
<head>
    <title>官网产品维护</title>
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
                <i class="fa  fa-search"></i>官网产品维护
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 基础数据管理</a></li>
                <li class="active">官网产品维护</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-info">
                        <div class="box-header with-border form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">产品名称:</label>
                                <div class="form-group col-sm-3">
                                    <input type="tel" name="entity.name" id="name" class="form-control" placeholder="产品名称" >
                                </div>

                                <label class="col-sm-2 control-label">产品分类:</label>
                                <div class="form-group col-sm-3">
                                    <select name="entity.type" id="metalTypeId" class="form-control">
                                        <option value="">----请选择----</option>
                                        <option value="1">铂系</option>
                                        <option value="2">钯系</option>
                                        <option value="3">金</option>
                                        <option value="4">铑系</option>
                                        <option value="5">钌系</option>
                                        <option value="6">铱系</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">所属行业:</label>
                                <div class="form-group col-sm-3">
                                    <select name="entity.industryType" id="industryType" class="form-control">
                                        <option value="">----请选择----</option>
                                        <option value="1">电镀</option>
                                        <option value="2">线路板</option>
                                        <option value="3">尾气净化</option>
                                        <option value="4">医药催化</option>
                                        <option value="5">陶瓷颜料</option>
                                        <option value="6">金属阳极</option>
                                        <option value="7">石油石化</option>
                                        <option value="8">其他</option>
                                    </select>
                                </div>

                                <div class="col-sm-2">
                                    <button id="search" class="btn pull-right btn-primary "><i class="fa fa-search "></i>查询</button>
                                </div>
                            </div>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <a href="/backend/officialProduct/view">
                                <button class="btn btn-primary" style="margin:10px;">添加产品</button>
                            </a>
                            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                <table id="data-list" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                                    <thead>
                                    <tr role="row">
	                                    <th> 产品名称</th>
                                        <th> 产品分类</th>
                                        <th> 所属行业</th>
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
        url : "/backend/officialProduct/list/ajax",
        columns : [
            {"data": "name"},
            {"data": "typeText"},
            {"data": "industryTypeText"},
            {"data": "id"}
        ],
        columnDefs : [
            {
                "aTargets": [3],
                "data": "id",
                "render": function (data, type, full) {

                    var st = '<a href="/backend/officialProduct/view?id=' + data + '" class="btn btn-info btn-xs">编辑</a>'
                            st += '<a onclick="del('+data+')" href="javascript:void(0)" class="btn btn-danger btn-xs m-l-10">删除</a>'
                    return st;
                }
            }
        ],
        searchParams : function(ao){
            ao.push(
                    { "name": "entity.type","value": $("#metalTypeId").val() },
                    { "name": "entity.name","value": $("#name").val() },
                    { "name": "entity.industryType","value": $("#industryType").val() }
            )
        }
    }
    var dataTable = ajaxDataTable($("#data-list"),option);

    $("#search").click(function () {
        dataTable.ajax.reload();
    });

    function del(id){
        if(confirm('确认删除？')){
            $.get("/backend/officialProduct/delete/"+id,
            function(result){
                window.location.pathname = '/backend/officialProduct/list'
            },function(e){
                console.log(e)
            },"json");
        }

    }
</script>
</html>

