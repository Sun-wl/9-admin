/**
 * Created by wtf on 16/9/21.
 */
function ajaxDataTable(ele,option){

    return ele.DataTable({
        "scrollX": true,
        "paging": true,
        "lengthChange": false,
        "searching": false,
        "ordering": false,
        "info": true,
        "bPaginate": true,
        "bServerSide" : true,
        "responsive": true,
        "bLengthChange": false, //改变每页显示数据数量
        "bProcessing": true,
        "sAjaxSource" : option.url,
        "columns": option.columns,
        "columnDefs": option.columnDefs,
        "fnServerParams": option.searchParams,
        "bJQueryUI" : true,
        pagingType: "full_numbers",
        bFilter: false,
        language: {
            sEmptyTable:     "<b>符合条件的数据为空</b>",
            sInfo:           "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
            sInfoEmpty:      "显示第 0 至 0 项结果，共 0 项",
            sInfoFiltered:   "(filtered from _MAX_ total entries)",
            sInfoThousands:  ",",
            sLengthMenu:     "显示 _MENU_ 项",
            sLoadingRecords: "数据加载中，请稍后...",
            sProcessing:     "加载中...",
            sSearch:         "搜索:",
            sZeroRecords:    "未找到匹配的元素",
            errMode:function( settings, tn, msg) {
                console.log(msg)
            },
            oPaginate: {
                sFirst:      "首页",
                sLast:       "尾页",
                sNext:       "下页",
                sPrevious:   "上页"
            },
            oAria: {
                sSortAscending:  ": 以升序排列此列",
                sSortDescending: ": 以降序排列此列"
            }
        }
    });
}

function ajaxDataTableNoPage(ele,option){

    return ele.DataTable({
        "scrollX": true,
        "paging": false,
        "lengthChange": false,
        "searching": false,
        "ordering": false,
        "info": true,
        "bPaginate": true,
        "bServerSide" : true,
        "responsive": true,
        "bLengthChange": false, //改变每页显示数据数量
        "bProcessing": true,
        "sAjaxSource" : option.url,
        "columns": option.columns,
        "columnDefs": option.columnDefs,
        "fnServerParams": option.searchParams,
        "bJQueryUI" : true,
        pagingType: "full_numbers",
        bFilter: false,
        language: {
            sEmptyTable:     "<b>符合条件的数据为空</b>",
            sInfo:           "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
            sInfoEmpty:      "显示第 0 至 0 项结果，共 0 项",
            sInfoFiltered:   "(filtered from _MAX_ total entries)",
            sInfoThousands:  ",",
            sLengthMenu:     "显示 _MENU_ 项",
            sLoadingRecords: "数据加载中，请稍后...",
            sProcessing:     "加载中...",
            sSearch:         "搜索:",
            sZeroRecords:    "未找到匹配的元素",
            errMode:function( settings, tn, msg) {
                console.log(msg)
            }
        }
    });
}
//保留四位小数  >0
function fix4(obj){
    obj.value = obj.value.replace(/[^\d.]/g,""); //清除"数字"和"."以外的字符
    obj.value = obj.value.replace(/^\./g,""); //验证第一个字符是数字
    obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个, 清除多余的
    obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
    obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d\d\d).*$/,'$1$2.$3'); //只能输入四个小数
}
//保留两位小数  >0
function fix2(obj){
    obj.value = obj.value.replace(/[^\d.]/g,""); //清除"数字"和"."以外的字符
    obj.value = obj.value.replace(/^\./g,""); //验证第一个字符是数字
    obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个, 清除多余的
    obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
    obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3'); //只能输入两个小数
}
//保留整数  >0
function fix0(obj){
    obj.value = obj.value.replace(/[^\d.]/g,""); //清除"数字"和"."以外的字符
    obj.value = obj.value.replace(/^\./g,""); //验证第一个字符是数字
    obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个, 清除多余的
    obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
    obj.value = obj.value.replace(/^(\-)*(\d+)\.*$/,'$1$2'); //只能输入整数
}
function compare(key){
    //返回比较器函数
    return function(a,b){
        if(a[key]<b[key]){
            return -1;
        }else if(a[key]>b[key]){
            return 1;
        }else{
            return 0;
        }
    }
}
function getUrlParam() {
    var obj = {}
    var params = ''
    if(window.location.search){
        params = window.location.search.substr(1).split('&')
        params.forEach(function(item){
            var a = item.split('=')
            obj[a[0]] = a[1]
        })
    }
    return obj
}
function urlParam() {
    var params = window.location.pathname.split('/')
    return params[params.length-1]
}
//var baseUrl = "http://192.168.31.201:4061/backend";
var baseUrl = "/backend";
(function($){
    $.extend({
        baseAjax: function (url, data, type, success, error){
            return new Promise(function(resolve, reject){
                $.ajax({
                    url: baseUrl+url,
                    data:data,
                    type: type,
                    dataType:'json',
                    success:function(res){
                        if(res.code == 200){
                            success(res);
                            resolve(res);
                        }else{
                            reject(res);
                            if(res.message){
                                alert(res.message)
                            }else{
                                alert('请求失败')
                            }
                        }
                    },
                    error:function(res){
                        reject(res);
                        error(res)
                    }
                });
            })
        },
        postRequest: function(url, data, success){
            return $.baseAjax(url, data, "POST", success, function(res){console.log(res)});
        },
        getRequest: function(url, data, success){
            return $.baseAjax(url, data, "GET", success, function(res){console.log(res)});
        }
    });
})($);

