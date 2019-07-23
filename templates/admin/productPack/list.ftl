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
                <i class="fa  fa-search"></i>产品包装规格
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 基础数据管理</a></li>
                <li class="active">产品包装规格</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-info">
                        <div class="box-header with-border form-horizontal">

                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <a href="/backend/dictionary/productPack/view">
                                <button type="button" class="btn pull-left btn-primary ">添加包装规格</button>
                            </a>
                            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                <table id="data-list" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                                    <thead>
                                    <tr role="row">
                                        <th> 包装规格</th>
                                        <th> 备注</th>
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
        url : "/backend/dictionary/productPack/list/ajax",
        columns : [
            {"data": "name"},
            {"data": "remark"},
            {"data": "id"}
        ],
        columnDefs : [
            {
                "aTargets":[2],
                "data": "id",
                "render":function(data,type,full){
                    var st = '<a href="/backend/dictionary/productPack/view?id='+data+'" class="btn btn-info btn-xs">编辑</a>&nbsp;&nbsp;';
                    st += '<a onclick="del('+data+')" href="javascript:void(0)" class="btn btn-danger btn-xs">删除</a>';
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

    function del(id){
        if(confirm('确认删除？')){
            $.sale.productPackDel(id,function(){
                window.location.pathname = '/backend/dictionary/productPack/list'
            })
        }

    }

</script>
</html>

