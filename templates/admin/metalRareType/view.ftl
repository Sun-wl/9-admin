<html>
<head>
    <title>详细信息</title>
    <link href="${request.contextPath}/static/common.css" rel="stylesheet" type="text/css"/>
    <#include "../common/resource.ftl">
</head>
<body class="sidebar-mini wysihtml5-supported skin-blue">
<div class="wrapper">
    <#include "../common/top.ftl">
    <#include "../common/left.ftl">
    <@leftMenu pageName="baseData"/>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                详细信息
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 产品类型管理</a></li>
                <li class="active">详细信息</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-xs-12">

                    <div class="box box-info">
                        <div class="box-header with-border">
                        </div><!-- /.box-header -->
                        <!-- form start -->
                        <form id="customer" class="form-horizontal" role="form" method="post" action="/backend/dictionary/metalRareType/save">
                            <input type="hidden" name="entity.id" value="${(entity.id)!}">
                            <div class="box-body">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">产品分类名称</label>
                                    <div class="col-sm-2">
                                        <input type="text"  name="entity.name" class="form-control" id="entity.name" value="${(entity.name)!}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">采购总量</label>
                                    <div class="col-sm-2">
                                        <input type="text"  name="entity.value" onkeyup="fix2(this)" class="form-control" id="entity.value" value="${(entity.value)!}" required>
                                    </div>
                                    <div class="col-sm-1">
                                        kg
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">总量均价</label>
                                    <div class="col-sm-2">
                                        <input type="text"  name="entity.description" onkeyup="fix2(this)" class="form-control" id="entity.description" value="${(entity.description)!}" required>
                                    </div>
                                    <div class="col-sm-1">
                                        元
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">备注</label>
                                    <div class="col-sm-2">
                                        <textarea  name="entity.remark" class="form-control" id="entity.remark">${(entity.remark)!}</textarea>
                                    </div>
                                </div>
                            </div><!-- /.box-body -->

                            <div class="box-footer">
                                <div class="form-group p-t-15" style="border-top:1px solid #ccc">
                                    <div class="col-sm-2 text-right">
                                        <a href="/backend/dictionary/metalRareType/list" class="btn btn-danger">取消</a>
                                    </div>
                                    <div class="col-sm-3 text-center">
                                        <button type="submit" class="btn btn-success">确认</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                </div><!-- /.col -->
            </div><!-- /.row -->

        </section><!-- /.content -->
    </div><!-- /.content-wrapper -->
<#include "../common/footer.ftl">
</div>
</body>
<script>
/*function replaceSeperator(a) {
  var i;
  var result = "";
  var c;
  for (i = 0; i < a.length; i++) {
    c = a.substr(i, 1);
    if (c == "\n")
      result = result + "<br/>";
    else if (c != "\r")
      result = result + c;
  }
  return result;
}
$('#remark').html(replaceSeperator($('#remark').html()))*/
</script>
</html>