(function($){
    $.extend({
        logout: function(success) {
            /*退出登录*/
            return $.getRequest("/admin/logout", {}, success);
        },
        role: function(success) {
            /*获取登录账号的角色*/
            return $.getRequest("/admin/roleId", {}, success);
        },
        customer:{
            saveArea: function(data, success) {
                /*保存客户的收货地址*/
                return $.postRequest("/customer/address/saveOrUpdate", data, success);
            }
        },
        product: {
            excel: function(success) {
                /*获取Excel数据*/
                return $.getRequest("/excel/open", {}, success);
            },
            saveExcel:function(excelJson, success){
                /*保存Excel数据*/
                return $.postRequest("/excel/save", {excelJson:excelJson}, success);
            },
            details: function(id, success) {
                /*获取产品详情*/
                return $.getRequest("/product/view/"+id, {}, success);
            },
            metalType: function(success) {
                /*获取产品分类*/
                return $.getRequest("/dictionary/metalRareType/product/metalType/metal_rare_type", {}, success);
            },
            pack: function(success) {
                /*获取包装规格*/
                return $.getRequest("/dictionary/metalRareType/product/metalType/product_pack", {}, success);
            },
            save: function(data, success) {
                /*保存产品*/
                return $.postRequest("/product/save", data, success);
            },
        },
        sale:{
            customerDetails: function(id, success) {
                /*获取客户详情*/
                return $.getRequest("/customer/details/"+id, {}, success);
            },
            customerSave: function(data,success) {
                /*保存对客户信息的更改*/
                return $.postRequest("/customer/save", data, success);
            },
            companys: function(success) {
                /*获取企业*/
                return $.getRequest("/company/getList", {}, success);
            },
            companySave: function(data, success) {
                /*保存企业*/
                return $.getRequest("/customer/save/company", data, success);
            },
            delBill: function(id, success) {
                /*删除发票*/
                return $.getRequest("/customer/delete/bill/"+id, {}, success);
            },
            orderDetails: function(orderNo, success) {
                /*获取订单详情*/
                return $.getRequest("/order/view/"+orderNo, {}, success);
            },
            orderSave: function(data, success) {
                /*保存订单*/
                return $.postRequest("/order/update", data, success);
            },
            payInformationSave: function(data, success) {
                /*预付款信息*/
                return $.postRequest("/order/payInformation/saveOrUpdate", data, success);
            },
            payRecordSave: function(data, success) {
                /*付款信息*/
                return $.postRequest("/order/payRecord/saveOrUpdate", data, success);
            },
            productPackDel: function(id, success) {
                /*删除包装规格*/
                return $.getRequest("/dictionary/productPack/delete/"+id, {}, success);
            },
            officialProduct: function(id, success) {
                /*官网产品详情*/
                return $.getRequest("/officialProduct/view/"+id, {}, success);
            },
            officialNews: function(id, success) {
                /*官网新闻详情*/
                return $.getRequest("/officialNews/view/"+id, {}, success);
            },
            officialProductSave: function(data, success) {
                /*官网产品*/
                return $.postRequest("/officialProduct/save", data, success);
            },
            officialNewsSave: function(data, success) {
                /*官网新闻*/
                return $.postRequest("/officialNews/save", data, success);
            }
        }
    });
})($)

