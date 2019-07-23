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
                <li><a href="#"><i class="fa fa-dashboard"></i> 付款方式</a></li>
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
                        <form id="customer" class="form-horizontal" role="form" method="post" action="/backend/payment/save">
                            <input type="hidden" name="entity.id" value="${(entity.id)!}">
                            <div class="box-body">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">收款姓名</label>
                                    <div class="col-sm-2">
                                        <input    name="entity.name" class="form-control" id="name" placeholder="请输入名称" value="${(entity.name)!}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">银行名称</label>
                                    <div class="col-sm-2">
                                        <input   name="entity.bankName" class="form-control" id="bankName" placeholder="请输入名称" value="${(entity.bankName)!}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">支行名称</label>
                                    <div class="col-sm-2">
                                        <input name="entity.openBank" class="form-control" id="openBank" placeholder="请输入名称" value="${(entity.openBank)!}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">账号</label>
                                    <div class="col-sm-2">
                                        <input type="text"  name="entity.bankNo" class="form-control" id="bankNo" placeholder="请输入账号" value="${(entity.bankNo)!}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">是否启用</label>
                                    <div class="col-sm-2">
                                        <select name="entity.isUse" class="form-control">
                                            <option value="">----请选择----</option>
                                            <option value="1" <#if (((entity.isUse)!0) == 1)>selected</#if>>是</option>
                                            <option value="0" <#if (((entity.isUse)!0) == 0)>selected</#if>>否</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">备注</label>
                                    <div class="col-sm-2">
                                        <textarea  name="entity.remark" class="form-control" id="entity.remark" placeholder="请输入备注">${(entity.remark)!}</textarea>
                                    </div>
                                </div>
                            </div><!-- /.box-body -->

                            <div class="box-footer">
                                <div class="form-group p-t-15" style="border-top:1px solid #ccc">
                                    <div class="col-sm-2 text-right">
                                        <a href="/backend/payment/list" class="btn btn-danger">取消</a>
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
</html>
