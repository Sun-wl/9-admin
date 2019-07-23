<html>
<head>
    <title>客户信息审核</title>
    <link href="${request.contextPath}/static/common.css" rel="stylesheet" type="text/css"/>
    <#include "../common/resource.ftl">
</head>
<body class="sidebar-mini wysihtml5-supported skin-blue">
<div class="wrapper">
    <#include "../common/top.ftl">
    <#include "../common/left.ftl">
    <@leftMenu pageName="sales"/>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                客户信息审核
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 客户审核</a></li>
                <li class="active">客户信息审核</li>
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
                        <form class="form-horizontal">
                            <input type="hidden" id="entityId">
                            <div class="box-body">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">企业名称</label>
                                    <div class="col-sm-8">
                                        <label class="control-label" id="companyName"></label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">联系人</label>
                                    <div class="col-sm-8">
                                        <label class="control-label" id="realName"></label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">注册手机</label>
                                    <div class="col-sm-8">
                                        <label class="control-label" id="mobile"></label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">所属企业</label>
                                    <div class="col-sm-3">
                                         <select id="companyId" class="form-control">
                                             <option value="">----请选择----</option>
                                         </select>
                                    </div>
                                    <div class="col-sm-2">
                                        <img src="${request.contextPath}/static/img/add.png" style="width:20px; margin-top:8px;" data-toggle="modal" data-target="#myModal" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">客户权限</label>
                                    <div class="col-sm-10">
                                        <label class="control-label m-r-20">
                                            <input type="checkbox" name="role" value="1"> 查看产品报价
                                        </label>
                                        <label class="control-label m-r-20">
                                            <input type="checkbox" name="role" value="10"> 下订单
                                        </label>
                                        <label class="control-label m-r-20">
                                            <input type="checkbox" name="role" value="100"> 查看订单进度
                                        </label>
                                     </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">采购紧密度</label>
                                    <div class="col-sm-4">
                                        <label class="control-label">
                                            <input type="radio" name="readPriceTime" value="9:40"> 90%以上采购在我司（9：40看到报价）
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label"></label>
                                    <div class="col-sm-4">
                                        <label class="control-label">
                                            <input type="radio" name="readPriceTime" value="10:00"> 50%以上采购在我司（10：00看到报价）
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label"></label>
                                    <div class="col-sm-4">
                                        <label class="control-label">
                                            <input type="radio" name="readPriceTime" value="10:01"> 50%以下采购在我司（10：00看到报价）
                                        </label>
                                    </div>
                                </div>

                            </div><!-- /.box-body -->

                            <div class="box-footer">
                                <div class="form-group p-t-15" style="border-top:1px solid #ccc">
                                    <div class="col-sm-2 text-right">
                                        <a href="/backend/customer/audit/list" class="btn btn-danger">取消</a>
                                    </div>
                                    <div class="col-sm-3 text-center">
                                        <a href="javascript:void(0)" class="btn btn-success" onclick="customerSave('/backend/customer/audit/list')">确认</a>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <!-- Modal -->
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                          <div class="modal-dialog" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">添加企业信息</h4>
                              </div>
                              <div class="modal-body">
                                <form class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">企业名称</label>
                                        <div class="col-sm-6">
                                             <input type="text" class="form-control" id="name" value="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">备注</label>
                                        <div class="col-sm-6">
                                             <textarea class="form-control" id="remark"></textarea>
                                        </div>
                                    </div>
                                </form>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                <button type="button" class="btn btn-primary" onclick="saveCompany()">确定</button>
                              </div>
                            </div>
                          </div>
                        </div>

                    </div>

                </div><!-- /.col -->
            </div><!-- /.row -->

        </section><!-- /.content -->
    </div><!-- /.content-wrapper -->
<#include "../common/footer.ftl">
</div>
</body>
<script>
var params = urlParam();
getCompanys().then(function(){
    return getCustomerDetails(params);
})

</script>
</html>