var role;
var addBillNum = 0;
/*获取当前登录角色，隐藏相应角色不能看到的菜单*/
function getRole(){
    return $.role(function(res){
//        1：管理员     10：助理   20：销售
        role = res.data;
        if(role == 20){
            $('.saleHide').hide()
        }
        if(role == 10){
            $('.zhuliHide').hide()
        }
    })
}

/*退出登录*/
function logout(){
    return $.logout(function(res){
        window.location.pathname = '/backend/admin/login';
    })
}

/*选择图片，验证图片大小，获取图片url，将图片显示*/
function changeImg(e){
    var src, url = window.URL || window.webkitURL || window.mozURL, file = $('#uploaderInput')[0].files[0];
    if(file.size>500000){
        alert("请上传小于500kb的图片");
        return
    }
    if(url){
        src = url.createObjectURL(file);
    }else{
        src = e.target.result;
    }

    $('#uploaderInput').siblings().css({'margin':'10px 0','width':'300px','height':'150px','background':'url('+src+') no-repeat','background-size': 'contain'});

}

/*获取公司，并将数据放入下拉框*/
function getCompanys(){
    return $.sale.companys(function(res){
        $('#companyId').html('<option value="">----请选择----</option>');
        res.data.forEach(function(item){
            var a = '<option value="'+item.id+'">'+item.name+'</option>';
            $('#companyId').append(a);
        })
    })
}

/*获取客户详情，将数据展示在页面*/
function getCustomerDetails(id){
    return $.sale.customerDetails(id,function(res){
        var entity = res.data.entity,
            role = res.data.role,
            billings = res.data.billings;

        customerId = res.data.entity.id;
        addresses = res.data.addresses;

        $('#entityId').val(entity.id)
        $('#companyName').html(entity.companyName)
        $('#realName').html(entity.realName)
        $('#mobile').html(entity.mobile)
        $('#companyId').val(entity.companyId)
        role.forEach(function(item){
           $('input:checkbox[name="role"][value="'+item+'"]').attr('checked','true');
        })
        $('input[name="readPriceTime"][value="'+entity.readPriceTime+'"]').attr('checked','true');
        /*发票信息、收货地址只有客户管理界面有*/
        if(billings.length){
            billings.forEach(function(item, index){
                var a = '<div class="bill'+index+'">' +
                             '开票名称：<span>'+item.title+'</span> <br><br>' +
                             '纳税人识别号：'+item.tfn+' <br><br>' +
                             '开票地址：<span>'+item.reciveAddress+'</span> <br><br>' +
                             '开票电话：<span>'+item.reciveMobile+'</span> <br><br>' +
                             '寄票地址：<span>'+item.sendAddress+'</span> <br><br>' +
                             '<img src="/static/img/del.png" class="del" onclick="del('+item.id+','+index+')" />' +
                         '</div>'
                 $('.bill').append(a)
            })
        }else{
            /*客户管理查看详情界面，如果没有发票信息，则添加*/
            if(window.location.pathname.indexOf('/customer/view')>=0){
                addBill();
            }
        }

        if(addresses && addresses.length){
            addAreaNum = addresses.length;
            addresses.forEach(function(item, index){
                editArea[index] = {}
                editArea[index].provinceName = item.provinceName;
                editArea[index].cityName = item.cityName;
                editArea[index].address = [];
                editArea[index].address[0] = item.address.split('-')[0];
                editArea[index].address[1] = item.address.split('-')[1];

                var city = item.cityName || ''
                var a = '<tr class="area'+index+'">' +
                            '<td>'+item.receiveName+'</td>' +
                            '<td>'+item.receiveMobile+'</td>' +
                            '<td>'+item.provinceName+city+editArea[index].address[0]+editArea[index].address[1]+'</td>' +
                            '<td>' +
                                '<a href="javascript:void(0)" class="btn btn-xs btn-primary" onclick="editAreaFun('+index+')">编辑</a>' +
                            '</td>' +
                         '</tr>'
                 $('.area ').append(a)
            })

        }

   })
}

