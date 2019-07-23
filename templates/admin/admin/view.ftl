<html>
<head>
    <title>添加/编辑账号</title>
    <link href="${request.contextPath}/static/common.css" rel="stylesheet" type="text/css"/>
    <#include "../common/resource.ftl">
</head>
<body class="sidebar-mini wysihtml5-supported skin-blue">
<div class="wrapper">
    <#include "../common/top.ftl">
    <#include "../common/left.ftl">
    <@leftMenu pageName="account"/>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                添加/编辑账号
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 基础数据管理</a></li>
                <li class="active">添加/编辑账号</li>
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
                        <form id="customer" class="form-horizontal" role="form" method="post" action="/backend/admin/save">
                            <input type="hidden" name="entity.id" value="${(entity.id)!}">
                            <div class="box-body">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">账号</label>
                                    <div class="col-sm-2">
                                        <input type="text" class="form-control" name="entity.username" placeholder="账号" value="${(entity.username)!}" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">密码</label>
                                    <div class="col-sm-2">
                                        <input type="password" class="form-control" name="entity.password" placeholder="密码" value="${(entity.password)!}" required>
                                        <input type="password" name="entity.password" style="display:none">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">联系人</label>
                                    <div class="col-sm-2">
                                        <input type="text" class="form-control" name="entity.realName" placeholder="联系人" value="${(entity.realName)!}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">联系电话</label>
                                    <div class="col-sm-2">
                                        <input type="text" class="form-control" name="entity.mobile" placeholder="联系电话" value="${(entity.mobile)!}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">是否启用</label>
                                    <div class="col-sm-2">
                                        <select name="entity.status" class="form-control" required>
                                            <option value="">----请选择----</option>
                                            <option value="1" <#if (((entity.status)!0) == 1)>selected</#if>>是</option>
                                            <option value="0" <#if (((entity.status)!0) == 0)>selected</#if>>否</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">角色</label>
                                    <div class="col-sm-2">
                                        <select name="entity.roleId" class="form-control" required>
                                            <option value="">----请选择----</option>
                                            <option value="1" <#if (((entity.roleId)!0) == 1)>selected</#if>>超级管理员</option>
                                            <option value="10" <#if (((entity.roleId)!0) == 10)>selected</#if>>助理</option>
                                            <option value="20" <#if (((entity.roleId)!0) == 20)>selected</#if>>销售</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label"></label>
                                    <div class="col-sm-2" style="color: red">
                                        ${error!''}
                                    </div>
                                </div>
                            </div><!-- /.box-body -->

                            <div class="box-footer">
                                <div class="form-group p-t-15" style="border-top:1px solid #ccc">
                                    <div class="col-sm-2 text-right">
                                        <a href="/backend/admin/list" class="btn btn-danger">取消</a>
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
