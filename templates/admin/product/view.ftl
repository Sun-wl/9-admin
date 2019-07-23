<html>
<head>
    <title>添加产品</title>
    <link href="${request.contextPath}/static/common.css" rel="stylesheet" type="text/css"/>
<#include "../common/resource.ftl">
<style>
.table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>td, .table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td, .table-bordered>thead>tr>th{
    font-size:14px;
    font-weight:normal;
    white-space: nowrap;
    text-align:center;
    border-color:#eee;
}
td{min-width:120px; !important;}
.price select, .price input{display:inline-block;}
.price select{width:55px;}
.price input{width:65px;}
.m-row-10{
    margin:0 10px;
}
.handsel100 input, .handsel30 input, .basePriceBox input, .productWeekDays input{
    text-align:center;
}
</style>
</head>
<body class="sidebar-mini wysihtml5-supported skin-blue">
<div class="wrapper">
<#include "../common/top.ftl">
<#include "../common/left.ftl">
<@leftMenu pageName="product"/>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                添加产品
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 产品管理</a></li>
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
                            <div class="box-body">
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">产品名称</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="name" placeholder="请输入名称">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">产品代码</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="code" placeholder="请输入代码">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">产品分类</label>
                                    <div class="col-sm-3">
                                        <select id="metalTypeId" class="form-control">
                                            <option value="">----请选择----</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">订货批量</label>
                                    <div class="col-sm-2">
                                        <input class="form-control" id="minimumQuantity" placeholder="起订量" onkeyup="fix2(this)">
                                    </div>
                                    <div class="col-sm-1">
                                        <label class="control-label">
                                            千克
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">库存</label>
                                    <div class="col-sm-2">
                                        <input class="form-control" id="stock" placeholder="库存" onkeyup="fix2(this)">
                                    </div>
                                    <div class="col-sm-1">
                                        <label class="control-label">
                                            千克
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">包装规格</label>
                                    <div class="col-sm-10" id="productSpecifications">

                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">产品排序</label>
                                    <div class="col-sm-2">
                                        <input class="form-control" id="rank" placeholder="产品排序" onkeyup="fix0(this)">
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="control-label" style="color:#999">
                                            （表示在公众号产品报价界面显示的顺序）
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group noManage">
                                    <label class="col-sm-1 control-label">是否启用</label>
                                    <div class="col-sm-2">
                                        <select id="use" class="form-control">
                                            <option value="">---请选择---</option>
                                            <option value="1">是</option>
                                            <option value="0">否</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="control-label" style="color:#999">
                                            （“是”表示展现在公众号界面，“否”不展现在公众号界面）
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">基础价格</label>
                                    <div class="col-sm-6">
                                        <table class="table table-bordered basePriceBox">
                                            <thead>
                                            <tr>
                                                <th>原料价格</th>
                                                <th>含量</th>
                                                <th>生产成本</th>
                                                <th>利润</th>
                                                <th>基础价格</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td><input class="form-control" id="materialPrice" onkeyup="fix2(this)" oninput="basePrice()"></td>
                                                <td><input class="form-control" id="content" onkeyup="fix4(this)" oninput="basePrice()"></td>
                                                <td><input class="form-control" id="cost" onkeyup="fix2(this)" oninput="basePrice()"></td>
                                                <td><input class="form-control" id="profit" onkeyup="fix2(this)" oninput="basePrice()"></td>
                                                <td id="basePrice"></td>
                                            </tr>
                                            </tbody>
                                            <tfoot>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                                <div class="form-group noManage">
                                    <label class="col-sm-1 control-label">100%定金价格</label>
                                    <div class="table-responsive handsel100">
                                        <table class="table table-bordered">
                                            <thead>
                                            <tr>
                                                <th>交货日（第几周的周二）</th>
                                                <th colspan="3">第5周</th>
                                                <th colspan="3">第7周</th>
                                                <th colspan="3">第9周</th>
                                                <th colspan="3">第11周</th>
                                                <th colspan="3">第13周</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>批量（kg）</td>
                                                <td><input class="form-control" id="batch1" onkeyup="fix2(this)" oninput="batchChange()" onchange="batchChange()"></td>
                                                <td><input class="form-control" id="batch2" onkeyup="fix2(this)" oninput="batchChange()" onchange="batchChange()"></td>
                                                <td><input class="form-control" id="batch3" onkeyup="fix2(this)" oninput="batchChange()" onchange="batchChange()"></td>
                                                <td class="batch1"></td>
                                                <td class="batch2"></td>
                                                <td class="batch3"></td>
                                                <td class="batch1"></td>
                                                <td class="batch2"></td>
                                                <td class="batch3"></td>
                                                <td class="batch1"></td>
                                                <td class="batch2"></td>
                                                <td class="batch3"></td>
                                                <td class="batch1"></td>
                                                <td class="batch2"></td>
                                                <td class="batch3"></td>
                                            </tr>
                                            <tr class="price">
                                                <td>计算</td>
                                                <td class="left5">
                                                    <span class="leftValue m-row-10"></span>
                                                    <select class="form-control centerValue" onchange="compute('.handsel100 ')">
                                                        <option value="1">+</option>
                                                        <option value="0">-</option>
                                                    </select>
                                                    <input class="form-control rightValue" onkeyup="fix2(this)" oninput="compute('.handsel100 ')">
                                                </td>
                                                <td class="center5">
                                                    <span class="leftValue m-row-10"></span>
                                                    <select class="form-control centerValue" onchange="compute('.handsel100 ')">
                                                        <option value="1">+</option>
                                                        <option value="0">-</option>
                                                    </select>
                                                    <input class="form-control rightValue" onkeyup="fix2(this)" oninput="compute('.handsel100 ')">
                                                </td>
                                                <td class="right5">
                                                    <span class="leftValue m-row-10"></span>
                                                    <select class="form-control centerValue" onchange="compute('.handsel100 ')">
                                                        <option value="1">+</option>
                                                        <option value="0">-</option>
                                                    </select>
                                                    <input class="form-control rightValue" onkeyup="fix2(this)" oninput="compute('.handsel100 ')">
                                                </td>
                                                <td class="left left7">
                                                    <span class="leftValue m-row-10"></span>
                                                    <span class="centerCompute m-row-10"></span>
                                                    <span class="rightValue m-row-10"></span>
                                                </td>
                                                <td class="center center7">
                                                    <span class="leftValue m-row-10"></span>
                                                    <span class="centerCompute m-row-10"></span>
                                                    <span class="rightValue m-row-10"></span>
                                                </td>
                                                <td class="right7">
                                                    <span class="leftValue m-row-10"></span>
                                                    <select class="form-control centerValue" onchange="compute('.handsel100 ')">
                                                        <option value="1">+</option>
                                                        <option value="0">-</option>
                                                    </select>
                                                    <input class="form-control rightValue" onkeyup="fix2(this)" oninput="compute('.handsel100 ')">
                                                </td>
                                                <td class="left left9">
                                                    <span class="leftValue m-row-10"></span>
                                                    <span class="centerCompute m-row-10"></span>
                                                    <span class="rightValue m-row-10"></span>
                                                </td>
                                                <td class="center center9">
                                                    <span class="leftValue m-row-10"></span>
                                                    <span class="centerCompute m-row-10"></span>
                                                    <span class="rightValue m-row-10"></span>
                                                </td>
                                                <td class="right right9">
                                                    <span class="leftValue m-row-10"></span>
                                                    <span class="centerCompute m-row-10"></span>
                                                    <span class="rightValue m-row-10"></span>
                                                </td>
                                                <td class="left left11">
                                                    <span class="leftValue m-row-10"></span>
                                                    <span class="centerCompute m-row-10"></span>
                                                    <span class="rightValue m-row-10"></span>
                                                </td>
                                                <td class="center center11">
                                                    <span class="leftValue m-row-10"></span>
                                                    <span class="centerCompute m-row-10"></span>
                                                    <span class="rightValue m-row-10"></span>
                                                </td>
                                                <td class="right right11">
                                                    <span class="leftValue m-row-10"></span>
                                                    <span class="centerCompute m-row-10"></span>
                                                    <span class="rightValue m-row-10"></span>
                                                </td>
                                                <td class="left left13">
                                                    <span class="leftValue m-row-10"></span>
                                                    <span class="centerCompute m-row-10"></span>
                                                    <span class="rightValue m-row-10"></span>
                                                </td>
                                                <td class="center center13">
                                                    <span class="leftValue m-row-10"></span>
                                                    <span class="centerCompute m-row-10"></span>
                                                    <span class="rightValue m-row-10"></span>
                                                </td>
                                                <td class="right right13">
                                                    <span class="leftValue m-row-10"></span>
                                                    <span class="centerCompute m-row-10"></span>
                                                    <span class="rightValue m-row-10"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>结果</td>
                                                <td class="result5left"></td>
                                                <td class="result5center"></td>
                                                <td class="result5right"></td>
                                                <td class="result7left"></td>
                                                <td class="result7center"></td>
                                                <td class="result7right"></td>
                                                <td class="result9left"></td>
                                                <td class="result9center"></td>
                                                <td class="result9right"></td>
                                                <td class="result11left"></td>
                                                <td class="result11center"></td>
                                                <td class="result11right"></td>
                                                <td class="result13left"></td>
                                                <td class="result13center"></td>
                                                <td class="result13right"></td>
                                            </tr>
                                            </tbody>
                                            <tfoot>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                                <div class="form-group noManage">
                                    <label class="col-sm-1 control-label">30%定金价格</label>
                                    <div class="table-responsive handsel30">
                                        <table class="table table-bordered">
                                            <thead>
                                            <tr>
                                                <th>交货日（第几周的周二）</th>
                                                <th colspan="3">第5周</th>
                                                <th colspan="3">第7周</th>
                                                <th colspan="3">第9周</th>
                                                <th colspan="3">第11周</th>
                                                <th colspan="3">第13周</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>批量（kg）</td>
                                                <td class="batch1"></td>
                                                <td class="batch2"></td>
                                                <td class="batch3"></td>
                                                <td class="batch1"></td>
                                                <td class="batch2"></td>
                                                <td class="batch3"></td>
                                                <td class="batch1"></td>
                                                <td class="batch2"></td>
                                                <td class="batch3"></td>
                                                <td class="batch1"></td>
                                                <td class="batch2"></td>
                                                <td class="batch3"></td>
                                                <td class="batch1"></td>
                                                <td class="batch2"></td>
                                                <td class="batch3"></td>
                                            </tr>
                                            <tr class="price">
                                                <td>计算</td>
                                                <td class="left5">
                                                    <span class="leftValue m-row-10"></span>
                                                    <select class="form-control centerValue" onchange="compute('.handsel30 ')">
                                                        <option value="1">+</option>
                                                        <option value="0">-</option>
                                                    </select>
                                                    <input class="form-control rightValue" onkeyup="fix2(this)" oninput="compute('.handsel30 ')">
                                                </td>
                                                <td class="center5">
                                                    <span class="leftValue m-row-10"></span>
                                                    <select class="form-control centerValue" onchange="compute('.handsel30 ')">
                                                        <option value="1">+</option>
                                                        <option value="0">-</option>
                                                    </select>
                                                    <input class="form-control rightValue" onkeyup="fix2(this)" oninput="compute('.handsel30 ')">
                                                </td>
                                                <td class="right5">
                                                    <span class="leftValue m-row-10"></span>
                                                    <select class="form-control centerValue" onchange="compute('.handsel30 ')">
                                                        <option value="1">+</option>
                                                        <option value="0">-</option>
                                                    </select>
                                                    <input class="form-control rightValue" onkeyup="fix2(this)" oninput="compute('.handsel30 ')">
                                                </td>
                                                <td class="left left7">
                                                    <span class="leftValue m-row-10"></span>
                                                    <span class="centerCompute m-row-10"></span>
                                                    <span class="rightValue m-row-10"></span>
                                                </td>
                                                <td class="center center7">
                                                    <span class="leftValue m-row-10"></span>
                                                    <span class="centerCompute m-row-10"></span>
                                                    <span class="rightValue m-row-10"></span>
                                                </td>
                                                <td class="right7">
                                                    <span class="leftValue m-row-10"></span>
                                                    <select class="form-control centerValue" onchange="compute('.handsel30 ')">
                                                        <option value="1">+</option>
                                                        <option value="0">-</option>
                                                    </select>
                                                    <input class="form-control rightValue" onkeyup="fix2(this)" oninput="compute('.handsel30 ')">
                                                </td>
                                                <td class="left left9">
                                                    <span class="leftValue m-row-10"></span>
                                                    <span class="centerCompute m-row-10"></span>
                                                    <span class="rightValue m-row-10"></span>
                                                </td>
                                                <td class="center center9">
                                                    <span class="leftValue m-row-10"></span>
                                                    <span class="centerCompute m-row-10"></span>
                                                    <span class="rightValue m-row-10"></span>
                                                </td>
                                                <td class="right right9">
                                                    <span class="leftValue m-row-10"></span>
                                                    <span class="centerCompute m-row-10"></span>
                                                    <span class="rightValue m-row-10"></span>
                                                </td>
                                                <td class="left left11">
                                                    <span class="leftValue m-row-10"></span>
                                                    <span class="centerCompute m-row-10"></span>
                                                    <span class="rightValue m-row-10"></span>
                                                </td>
                                                <td class="center center11">
                                                    <span class="leftValue m-row-10"></span>
                                                    <span class="centerCompute m-row-10"></span>
                                                    <span class="rightValue m-row-10"></span>
                                                </td>
                                                <td class="right right11">
                                                    <span class="leftValue m-row-10"></span>
                                                    <span class="centerCompute m-row-10"></span>
                                                    <span class="rightValue m-row-10"></span>
                                                </td>
                                                <td class="left left13">
                                                    <span class="leftValue m-row-10"></span>
                                                    <span class="centerCompute m-row-10"></span>
                                                    <span class="rightValue m-row-10"></span>
                                                </td>
                                                <td class="center center13">
                                                    <span class="leftValue m-row-10"></span>
                                                    <span class="centerCompute m-row-10"></span>
                                                    <span class="rightValue m-row-10"></span>
                                                </td>
                                                <td class="right right13">
                                                    <span class="leftValue m-row-10"></span>
                                                    <span class="centerCompute m-row-10"></span>
                                                    <span class="rightValue m-row-10"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>结果</td>
                                                <td class="result5left"></td>
                                                <td class="result5center"></td>
                                                <td class="result5right"></td>
                                                <td class="result7left"></td>
                                                <td class="result7center"></td>
                                                <td class="result7right"></td>
                                                <td class="result9left"></td>
                                                <td class="result9center"></td>
                                                <td class="result9right"></td>
                                                <td class="result11left"></td>
                                                <td class="result11center"></td>
                                                <td class="result11right"></td>
                                                <td class="result13left"></td>
                                                <td class="result13center"></td>
                                                <td class="result13right"></td>
                                            </tr>
                                            </tbody>
                                            <tfoot>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                                <div class="form-group noManage">
                                    <label class="col-sm-1 control-label">优惠幅度</label>
                                    <div class="col-sm-4">
                                        <table class="table table-bordered">
                                            <thead>
                                            <tr>
                                                <th>区间（kg）</th>
                                                <th>级距</th>
                                                <th>优惠幅度 ( 元/克)</th>
                                            </tr>
                                            </thead>
                                            <tbody class="productWeekDays">
                                            <tr class="youhui9">
                                                <td><input class="form-control section" onkeyup="fix2(this)"></td>
                                                <td><input class="form-control contentInterval"  onkeyup="fix2(this)" oninput="youhui()"></td>
                                                <td class="discount"></td>
                                            </tr>
                                            <tr class="youhui8">
                                                <td><input class="form-control section" onkeyup="fix2(this)"></td>
                                                <td><input class="form-control contentInterval"  onkeyup="fix2(this)" oninput="youhui()"></td>
                                                <td class="discount"></td>
                                            </tr>
                                            <tr class="youhui7">
                                                <td><input class="form-control section" onkeyup="fix2(this)"></td>
                                                <td><input class="form-control contentInterval"  onkeyup="fix2(this)" oninput="youhui()"></td>
                                                <td class="discount"></td>
                                            </tr>
                                            <tr class="youhui6">
                                                <td><input class="form-control section" onkeyup="fix2(this)"></td>
                                                <td><input class="form-control contentInterval"  onkeyup="fix2(this)" oninput="youhui()"></td>
                                                <td class="discount"></td>
                                            </tr>
                                            <tr class="youhui5">
                                                <td><input class="form-control section" onkeyup="fix2(this)"></td>
                                                <td><input class="form-control contentInterval"  onkeyup="fix2(this)" oninput="youhui()"></td>
                                                <td class="discount"></td>
                                            </tr>
                                            <tr class="youhui4">
                                                <td><input class="form-control section" onkeyup="fix2(this)"></td>
                                                <td><input class="form-control contentInterval"  onkeyup="fix2(this)" oninput="youhui()"></td>
                                                <td class="discount"></td>
                                            </tr>
                                            <tr class="youhui3">
                                                <td><input class="form-control section" onkeyup="fix2(this)"></td>
                                                <td><input class="form-control contentInterval"  onkeyup="fix2(this)" oninput="youhui()"></td>
                                                <td class="discount"></td>
                                            </tr>
                                            <tr class="youhui2">
                                                <td><input class="form-control section" onkeyup="fix2(this)"></td>
                                                <td><input class="form-control contentInterval"  onkeyup="fix2(this)" oninput="youhui()"></td>
                                                <td class="discount"></td>
                                            </tr>
                                            <tr class="youhui1">
                                                <td><input class="form-control section" onkeyup="fix2(this)"></td>
                                                <td class="contentInterval"></td>
                                                <td class="discount"></td>
                                            </tr>
                                            </tbody>
                                            <tfoot>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div class="col-sm-1">
                                        <img src="${request.contextPath}/static/img/add.png" style="width:20px; margin-top:8px;" onClick="addProductWeekDays()" />
                                    </div>
                                </div>
                            </div><!-- /.box-body -->

                            <div class="box-footer">
                                <div class="form-group p-t-15" style="border-top:1px solid #ccc">
                                    <div class="col-sm-6 text-right">
                                        <a href="/backend/product/list" class="btn btn-danger">取消</a>
                                    </div>
                                    <div class="col-sm-6 text-left">
                                        <a href="javascript:void(0)" class="btn btn-success" id="confirm">确认</a>
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
var productWeekDaysNum = 9,packs = [];

