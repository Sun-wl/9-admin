<html>
<head>
    <title>销售价格维护</title>
    <meta name="spreadjs culture" content="zh-cn" />
    <link href="${request.contextPath}/static/common.css" rel="stylesheet" type="text/css"/>
    <#include "../common/resource.ftl">
    <!-- Excel表格 -->
    <link href="${request.contextPath}/static/spread/css/gc.spread.sheets.excel2013white.11.0.0.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${request.contextPath}/static/spread/scripts/gc.spread.sheets.all.11.0.0.min.js"></script>
    <script type="text/javascript" src="${request.contextPath}/static/spread/scripts/plugins/gc.spread.sheets.print.11.0.0.min.js"></script>
    <script type="text/javascript" src="${request.contextPath}/static/spread/scripts/interop/gc.spread.excelio.11.0.0.min.js"></script>
    <script type="text/javascript" src="${request.contextPath}/static/spread/scripts/resources/zh/gc.spread.sheets.resources.zh.11.0.0.min.js"></script>
    <script type="text/javascript" src="${request.contextPath}/static/spread/scripts/license.js"></script>
    <script type="text/javascript" src="${request.contextPath}/static/FileSaver.js"></script>
    <script type="text/javascript" src="${request.contextPath}/static/html2canvas.min.js"></script>
    <script src="${request.contextPath}/static/Site.js"></script>
    <style>
        #loading{
            width；100%;
            height:900px;
        }
    </style>
</head>
<body class="sidebar-mini wysihtml5-supported skin-blue">
<div class="wrapper">
<#include "../common/top.ftl">
<#include "../common/left.ftl">
<@leftMenu pageName="product"/>
    <div class="content-wrapper" style="min-height: 916px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <i class="fa  fa-search"></i>销售价格维护
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 产品管理</a></li>
                <li class="active">销售价格维护</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-info">
                        <div class="box-header with-border form-horizontal">
                            <input class="savePriceData btn btn-success" type="button" value="保存当前数据">
                            <input class="export btn btn-success m-l-10" type="button" value="下载Excel">
                            <input class="delActiveSheet btn btn-danger pull-right" type="button" value="删除当前表单">
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <div id="loading">
                                <div id="ss" class="spreadDiv"></div>
                            </div>
                        </div><!-- /.box-body -->
                    </div><!-- /.box -->
                </div><!-- /.col -->
            </div><!-- /.row -->
        </section>
    </div>
<#include "../common/footer.ftl">
</div>
</body>
</html>

