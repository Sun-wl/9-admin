<html>
<head>
    <title>详细信息</title>
    <link href="${request.contextPath}/static/common.css" rel="stylesheet" type="text/css"/>
    <#include "../common/resource.ftl">
    <style>
        .del{
            width: 20px;
            margin-top:8px;
            position: absolute;
            top: 0;
            right: -50px;
        }
        .bill{
            padding-top:7px;
        }
        .bill > div {
            width:300px;
            padding-bottom: 15px;
            border-bottom:1px dashed #ccc;
            position:relative;
            padding-top:15px;
        }
        .bill > div:first-child{
            padding-top:0;
        }
        .form-control.title, .form-control.tfn, .form-control.reciveAddress, .form-control.reciveMobile, .form-control.sendAddress{
            width:180px;
            display:inline-block;
            margin-left: 27px;
        }
        .form-control.tfn{
            margin-left:0;
        }
        .bill > div span{
            margin-left: 27px;
        }
        .tree{
            height: 250px;
            overflow-y: auto;
            position: absolute;
            width: 100%;
            display: none;
            top: 45px;
            z-index:1000;
        }
        .form-control[readonly].bg-f{
            background:#fff;
        }
        .address{
            width: 48%;
            float: left;
            margin: 0 1%;
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
                详细信息
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 客户管理</a></li>
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
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">发票信息</label>
                                    <div class="col-sm-4">
                                        <label class="bill">

                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2"></label>
                                    <div class="col-sm-4">
                                        <a href="javascript:void(0)" class="btn btn-primary" onclick="addBill()"> + 添加发票</a>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">收货信息</label>
                                    <div class="col-sm-4">
                                        <a href="javascript:void(0)" class="btn btn-primary" onclick="addArea()"> + 添加收货信息</a>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2"></label>
                                    <div class="col-sm-8">
                                           <table class="table table-bordered">
                                               <thead>
                                               <tr>
                                                   <th>收货人</th>
                                                   <th>联系电话</th>
                                                   <th>收货地址</th>
                                                   <th>操作</th>
                                               </tr>
                                               </thead>
                                               <tbody class="area">

                                               </tbody>
                                               <tfoot>
                                               </tfoot>
                                           </table>
                                    </div>
                                </div>
                            </div><!-- /.box-body -->

                            <div class="box-footer">
                                <div class="form-group p-t-15" style="border-top:1px solid #ccc">
                                    <div class="col-sm-2 text-right">
                                        <a href="/backend/customer/list" class="btn btn-danger">取消</a>
                                    </div>
                                    <div class="col-sm-3 text-center">
                                        <a href="javascript:void(0)" class="btn btn-success" onclick="customerSave('/backend/customer/list')">确认</a>
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
                                <button class="btn btn-default" data-dismiss="modal">取消</button>
                                <button class="btn btn-primary" onclick="saveCompany()">确定</button>
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
var params = getUrlParam();
var addresses = [],             //所有收货地址
    tree = [],                  //省市区3级
    customerId = undefined,
    delBillNum = [],            //删除的发票的index
    currentEditArea = undefined,//当前编辑的地址index
    editArea = [],              //编辑地址的内容：[{provinceName:'省',cityName:'市',address:['区','详细地址']}]
    addAreaNum = 0;             //一共多少条地址


/*在高德地图上获取省市区3级，将数据添加到tree*/
function getTree(){
    AMap.service('AMap.DistrictSearch', function () {//回调函数
      //实例化DistrictSearch
      var districtSearch = new AMap.DistrictSearch({
        level: 'country',
        subdistrict: 3
      });
      districtSearch.search('中国', function (status, result) {
        var provinces = result.districtList[0].districtList;
        provinces.forEach(function (province, index) {
          tree.push({
            text: province.name,
            nodes: [],
            state:{
                expanded:false
            }
          })
          if (province.districtList && province.districtList.length) {
            province.districtList.forEach(function (city, i) {
              tree[index].nodes.push({
                text: city.name,
                nodes: []
              })
              if (city.districtList && city.districtList.length) {
                city.districtList.forEach(function (item, j) {
                  tree[index].nodes[i].nodes.push({
                    text: item.name
                  })
                })
              } else {
                tree[index].nodes[i].nodes = undefined
              }
            })
          } else {
            tree[index].nodes = undefined
          }
        })
      })
    })
}

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~发票~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
/*点击添加发票，向后添加输入框*/
function addBill(){
    addBillNum++;
    var a = '<div class="addBill'+addBillNum+'">'+
                 '开票名称：<input type="text" class="form-control title"> <br><br>'+
                 '纳税人识别号：<input type="text" class="form-control tfn"> <br><br>'+
                 '开票地址：<input type="text" class="form-control reciveAddress"> <br><br>'+
                 '开票电话：<input type="text" class="form-control reciveMobile"> <br><br>'+
                 '寄票地址：<input type="text" class="form-control sendAddress"> <br><br>'+
                 '<img src="/static/img/del.png" class="del" onclick="delAdd('+addBillNum+')" />'+
             '</div>'
    $('.bill').append(a)
}

/*删除发票信息*/
function del(id, index){
    if(confirm('是否删除发票信息？')){
        $.sale.delBill(id, function(res){
            $('.bill'+index).remove();
        })
    }
}

/*删除添加发票的输入框，并将删除的index加入delBillNum*/
function delAdd(index){
    if(confirm('是否删除发票信息？')){
        $('.addBill'+index).remove();
        delBillNum.push(index)
    }
}
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~发票~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/


/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~收货地址~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
/*点击添加收货信息，表格添加一列*/
function addArea(){
    addAreaNum++;
    var a =  '<tr class="area'+addAreaNum+'">'+
               '<td><input type="text" class="form-control name"><input type="hidden" class="entityId"></td>'+
               '<td><input type="number" class="form-control mobile"></td>'+
               '<td style="position:relative;">'+
                 '<input type="text" class="form-control address area bg-f" onFocus="showArea('+addAreaNum+')" readOnly>'+
                 '<input type="text" class="form-control address addrDetail">'+
                 '<div class="tree"></div>'+
               '</td>'+
               '<td>'+
                 '<a href="javascript:void(0)" class="btn btn-xs btn-success" onclick="saveAreaFun('+addAreaNum+')">保存</a>'+
               '</td>'+
             '</tr>';
    $('.area').append(a)
    /*将当前编辑列的editArea初始化为{}，属性address初始化为[],防止后续报错*/
    editArea[addAreaNum] = {address:[]}
}


/*编辑地址，点击编辑，将数据展示变为文本输入*/
function editAreaFun(index){
    var item = addresses[index];
    var city = item.cityName || ''
    var addr = item.address.split('-')
    var a = '<td><input type="text" class="form-control name" value="'+item.receiveName+'"><input type="hidden" class="entityId" value="'+item.id+'"></td>'+
           '<td><input type="number" class="form-control mobile" value="'+item.receiveMobile+'"></td>'+
           '<td style="position:relative;">'+
             '<input type="text" class="form-control address area bg-f" onFocus="showArea('+index+')" value="'+item.provinceName+city+addr[0]+'" readOnly>'+
             '<input type="text" class="form-control address addrDetail" value="'+addr[1]+'">'+
             '<div class="tree"></div>'+
           '</td>'+
           '<td>'+
             '<a href="javascript:void(0)" class="btn btn-xs btn-success" onclick="saveAreaFun('+index+')">保存</a>'+
           '</td>'
    $('.area'+index).html(a)
}

/*保存地址*/
function saveAreaFun(index){
    var data = {
        id:+$('.area'+index+' .entityId').val() || undefined,
        receiveName:$('.area'+index+' .name').val(),
        receiveMobile:$('.area'+index+' .mobile').val(),
        provinceName:editArea[index].provinceName,
        cityName:editArea[index].cityName,
        address:editArea[index].address[0] ? editArea[index].address[0] + '-' + $('.area'+index+' .addrDetail').val() : '-' + $('.area'+index+' .addrDetail').val(),
        isDefault:+$('.area'+index+' .entityId').val() ? addresses[index].isDefault : false,
        customerId: customerId
    }
    if(!data.receiveName){alert('请输入收货人姓名'); return}
    if(!data.receiveMobile){alert('请输入联系电话'); return}
    if(!/^1[345678]\d{9}$/.test(data.receiveMobile)){alert('请输入正确的联系电话'); return}
    if(!data.provinceName){alert('请选择收货地址'); return}
    if(!$('.area'+index+' .addrDetail').val()){alert('请输入详细的收货地址'); return}

    $.customer.saveArea(data,function(res){
        window.location.reload();
    })
}

/*选择地址文本框获得焦点后，隐藏其余列的地址，展示当前列的省市区*/
function showArea(index){
    $('.tree').hide();
    $('.area'+index+' .tree').show();
    /*将currentEditArea设为当前编辑的index，并初始化当前编辑的地址editArea[currentEditArea]为{}，防止后续报错*/
    currentEditArea = index;
    if(!editArea[currentEditArea]){
        editArea[currentEditArea] = {}
    }
    /*将省市区3级数据放入treeview级联选择器*/
    $('.area'+currentEditArea+' .tree').treeview({
        data: tree,
        onNodeExpanded: function(event, data) {
            //展开时的回调
            //如果当前展开的项有parentId且为number类型，则展开的项为当前编辑的cityName，反之为provinceName
            if(typeof data.parentId == 'number'){
                editArea[currentEditArea].cityName = data.text;
            }else{
                editArea[currentEditArea].provinceName = data.text;
            }
        },
        onNodeSelected: function(event, data) {
            //选中时的回调
            //初始化当前编辑的地址的address为[]，防止后续出错
            editArea[currentEditArea].address = [];
            tree.forEach(function(p, index){
                //遍历省份
                //如果省份有子集，遍历子集的城市
                //如果省份没有子集，且选中的项 == 当前省份，则当前选中项为provinceName，且cityName，address[0]均为'',隐藏级联选择器
                if(p.nodes && p.nodes.length){
                    p.nodes.forEach(function(c, i){
                        //遍历城市
                        //如果城市有子集，遍历子集的区域
                        //如果城市没有子集，且选中的项 == 当前城市，则当前选中项为cityName，且address[0]为'',隐藏级联选择器
                        if(c.nodes && c.nodes.length){
                            c.nodes.forEach(function(a, j){
                                //遍历区域
                                //如果选中的项 == 当前区域，则当前选中项为address[0],隐藏级联选择器
                                if(a.text == data.text){
                                    editArea[currentEditArea].address[0]=a.text;
                                    $('.area'+currentEditArea+' .tree').hide();
                                }
                            })
                        }else{
                            if(c.text == data.text){
                                editArea[currentEditArea].cityName=c.text;
                                editArea[currentEditArea].address[0]='';
                                $('.area'+currentEditArea+' .tree').hide();
                            }
                        }
                    })
                }else{
                    if(p.text == data.text){
                        editArea[currentEditArea].provinceName=p.text;
                        editArea[currentEditArea].cityName='';
                        editArea[currentEditArea].address[0]='';
                        $('.area'+currentEditArea+' .tree').hide();
                    }
                }
            })
            //将级联选择器选择的地址展示在文本框
            var a = '';
            a += editArea[currentEditArea].provinceName || '';
            a += editArea[currentEditArea].cityName || '';
            a += editArea[currentEditArea].address[0] || '';
            $('.area'+currentEditArea+' .area').val(a);
        }
    });
}
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~收货地址~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

getTree();
getCompanys().then(function(){
    return getCustomerDetails(params.id);
})
</script>
</html>
