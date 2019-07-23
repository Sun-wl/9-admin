<html>
<head>
    <title>订单详情</title>
    <link href="${request.contextPath}/static/common.css" rel="stylesheet" type="text/css"/>
    <#include "../common/resource.ftl">
    <style>
        table th, table td, table td input, table td select{
            text-align:center;
        }
        .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{
            vertical-align: middle;
            white-space: nowrap;
        }
        .bill > div{
            padding-top:15px;
            border-bottom:1px dashed #DBDBDB;
        }
        .bill > div:first-child{
            padding-top:0;
        }
        .bill > div:last-child{
            border-bottom:0;
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
                订单详情
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 销售管理</a></li>
                <li class="active">订单详情</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-xs-12">

                    <div class="box box-info">
                        <div class="box-header with-border">
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <!-- form start -->
                            <form class="form-horizontal">
                                <div class="col-sm-12">
                                    <div class="form-group p-t-15" style="border-top:1px solid #ccc">
                                        <div class="col-sm-1 text-center">订单信息</div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-1">订单号</div>
                                        <div class="col-sm-8" id="orderNo"></div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-1">保险费</div>
                                        <div class="col-sm-8" id="premiumTotal"></div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-1">包装费</div>
                                        <div class="col-sm-8" id="packPrice"></div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-1">总金额</div>
                                        <div class="col-sm-8" id="amount"></div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-1">购买产品</div>
                                        <div class="col-sm-10 table-responsive">
                                            <table class="table table-bordered">
                                                <thead>
                                                <tr>
                                                    <th>产品名称</th>
                                                    <th>含税单价（17%）</th>
                                                    <th>包装规格</th>
                                                    <th>数量</th>
                                                    <th>含税金额</th>
                                                    <th>备注</th>
                                                    <th>联系人</th>
                                                    <th>手机</th>
                                                    <th>地址</th>
                                                </tr>
                                                </thead>
                                                <tbody class="products">
                                                </tbody>
                                                <tfoot>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>

                                    <div class="form-group p-t-15" style="border-top:1px solid #ccc">
                                        <div class="col-sm-1 text-center">付款方式</div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-1">收款姓名</div>
                                        <div class="col-sm-8" id="name"></div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-1">银行</div>
                                        <div class="col-sm-8" id="bankName"></div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-1">支行</div>
                                        <div class="col-sm-8" id="openBank"></div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-1">账号</div>
                                        <div class="col-sm-8" id="bankNo"></div>
                                    </div>

                                    <div class="form-group p-t-15" style="border-top:1px solid #ccc">
                                        <div class="col-sm-1 text-center">发票信息</div>
                                        <div class="col-sm-8 billBox">
                                            <table class="table table-bordered">
                                                <thead>
                                                <tr>
                                                    <th>产品名称</th>
                                                    <th>开票名称</th>
                                                    <th>纳税人识别号</th>
                                                    <th>开票电话</th>
                                                    <th>开票地址</th>
                                                </tr>
                                                </thead>
                                                <tbody class="bill">

                                                </tbody>
                                                <tfoot>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>


                                    <div class="form-group p-t-15">
                                        <div class="col-sm-1 text-center">预付款信息</div>
                                        <div class="col-sm-4">
                                            <table class="table table-bordered">
                                                <thead>
                                                <tr>
                                                    <th>付款金额</th>
                                                    <th>付款时间</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr class="payInformation1">
                                                    <td>
                                                        <input type="hidden" class="payInformationId">
                                                        <input type="text" class="form-control money" onkeyup="fix2(this)">
                                                    </td>
                                                    <td><input type="text" name="daterange1" class="form-control time"></td>
                                                </tr>
                                                <tr class="payInformation2">
                                                    <td>
                                                        <input type="hidden" class="payInformationId">
                                                        <input type="text" class="form-control money" onkeyup="fix2(this)">
                                                    </td>
                                                    <td><input type="text" name="daterange1" class="form-control time"></td>
                                                </tr>
                                                </tbody>
                                                <tfoot>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="form-group p-t-15">
                                        <div class="col-sm-1 text-center">订单状态</div>
                                        <div class="col-sm-3">
                                            <select id="status" class="form-control">
                                                <option value="">----全部----</option>
                                                <option value="1">订单初审中</option>
                                                <option value="2">客户确认中</option>
                                                <option value="3">待付首付款</option>
                                                <option value="4">待支付尾款</option>
                                                <option value="5">已支付代发货</option>
                                                <option value="6">已发货</option>
                                                <option value="7">完成</option>
                                                <option value="8">取消</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group p-t-15" style="border-top:1px solid #ccc">
                                        <div class="col-sm-1 text-center">付款信息</div>
                                        <div class="col-sm-8">
                                            <table class="table table-bordered">
                                                <thead>
                                                <tr>
                                                    <th>付款时间</th>
                                                    <th>付款金额</th>
                                                    <th>付款方式</th>
                                                    <!--<th>短信提醒</th>-->
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr class="payRecord1">
                                                    <td>
                                                        <input type="hidden" class="payRecordId">
                                                        <input type="text" name="daterange2" class="form-control time">
                                                    </td>
                                                    <td><input type="text" class="form-control money" onkeyup="fix2(this)"></td>
                                                    <td><input type="text" class="form-control payModel"></td>
                                                    <!--<td><button class="btn btn-default">点击短信提醒</button></td>-->
                                                </tr>
                                                <tr class="payRecord2">
                                                    <td>
                                                        <input type="hidden" class="payRecordId">
                                                        <input type="text" name="daterange2" class="form-control time">
                                                    </td>
                                                    <td><input type="text" class="form-control money" onkeyup="fix2(this)"></td>
                                                    <td><input type="text" class="form-control payModel"></td>
                                                    <!--<td><button class="btn btn-default">点击短信提醒</button></td>-->
                                                </tr>
                                                </tbody>
                                                <tfoot>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="form-group p-t-15" style="border-top:1px solid #ccc">
                                        <div class="col-sm-1 text-center">发货信息</div>
                                        <div class="col-sm-7">
                                            <table class="table table-bordered">
                                                <thead>
                                                <tr>
                                                    <th>产品名称</th>
                                                    <th>配送公司</th>
                                                    <th>运单号</th>
                                                </tr>
                                                </thead>
                                                <tbody class="wayStr">

                                                </tbody>
                                                <tfoot>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="form-group p-t-15" style="border-top:1px solid #ccc">
                                        <div class="col-sm-5 text-right">
                                            <a href="/backend/order/list" class="btn btn-danger">取消</a>
                                        </div>
                                        <div class="col-sm-3 text-center">
                                            <a href="javascript:void(0)" class="btn btn-success" onclick="orderSave()">提交</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div><!-- /.box-body -->
                    </div>

                </div><!-- /.col -->
            </div><!-- /.row -->

        </section><!-- /.content -->
    </div><!-- /.content-wrapper -->
<#include "../common/footer.ftl">
</div>
</body>
<script>
var orderNo = getUrlParam().orderNo;
var products;
//获取订单详情，将数据展示
function orderDetails(orderNo){
    $.sale.orderDetails(orderNo, function(res){
        var order = res.data.order,
            paymentModels = res.data.paymentModels,                         //付款方式
            payRecordList = res.data.payRecordList,                         //付款信息
            paymentInformationList = res.data.paymentInformationList;       //预付款信息
        products = res.data.itemList;
        $('#orderNo').html(order.orderNo)
        $('#premiumTotal').html(order.premiumTotal)
        $('#packPrice').html(order.packPrice)
        $('#amount').html(order.amount)
        $('#status').val(order.status)
        $('#name').html(paymentModels.name)
        $('#bankName').html(paymentModels.bankName)
        $('#openBank').html(paymentModels.openBank)
        $('#bankNo').html(paymentModels.bankNo)


        if(products.length){
            products.forEach(function(item, index){
                /*购买产品表格*/
                //多个包装规格的，合并单元格
                var remark = item.remark || '无'
                var a = '<tr>'+
                            '<td rowspan="'+item.purchaseDetailsList.length+'">'+item.productName+'</td>'+
                            '<td rowspan="'+item.purchaseDetailsList.length+'">'+item.unitPrice+'</td>'+
                            '<td>'+item.purchaseDetailsList[0].specifications+'</td>'+
                            '<td>'+item.purchaseDetailsList[0].num+'</td>'+
                            '<td>'+item.purchaseDetailsList[0].amount+'</td>'+
                            '<td rowspan="'+item.purchaseDetailsList.length+'">'+remark+'</td>'+
                            '<td rowspan="'+item.purchaseDetailsList.length+'">'+item.receiveName+'</td>'+
                            '<td rowspan="'+item.purchaseDetailsList.length+'">'+item.receiveMobile+'</td>'+
                            '<td rowspan="'+item.purchaseDetailsList.length+'">'+item.receiveAddress+'</td>'+
                        '</tr>'
                $('.products').append(a)
                if(item.purchaseDetailsList.length > 1){
                    item.purchaseDetailsList.forEach(function(i,index){
                        if(index){
                            a = '<tr>'+
                                    '<td>'+i.specifications+'</td>'+
                                    '<td>'+i.num+'</td>'+
                                    '<td>'+i.amount+'</td>'+
                                '</tr>'
                            $('.products').append(a)
                        }
                    })
                }
                /*购买产品表格*/


                /*发票信息，若有，遍历，若无，显示无*/
                if(item.billingId){
                    var b = '<tr>'+
                                 '<td>'+item.productName+'</td>'+
                                 '<td>'+item.billingTitle+'</td>'+
                                 '<td>'+item.billingTfn+'</td>'+
                                 '<td>'+item.billingMobile+'</td>'+
                                 '<td>'+item.billingAddress+'</td>'+
                             '</tr>'
                    $('.bill').append(b)
                }else{
                    $('.billBox').html('无')
                }
                /*发票信息*/

                /*发货信息*/
                var c = '<tr class="wayStr'+index+'">'+
                             '<td class="product">'+item.productName+'</td>'+
                             '<td>'+
                                 '<select class="form-control wayType">'+
                                     '<option value="">---请选择---</option>'+
                                     '<option value="SF">顺丰速运</option>'+
                                     '<option value="HTKY">百世快递</option>'+
                                     '<option value="ZTO">中通快递</option>'+
                                     '<option value="STO">申通快递</option>'+
                                     '<option value="EMS">EMS</option>'+
                                 '</select>'+
                             '</td>'+
                             '<td><input type="text" class="form-control wayNo" value="'+(item.wayBill || '')+'"></td>'+
                         '</tr>'
                 $('.wayStr').append(c)
                 $('.wayStr'+index+' .wayType').val(item.wayType)
                /*发货信息*/
            })
        }

//        预付款信息
        if(paymentInformationList.length){
            paymentInformationList.forEach(function(item, i){
                $('.payInformation'+(i+1)+' .payInformationId').val(item.id)
                $('.payInformation'+(i+1)+' .money').val(item.payMoney)
                $('.payInformation'+(i+1)+' .time').val(item.dateTime)
            })
        }
//        付款信息
        if(payRecordList.length){
            payRecordList.forEach(function(item, i){
                $('.payRecord'+(i+1)+' .payRecordId').val(item.id)
                $('.payRecord'+(i+1)+' .time').val(item.payTime)
                $('.payRecord'+(i+1)+' .money').val(item.amount)
                $('.payRecord'+(i+1)+' .payModel').val(item.payMode)
            })
        }

    })
}

//保存状态、发货信息
function orderSave1(){
    var data = {
        orderNo:$('#orderNo').html(),
        status:$('#status').val()
    }
    var wayStr = [];
    for(var i=0;i<products.length;i++){
        if($('.wayStr'+i+' .wayType').val() && $('.wayStr'+i+' .wayNo').val()){
            wayStr.push({
                wayType:$('.wayStr'+i+' .wayType').val(),
                wayNo:$('.wayStr'+i+' .wayNo').val(),
                productId:products[i].productId,
                orderItemId:products[i].id
            })
        }
    }
    if(wayStr.length){
        data.wayStr = JSON.stringify(wayStr);
    }else{
        data.wayStr = undefined;
    }
    return $.sale.orderSave(data,function(){})
}

//保存预付款信息
function orderSave2(){
    var arr = []
    for(var i=1;i<=2;i++){
        if($(".payInformation"+i+" .money").val() && $(".payInformation"+i+" .time").val()){
            arr.push({
                id:+$(".payInformation"+i+" .payInformationId").val() || undefined,
                orderNo:$('#orderNo').html(),
                payMoney:+$(".payInformation"+i+" .money").val(),
                dateTime:$(".payInformation"+i+" .time").val()
            })
        }
    }
    var data = {
        payInformationStr:arr.length ? JSON.stringify(arr) : undefined
    }
    return $.sale.payInformationSave(data,function(){})
}

//保存付款信息
function orderSave3(){
    var arr = []
    for(var i=1;i<=2;i++){
        if($(".payRecord"+i+" .money").val() && $(".payRecord"+i+" .payModel").val() && $(".payRecord"+i+" .time").val()){
            arr.push({
                id:+$(".payRecord"+i+" .payRecordId").val() || undefined,
                orderNo:$('#orderNo').html(),
                amount:+$(".payRecord"+i+" .money").val(),
                payMode:$(".payRecord"+i+" .payModel").val(),
                payTime:$(".payRecord"+i+" .time").val()
            })
        }
    }
    var data = {
        payModelStr:arr.length ? JSON.stringify(arr) : undefined
    }
    console.log(data)
    return $.sale.payRecordSave(data,function(){
        window.location.pathname = '/backend/order/list';
    })
}

//按顺序保存所有信息
function orderSave(){
    orderSave1().then(function(){
        return orderSave2();
    }).then(function(){
        return orderSave3();
    })
}


$(function(){
    orderDetails(orderNo);
    $('input[name="daterange1"]').daterangepicker({
        calender_style: "picker_4",
        singleDatePicker:true,
        locale: {
            format: 'YYYY-MM-DD'
        },
    }, function (start, end, label) {
        // console.log(start.format('YYYY-MM-DD'));
    });
    $('input[name="daterange2"]').daterangepicker({
        calender_style: "picker_4",
        singleDatePicker:true,
        timePicker:true,
        locale: {
            format: 'YYYY-MM-DD HH:mm'
        },
    }, function (start, end, label) {
        // console.log(start.format('YYYY-MM-DD'));
    });
})

</script>
</html>