/*客户审核、客户管理编辑的提交*/
function customerSave(pathname){
    if(!$('#companyId').val()){ alert('请选择所属企业'); return }
    var data = {
        'entity.id':+$('#entityId').val(),
        'entity.companyId':+$('#companyId').val()
    }
    var roleId = [],readPriceTime = '';
    /*客户权限*/
    var obj = document.getElementsByName('role'); //选择所有name="'specifications'"的对象，返回数组
    //取到对象数组后，我们来循环检测它是不是被选中
    for(var i=0; i<obj.length; i++){
        if(obj[i].checked){
            roleId.push(obj[i].value)
        }
    }
    if(!roleId.length){ alert('请选择客户查看权限'); return }
    data['entity.roleId'] = roleId.join(',');
    /*采购紧密度*/
    var obj2 = document.getElementsByName('readPriceTime');
    for(var i=0; i<obj2.length; i++){
        if(obj2[i].checked){
            readPriceTime = obj2[i].value
        }
    }
    if(!readPriceTime){ alert('请选择采购紧密度'); return }
    data['entity.readPriceTime'] = readPriceTime;

    /*发票信息只有客户管理的编辑界面保存才有*/
    if(addBillNum){
        var billForm = [];
        for(var i=1;i<=addBillNum;i++){
            if(delBillNum.indexOf(i) == -1){
                var title = $('.addBill'+i+' .title').val(),
                    tfn = $('.addBill'+i+' .tfn').val(),
                    reciveAddress = $('.addBill'+i+' .reciveAddress').val(),
                    reciveMobile = $('.addBill'+i+' .reciveMobile').val(),
                    sendAddress = $('.addBill'+i+' .sendAddress').val()
                if(title && tfn && reciveAddress && reciveMobile && sendAddress){
                    billForm.push({
                        title:title,
                        tfn:tfn,
                        reciveAddress:reciveAddress,
                        reciveMobile:reciveMobile,
                        sendAddress:sendAddress,
                        customerId:+$('#entityId').val()
                    })
                }else{
                    alert('请完善发票信息')
                    return
                }
            }

        }
        data.billForm = JSON.stringify(billForm)
    }
    $.sale.customerSave(data,function(){
        window.location.pathname = pathname;
    })
}

/*添加企业*/
function saveCompany(){
    if(!$('#name').val()){ alert('请输入企业名称'); return }
    var data = {
        contactName:$('#realName').html(),
        contactMobile:$('#mobile').html(),
        name:$('#name').val(),
        remark:$('#remark').val() || undefined
    }
    $.sale.companySave(data, function(){
        var companyId = +$('#companyId').val()
        getCompanys();
        $('#companyId').val(companyId);
        $('#myModal').modal('hide')
    })
}



$(function(){
    getRole();
})
