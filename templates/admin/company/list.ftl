<html>
<head>
    <title>企业管理</title>
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
                <i class="fa  fa-search"></i>企业管理
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 公司管理</a></li>
                <li class="active">公司列表</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-info">
                        <div class="box-header with-border form-horizontal">

                            <!-- <label for="name" class="col-sm-2 control-label">名称:</label>
                            <div class="form-group col-sm-3">
                                <input type="text" id="name" class="form-control" placeholder="名称" >
                            </div>

                            <div class="form-group col-sm-2">
                                <button id="search" class="btn pull-right btn-primary "><i class="fa fa-search "></i>查询</button>
                            </div> -->
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <a href="/backend/company/view">
                                <button class="btn pull-left btn-primary " style="margin:10px;"><i class="fa"></i>添加企业</button>
                            </a>
                            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                <table id="data-list" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                                    <thead>
                                    <tr role="row">
	                                    <th> 公司名称</th>
                                        <!--<th> 联系人</th>
                                        <th> 联系电话</th>-->
                                        <th> 备注</th>
                                        <th> 创建时间</th>
                                        <th> 最后修改时间</th>
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
        url : "/backend/company/list/ajax",
        columns : [
            {"data": "name"},
            /*{"data": "contactName"},
            {"data": "contactMobile"},*/
            {"data": "remark"},
            {"data": "createTime"},
            {"data": "lastUpdateTime"},
            {"data": "id"}
        ],
        columnDefs : [
            {
                "aTargets": [4],
                "data": "id",
                "render": function (data, type, full) {

                    var st = '<a href="/backend/company/view?id='+data+'" class="btn btn-info btn-xs">编辑</a>' +
                            '<a onclick="del('+data+')" href="javascript:void(0)" class="btn btn-danger btn-xs m-l-10">删除</a>'
                    return st;
                }
            },
        ],
        searchParams : function(ao){
            ao.push(
                    { "name": "entity.name","value": $("#name").val() }
            )
        }
    }
    var dataTable = ajaxDataTable($("#data-list"),option);

    $("#search").click(function () {
        dataTable.ajax.reload();
    });
    function del(id){
        if(confirm('确认删除？')){
            $.get("/backend/company/delete/"+id,
            function(result){
               window.location.pathname = '/backend/company/list'
            },function(e){
                console.log(e)
            },"json");
        }

    }
</script>
</html>