function productSaveData(){
    var data = {
        'entity.id':+params.id || undefined ,
        'entity.name': $('#name').val(),
        'entity.code': $('#code').val(),
        'entity.metalTypeId': $('#metalTypeId').val(),
        'entity.minimumQuantity': $('#minimumQuantity').val(),
        'entity.stock': $('#stock').val(),
        'entity.rank': $('#rank').val(),
        'entity.materialPrice':$("#materialPrice").val(),
        'entity.content':$("#content").val(),
        'entity.cost':$("#cost").val(),
        'entity.profit':$("#profit").val(),
        'entity.basePrice':$("#basePrice").html()
    }
    //包装规格
    var productSpecifications = []
    var obj = document.getElementsByName('specifications'); //选择所有name="'specifications'"的对象，返回数组
    //取到对象数组后，我们来循环检测它是不是被选中
    var s = '';
    for(var i=0; i<obj.length; i++){
        if(obj[i].checked){
            productSpecifications.push({Specifications:obj[i].value})
        }
    }
    data.productSpecifications = JSON.stringify(productSpecifications)
    /*如果是新增，将是否启用设为否，如果是编辑，设为原来的值*/
    if(!data['entity.id']){
        data['entity.use'] = 0;
    }else{
        data['entity.use'] = +$('#use').val();
    }
    /*只有管理员可以编辑定金价格、优惠幅度*/
    if(role == 1){
        //如果是管理员，可以修改是否启用
        data['entity.use'] = +$('#use').val();
        var productWeekDays = [],   //定金价格
            productDiscounts = [];  //优惠幅度

        /*~~~~~~~~~~~~~~~~~~~~~~~~~定金价格~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
        /*遍历定金价格为30%，100%*/
        for(var j=100;j>=30;j=j-70){
            /*遍历第5,7,9,11,13周*/
            for(var i=5;i<=13;i=i+2){
                /*每周的前两种批量按照第5周的文本框值计算*/
                /*第7周以后的第三种批量按照第7周的文本框值计算*/
                productWeekDays.push({
                    downPaymentPercentage:j,                //定金百分比
                    weekDayNub:i,                           //第几周
                    batch:(+$('#batch1').val()).toFixed(2), //批量
                    leftValue:+$('.handsel'+j+' .left'+i+' .leftValue').html(), //计算（左）
                    rightValue:+$('.handsel'+j+' .left5 .rightValue').val(),    //计算（右）
                    calculationMode:$('.handsel'+j+' .left5 .centerValue').val()==1 ? true : false, //计算（中：+/-）
                    result:+$('.handsel'+j+' .result'+i+'left').html()  //结果
                })
                productWeekDays.push({
                    downPaymentPercentage:j,
                    weekDayNub:i,
                    batch:(+$('#batch2').val()).toFixed(2),
                    leftValue:+$('.handsel'+j+' .center'+i+' .leftValue').html(),
                    rightValue:+$('.handsel'+j+' .center5 .rightValue').val(),
                    calculationMode:$('.handsel'+j+' .center5 .centerValue').val()==1 ? true : false,
                    result:+$('.handsel'+j+' .result'+i+'center').html()
                })
                if(i==5){
                    productWeekDays.push({
                        downPaymentPercentage:j,
                        weekDayNub:i,
                        batch:(+$('#batch3').val()).toFixed(2),
                        leftValue:+$('.handsel'+j+' .right5 .leftValue').html(),
                        rightValue:+$('.handsel'+j+' .right5 .rightValue').val(),
                        calculationMode:$('.handsel'+j+' .right5 .centerValue').val()==1 ? true : false,
                        result:+$('.handsel'+j+' .result'+i+'right').html()
                    })
                }else{
                    productWeekDays.push({
                        downPaymentPercentage:j,
                        weekDayNub:i,
                        batch:(+$('#batch3').val()).toFixed(2),
                        leftValue:+$('.handsel'+j+' .right'+i+' .leftValue').html(),
                        rightValue:+$('.handsel'+j+' .right7 .rightValue').val(),
                        calculationMode:$('.handsel'+j+' .right7 .centerValue').val()==1 ? true : false,
                        result:+$('.handsel'+j+' .result'+i+'right').html()
                    })
                }
            }
        }
        data.ProductWeekPriceModel = JSON.stringify(productWeekDays)
        /*~~~~~~~~~~~~~~~~~~~~~~~~~定金价格~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

        /*~~~~~~~~~~~~~~~~~~~~~~~~~优惠幅度~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
        if($('.youhui1 .section').val()){
            productDiscounts.push({
                section:+$('.youhui1 .section').val()
            })
        }
        for(var i=2;i<=productWeekDaysNum;i++){
            if($('.youhui'+i+' .section').val() && $('.youhui'+i+' .contentInterval').val()){
                productDiscounts.push({
                    section:(+$('.youhui'+i+' .section').val()).toFixed(2),
                    contentInterval:(+$('.youhui'+i+' .contentInterval').val()).toFixed(2),
                    discount:(+$('.youhui'+i+' .discount').html()).toFixed(2)
                })
            }
        }
        data.productDiscount = JSON.stringify(productDiscounts)
        /*~~~~~~~~~~~~~~~~~~~~~~~~~优惠幅度~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
    }
    return data;
}

/*获取金属类型，遍历到下拉框*/
function getMetalType(){
    return $.product.metalType(function(res){
        res.data.forEach(function(item){
            var a = '<option value="' + item.id + '">' + item.name + '</option>'
            $("#metalTypeId").append(a);
        })
    })
}

/*获取包装规格，遍历复选框*/
function getPack(){
    return $.product.pack(function(res){
        packs = res.data;
        packs.forEach(function(item){
            var a = '<label class="control-label" style="margin-right:20px;">'+
                        '<input type="checkbox" name="specifications" value="'+item.id+'" > '+item.name + 'g/瓶' +
                    '</label>'
            $("#productSpecifications").append(a);
        })

    })
}

/*计算基础价格，基础价格表格任一文本框变化都执行*/
function basePrice(){
    var a = (+$("#materialPrice").val() * +$("#content").val() + +$("#cost").val() + +$("#profit").val()).toFixed(2)
    $("#basePrice").html(a)
    $(".right5 .leftValue").html(a)
    compute('.handsel100 ');
    compute('.handsel30 ');
}

/*批量，变化后全部批量变化*/
function batchChange(){
    $('.batch1').html(+$('#batch1').val())
    $('.batch2').html(+$('#batch2').val())
    $('.batch3').html(+$('#batch3').val())
}

/*计算定金价格所有值*/
function compute(f){
    var a;
    /*计算第5周-右-结果， 第5周-右-结果 === 第5周-中-计算（左） === 第7周-右-计算（左）*/
    if($(f + '.right5 .centerValue').val()==1){
        a = (+$(f + '.right5 .leftValue').html() + +$(f + '.right5 .rightValue').val()).toFixed(2);
    }else if($(f + '.right5 .centerValue').val()==0){
        a = (+$(f + '.right5 .leftValue').html() - +$(f + '.right5 .rightValue').val()).toFixed(2);
    }
    $(f + ".result5right").html(a);
    $(f + '.center5 .leftValue').html(a);
    $(f + '.right7 .leftValue').html(a);

    /*计算第5周-中-结果， 第5周-中-结果 === 第5周-左-计算（左）*/
    /*第5周-中-计算（中） === 第n周-中-计算（中）*/
    /*第5周-中-计算（右） === 第n周-中-计算（右）*/
    if($(f + '.center5 .centerValue').val()==1){
        a = (+$(f + '.center5 .leftValue').html() + +$(f + '.center5 .rightValue').val()).toFixed(2);
        $(f + '.center .centerCompute').html('+')
    }else if($(f + '.center5 .centerValue').val()==0){
        a = (+$(f + '.center5 .leftValue').html() - +$(f + '.center5 .rightValue').val()).toFixed(2);
        $(f + '.center .centerCompute').html('-')
    }
    $(f + ".result5center").html(a);
    $(f + '.left5 .leftValue').html(a);
    $(f + '.center .rightValue').html((+$(f + '.center5 .rightValue').val()).toFixed(2))

    /*计算第5周-左-结果*/
    /*第5周-左-计算（中） === 第n周-左-计算（中）*/
    /*第5周-左-计算（右） === 第n周-左-计算（右）*/
    if($(f + '.left5 .centerValue').val()==1){
        a = (+$(f + '.left5 .leftValue').html() + +$(f + '.left5 .rightValue').val()).toFixed(2);
        $(f + '.left .centerCompute').html('+')
    }else if($(f + '.left5 .centerValue').val()==0){
        a = (+$(f + '.left5 .leftValue').html() - +$(f + '.left5 .rightValue').val()).toFixed(2);
        $(f + '.left .centerCompute').html('-')
    }
    $(f + ".result5left").html(a);
    $(f + '.left .rightValue').html((+$(f + '.left5 .rightValue').val()).toFixed(2))

    /*计算第7周-右-结果， 第7周-右-结果 === 第7周-中-计算（左） === 第9周-右-计算（左）*/
    /*第7周-右-计算（中） === 第n周-右-计算（中）*/
    /*第7周-右-计算（右） === 第n周-右-计算（右）*/
    if($(f + '.right7 .centerValue').val()==1){
        a = (+$(f + '.right7 .leftValue').html() + +$(f + '.right7 .rightValue').val()).toFixed(2);
        $(f + '.right .centerCompute').html('+')
    }else if($(f + '.right7 .centerValue').val()==0){
        a = (+$(f + '.right7 .leftValue').html() - +$(f + '.right7 .rightValue').val()).toFixed(2);
        $(f + '.right .centerCompute').html('-')
    }
    $(f + ".result7right").html(a);
    $(f + ".center7 .leftValue").html(a);
    $(f + '.right9 .leftValue').html(a);
    $(f + '.right .rightValue').html((+$(f + '.right7 .rightValue').val()).toFixed(2))


    for(var i=7;i<=13;i=i+2){
        /*第n周-中-结果 === 第n周-左-计算（左）*/
        if($(f + '.center5 .centerValue').val()==1){
            a = (+$(f + '.center'+i+' .leftValue').html() + +$(f + '.center'+i+' .rightValue').html()).toFixed(2);
        }else if($(f + '.center5 .centerValue').val()==0){
            a = (+$(f + '.center'+i+' .leftValue').html() - +$(f + '.center'+i+' .rightValue').html()).toFixed(2);
        }
        $(f + '.result'+i+'center').html(a);
        $(f + '.left'+i+' .leftValue').html(a);


        /*第n周-左-结果*/
        if($(f + '.left5 .centerValue').val()==1){
            a = (+$(f + '.left'+i+' .leftValue').html() + +$(f + '.left'+i+' .rightValue').html()).toFixed(2);
        }else if($(f + '.left5 .centerValue').val()==0){
            a = (+$(f + '.left'+i+' .leftValue').html() - +$(f + '.left'+i+' .rightValue').html()).toFixed(2);
        }
        $(f + '.result'+i+'left').html(a);


        /*第n周-右-结果 === 第n周-中-计算（左） === 第n+2周-右-计算（左）*/
        if(i<13){
            if($(f + '.right7 .centerValue').val()==1){
                a = (+$(f + '.right'+(i+2)+' .leftValue').html() + +$(f + '.right'+(i+2)+' .rightValue').html()).toFixed(2);
            }else if($(f + '.right7 .centerValue').val()==0){
                a = (+$(f + '.right'+(i+2)+' .leftValue').html() - +$(f + '.right'+(i+2)+' .rightValue').html()).toFixed(2);
            }
            $(f + '.result'+(i+2)+'right').html(a);
            $(f + '.center'+(i+2)+' .leftValue').html(a);
            if(i<11){
                $(f + '.right'+(i+4)+' .leftValue').html(a);
            }
        }

    }

}

/*优惠幅度计算公式*/
function youhui(){
    $('.youhui2 .discount').html((+$('.youhui2 .contentInterval').val()).toFixed(2))
    for(var i=3;i <= productWeekDaysNum;i++){
        var a = (+$('.youhui'+(i-1)+' .discount').html() + +$('.youhui'+i+' .contentInterval').val()).toFixed(2);
        $('.youhui'+i+' .discount').html(a)
    }
}

/*优惠幅度表格添加行*/
function addProductWeekDays(){
    productWeekDaysNum++;
    var a = '<tr class="youhui'+(productWeekDaysNum)+'">\
                 <td><input class="form-control section" onkeyup="fix2(this)"></td>\
                 <td><input class="form-control contentInterval"  onkeyup="fix2(this)" oninput="youhui()"></td>\
                 <td class="discount"></td>\
             </tr>'
    $('.productWeekDays').prepend(a);
}
var params = getUrlParam();
/*获取产品详情，展示*/
function getDetails(){
    return $.product.details(params.id, function(res){
        var product = res.data.product,
            productDiscounts = res.data.productDiscounts,
            productSpecifications = res.data.productSpecifications,
            productWeekDays = res.data.productWeekDays,
            metalTypeList = res.data.metalTypeList;
        $("#name").val(product.name)
        $("#code").val(product.code)
        $("#metalTypeId").val(product.metalTypeId)
        $("#minimumQuantity").val(product.minimumQuantity)
        $("#stock").val(product.stock)
        //包装规格
        if(productSpecifications.length){
            productSpecifications.forEach(function(item){
               $('input:checkbox[name="specifications"][value="'+item.specifications+'"]').attr('checked','true');
            })
        }
        $("#rank").val(product.rank)
        $("#use").val(+product.use)
        $("#materialPrice").val(product.materialPrice)
        $("#content").val(product.content)
        $("#cost").val(product.cost)
        $("#profit").val(product.profit)
        $("#basePrice").html(product.basePrice)
        $(".basePrice").html($("#basePrice").html())
        $(".right5 .leftValue").html($("#basePrice").html())
        /*定金价格*/
        var arr1 = [],arr2 = [],arr3 = [],arr4 = []
        if(productWeekDays.length){
            productWeekDays.forEach(function(item){
                if(item.downPaymentPercentage==100 && item.weekDayNub==5){
                    arr1.push(item)
                }
                if(item.downPaymentPercentage==100 && item.weekDayNub==7){
                    arr2.push(item)
                }
                if(item.downPaymentPercentage==30 && item.weekDayNub==5){
                    arr3.push(item)
                }
                if(item.downPaymentPercentage==30 && item.weekDayNub==7){
                    arr4.push(item)
                }
            })
            arr1.sort(compare("batch"));
            arr2.sort(compare("batch"));
            arr3.sort(compare("batch"));
            arr4.sort(compare("batch"));
            $('#batch1').val(arr1[0].batch);
            $('#batch2').val(arr1[1].batch);
            $('#batch3').val(arr1[2].batch);
            batchChange();
            $(".handsel100 .left5 .centerValue").val(+arr1[0].calculationMode)
            $(".handsel100 .left5 .rightValue").val(arr1[0].rightValue)
            $(".handsel100 .center5 .centerValue").val(+arr1[1].calculationMode)
            $(".handsel100 .center5 .rightValue").val(arr1[1].rightValue)
            $(".handsel100 .right5 .centerValue").val(+arr1[2].calculationMode)
            $(".handsel100 .right5 .rightValue").val(arr1[2].rightValue)
            $(".handsel100 .right7 .centerValue").val(+arr2[2].calculationMode)
            $(".handsel100 .right7 .rightValue").val(arr2[2].rightValue)
            compute('.handsel100 ')
            $(".handsel30 .left5 .centerValue").val(+arr3[0].calculationMode)
            $(".handsel30 .left5 .rightValue").val(arr3[0].rightValue)
            $(".handsel30 .center5 .centerValue").val(+arr3[1].calculationMode)
            $(".handsel30 .center5 .rightValue").val(arr3[1].rightValue)
            $(".handsel30 .right5 .centerValue").val(+arr3[2].calculationMode)
            $(".handsel30 .right5 .rightValue").val(arr3[2].rightValue)
            $(".handsel30 .right7 .centerValue").val(+arr4[2].calculationMode)
            $(".handsel30 .right7 .rightValue").val(arr4[2].rightValue)
            compute('.handsel30 ')
        }
        /*优惠幅度*/
        if(productDiscounts.length){
            productDiscounts.sort(compare("section"));
            productDiscounts.forEach(function(item,index){
                $('.youhui'+(index+1)+' .section').val(item.section);
                $('.youhui'+(index+1)+' .contentInterval').val(item.contentInterval);
            })
            youhui();
        }

    });
}
$(function(){
    getRole().then(function(){
        if(role != 1){
            $('.noManage').hide();
        }
        return getMetalType();
    }).then(function(){
       return getPack();
    }).then(function(){
      if(params.id){
         return getDetails();
      }
    })

    /*保存*/
    $('#confirm').click(function(){
        var data = productSaveData();
        if(!data['entity.name']){ alert('请输入产品名称'); return }
        if(!data['entity.code']){ alert('请输入产品代码'); return }
        if(!data['entity.metalTypeId']){ alert('请选择产品分类'); return }
        if(!data['entity.minimumQuantity']){ alert('请输入起订量'); return }
        if(!data['entity.stock']){ alert('请输入库存'); return }
        if(!data['entity.rank']){ alert('请输入产品排序'); return }
        if(role == 1){
            if(!data['entity.materialPrice'] || !data['entity.content'] || !data['entity.cost'] || !data['entity.profit']){ alert('请完善基础价格'); return }
            if(!$('#batch1').val() || !$('#batch2').val() || !$('#batch3').val() ||
                !$('.handsel100 .left5 .rightValue').val() || !$('.handsel100 .center5 .rightValue').val() ||
                !$('.handsel100 .right5 .rightValue').val() || !$('.handsel100 .right7 .rightValue').val() ||
                !$('.handsel30 .left5 .rightValue').val() || !$('.handsel30 .center5 .rightValue').val() ||
                !$('.handsel30 .right5 .rightValue').val() || !$('.handsel30 .right7 .rightValue').val()){ alert('请完善定金价格'); return }
            if(!data.productDiscount.length){ alert('请输入优惠幅度'); return }
        }

        $.product.save(data,function(res){
            window.location.pathname = "/backend/product/list";
        })
    })
})


</script>
</html>