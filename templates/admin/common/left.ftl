<#macro leftMenu pageName>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar" style="height: auto;">
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <li class="treeview saleHide <#if pageName=='sales'>active</#if>">
                <a href="#">
                    <i class="fa fa-support"></i> <span>销售管理</span> <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li class="active"><a href="/backend/order/list"><i class="fa fa-bookmark-o"></i>订单列表</a></li>
                    <li class="active"><a href="/backend/customer/audit/list"><i class="fa fa-bookmark-o"></i>客户审核</a></li>
                    <li class="active"><a href="/backend/customer/list"><i class="fa fa-bookmark-o"></i>客户管理</a></li>
                    <!--<li class="active"><a href="/backend/customer/saleStatisticsList"><i class="fa fa-bookmark-o"></i>客户销售统计</a></li>
                    <li class="active"><a href="/backend/product/saleStatisticsList"><i class="fa fa-bookmark-o"></i>产品销售统计</a></li>-->
                </ul>
            </li>
            <li class="treeview <#if pageName=='product'>active</#if>">
                <a href="#">
                    <i class="fa fa-support"></i> <span>产品管理</span> <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li class="active saleHide"><a href="/backend/product/list"><i class="fa fa-users"></i>产品维护</a></li>
                    <li class="active zhuliHide"><a href="/backend/product/price"><i class="fa fa-users"></i>销售价格维护</a></li>
                </ul>
            </li>

            <li class="treeview saleHide <#if pageName=='baseData'>active</#if>">
                <a href="#">
                    <i class="fa fa-cloud"></i> <span>基础数据管理</span> <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li class="active"><a href="/backend/admin/list"><i class="fa fa-tag"></i>账户管理</a></li>
                    <li class="active"><a href="/backend/company/list"><i class="fa fa-users"></i>企业管理</a></li>
                    <li class="active"><a href="/backend/dictionary/metalRareType/list"><i class="fa fa-users"></i>产品分类维护</a></li>
                    <li class="active"><a href="/backend/dictionary/productPack/list"><i class="fa fa-users"></i>产品包装规格</a></li>
                    <li class="active"><a href="/backend/payment/list"><i class="fa fa-users"></i>付款方式</a></li>
                    <li class="active"><a href="/backend/officialProduct/list"><i class="fa fa-users"></i>官网产品维护</a></li>
                    <li class="active"><a href="/backend/officialNews/list"><i class="fa fa-users"></i>官网新闻维护</a></li>
                </ul>
            </li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
</#macro>