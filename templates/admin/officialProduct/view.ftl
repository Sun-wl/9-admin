<html>
<head>
    <title>添加产品</title>
    <link href="${request.contextPath}/static/common.css" rel="stylesheet" type="text/css"/>
    <#include "../common/resource.ftl">
    <style>
        .bootstrap-select>.dropdown-toggle,
        .open>.dropdown-toggle.btn-default,
        .open>.dropdown-toggle.btn-default:focus
        {
            background: #fff;
        }

    </style>
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
                添加产品
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 官网产品维护</a></li>
                <li class="active">添加产品</li>
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
                                    <label class="col-sm-2 control-label">产品名称</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="productName" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">产品分子式</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="molecule" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">产品分类</label>
                                    <div class="col-sm-3">
                                        <select id="type" class="form-control" required>
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
                                    <label class="col-sm-2 control-label">所属行业</label>
                                    <div class="col-sm-3">
                                         <select id="industryType" name="industryType" class="selectpicker show-tick form-control" multiple data-live-search="false">
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
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">是否首页展示</label>
                                    <div class="col-sm-3">
                                         <select id="isUse" class="form-control" required>
                                             <option value="">----请选择----</option>
                                             <option value="1">是</option>
                                             <option value="0">否</option>
                                         </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">产品排序</label>
                                    <div class="col-sm-3">
                                        <input class="form-control" id="rank" placeholder="产品排序" onkeyup="fix0(this)">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">添加图片</label>
                                    <div class="col-sm-3">
                                        <input type="file" id="uploaderInput" onchange="changeImg()" class="control-label" required>
                                        <div></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">产品描述</label>
                                    <div class="col-sm-4">
                                        <textarea class="form-control" id="remark" style="height:300px;" required></textarea>
                                    </div>
                                </div>

                            </div><!-- /.box-body -->

                            <div class="box-footer">
                                <div class="form-group p-t-15" style="border-top:1px solid #ccc">
                                    <div class="col-sm-2 text-right">
                                        <a href="/backend/officialProduct/list" class="btn btn-danger">取消</a>
                                    </div>
                                    <div class="col-sm-3 text-center">
                                        <a href="javascript:void(0)" class="btn btn-success" onclick="productSave()">确认</a>
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
var id = getUrlParam().id;
//获取产品详情
function getProductDetaild(id){
    $.sale.officialProduct(id,function(res){
        if(res.code == 200){
            $("#entityId").val(res.data.id);
            $("#productName").val(res.data.name);
            $("#molecule").val(res.data.molecule);
            $("#type").val(res.data.type);
            $("#rank").val(res.data.rank);
            $('#industryType').selectpicker('val', res.data.industryTypeList);
            $("#isUse").val(res.data.isUse);
            $("#remark").val(res.data.remark);
            $('#uploaderInput').siblings().css({'margin':'10px 0','width':'300px','height':'150px','background':'url('+location.origin+res.data.imgSrc+') no-repeat','background-size': 'contain'});
        }

    })
}
//保存产品
function productSave(){
    if(!$("#industryType").val() || !$("#industryType").val().length){
        alert('请选择所属行业')
    }
    var industryType = $("#industryType").val().map(function(item){
        return +item
    })
    var data = {
        'entity.id':+$("#entityId").val() || undefined,
        'entity.type':$("#type").val(),
        'entity.molecule':$("#molecule").val(),
        'entity.name':$("#productName").val(),
        'entity.rank':$("#rank").val(),
        'entity.industryType':JSON.stringify(industryType),
        'entity.isUse':$("#isUse").val(),
        'entity.remark':$("#remark").val(),
        'image':$('#uploaderInput')[0].files[0] || undefined
    }
    if(!data['entity.name']){ alert('请输入产品名称'); return }
    if(!data['entity.molecule']){ alert('请输入产品分子式'); return }
    if(!data['entity.type']){ alert('请选择产品分类'); return }
    if(!data['entity.industryType']){ alert('请选择所属行业'); return }
    if(!data['entity.isUse']){ alert('请选择是否首页展示'); return }
    if(!data['entity.remark']){ alert('请输入产品描述'); return }
    if(!data['entity.id'] && !data['image']){ alert('请选择图片'); return }

    //如果有图片，使用FileReader提交图片，没有直接提交其他数据
    if(data.image){
        var reader = new FileReader();
        reader.readAsDataURL(data.image);
        reader.onload = function(e){ // reader onload start
            // ajax 上传图片
            data.image = e.target.result;
            $.sale.officialProductSave(data,function(){
                window.location.pathname = '/backend/officialProduct/list';
            })
        }
    }else{
        $.sale.officialProductSave(data,function(){
            window.location.pathname = '/backend/officialProduct/list';
        })
    }


}


$(function(){
    if(id){
        getProductDetaild(id)
    }
    $('#industryType').selectpicker({
        'selectedText': 'cat'
    });
})
</script>
</html>
