<html>
<head>
    <title>添加新闻</title>
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
                添加新闻
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 官网新闻维护</a></li>
                <li class="active">添加新闻</li>
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
                                    <label class="col-sm-2 control-label">新闻名称</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="newsName" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">新闻时间</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="time" name="daterange" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">新闻分类</label>
                                    <div class="col-sm-3">
                                        <select id="newsType" class="form-control" required>
                                            <option value="">----请选择----</option>
                                            <option value="1">金属新闻</option>
                                            <option value="2">行业新闻</option>
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
                                    <label class="col-sm-2 control-label">添加图片</label>
                                    <div class="col-sm-3">
                                        <input type="file" id="uploaderInput" onchange="changeImg()" class="control-label" required>
                                        <div></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">新闻内容</label>
                                    <div class="col-sm-4">
                                        <textarea class="form-control" id="remark" style="height:300px;" required></textarea>
                                    </div>
                                </div>

                            </div><!-- /.box-body -->

                            <div class="box-footer">
                                <div class="form-group p-t-15" style="border-top:1px solid #ccc">
                                    <div class="col-sm-2 text-right">
                                        <a href="/backend/officialNews/list" class="btn btn-danger">取消</a>
                                    </div>
                                    <div class="col-sm-3 text-center">
                                        <a href="javascript:void(0)" class="btn btn-success" onclick="newsSave()">确认</a>
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
/*获取新闻详情*/
function getNewsDetails(id){
    $.sale.officialNews(id,function(res){
        if(res.code == 200){
            $("#entityId").val(res.data.id)
            $("#newsName").val(res.data.title)
            $("#time").val(res.data.time)
            $("#newsType").val(res.data.newsType)
            $("#isUse").val(res.data.isUse)
            $("#remark").val(res.data.content)
            $('#uploaderInput').siblings().css({'margin':'10px 0','width':'300px','height':'150px','background':'url('+location.origin+res.data.imgSrc+') no-repeat','background-size': 'contain'});
        }

    })
}
if(id){
    getNewsDetails(id)
}
/*保存新闻*/
function newsSave(){
    var data = {
        'entity.id':+$("#entityId").val() || undefined,
        'entity.title':$("#newsName").val(),
        'entity.newsType':$("#newsType").val(),
        'entity.time':$("#time").val(),
        'entity.isUse':$("#isUse").val(),
        'entity.content':$("#remark").val(),
        'image':$('#uploaderInput')[0].files[0] || undefined
    }
    if(!data['entity.title']){ alert('请输入新闻名称'); return }
    if(!data['entity.time']){ alert('请选择新闻时间'); return }
    if(!data['entity.newsType']){ alert('请选择新闻分类'); return }
    if(!data['entity.isUse']){ alert('请选择是否首页展示'); return }
    if(!data['entity.id'] && !data['image']){ alert('请选择图片'); return }
    if(!data['entity.content']){ alert('请输入新闻内容'); return }

    //如果有图片，使用FileReader提交图片，没有直接提交其他数据
    if(data.image){
        var reader = new FileReader();
        reader.readAsDataURL(data.image);
        reader.onload = function(e){ // reader onload start
            // ajax 上传图片
            data.image = e.target.result;
            $.sale.officialNewsSave(data,function(){
                window.location.pathname = '/backend/officialNews/list';
            })
        }
    }else{
        $.sale.officialNewsSave(data,function(){
            window.location.pathname = '/backend/officialNews/list';
        })
    }


}
$('input[name="daterange"]').daterangepicker({
    calender_style: "picker_4",
    singleDatePicker:true,
    timePicker:true,
    locale: {
        format: 'YYYY-MM-DD HH:mm'
    },
}, function (start, end, label) {
    // console.log(start.format('YYYY-MM-DD'));
});


</script>
</html>
