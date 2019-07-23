function showLoading() {
    $("#loading").css("position", "relative");
    var width = $("#loading").width() + 2, height = $("#loading").height();
    $("<span id='delaySpan'><span id='icon' style='display:inline-block'></span>Loading...</span>")
            .css("left", width / 2 - 70)
            .css("top", height / 2 - 30)
            .css("position", "absolute")
            .css("color", "#4f4f4f")
            .css("background", "#ffffff")
            .css("border", "1px solid #a8a8a8")
            .css("border-radius", "3px")
            .css("-webkit-border-radius", "3px")
            .css("box-shadow", "0 0 10px rgba(0, 0, 0, 0.25")
            .css("font-family", "Arial, sans-serif")
            .css("font-size", "20px")
            .css("padding", "0.4em")
            .insertAfter("#ss");
    $("<div id='delayDiv'></div>")
            .css("background", "#2D5972")
            .css("opacity", 0.3)
            .css("position", "absolute")
            .css("top", 0)
            .css("left", 0)
            .css("width", width)
            .css("height", height)
            .insertAfter("#ss");
}

function hideLoading() {
    $("#delayDiv").remove();
    $("#delaySpan").remove();
}

function initSpread(spread){
//    将接送数据放到表格上
    return $.product.excel(function(res){
        spread.fromJSON(JSON.parse(res.data));
        spread.options.allowContextMenu = false;
        if(role == 10){
            $(".delActiveSheet").hide();
            $(".export").hide();
            for(var i=0;i<=8;i++){
                spread.getSheet(i).visible(false);
            }
            spread.getSheetFromName('录入当日参数页').visible(true);
        }else if(role == 20){
            $(".savePriceData").hide();
            $(".delActiveSheet").hide();
            $(".export").hide();
            for(var i=0;i<=8;i++){
                spread.getSheet(i).visible(false);
            }
            spread.getSheetFromName('订制产品').visible(true);
            spread.getSheetFromName('订制产品').options.isProtected = true;
            spread.getSheetFromName('日销产品').visible(true);
            spread.getSheetFromName('日销产品').options.isProtected = true;
        }
        hideLoading();
    })
}


function saveData(spread, excelIo){
    $(".savePriceData").click(function(){
        priceData = JSON.stringify(spread.toJSON());
        $.product.saveExcel(priceData,function(res){
            alert('保存成功')
        })
    })
    $(".delActiveSheet").click(function(){
        if(confirm("确认删除当前表单？")){
            var activeIndex = spread.getActiveSheetIndex();
            if (activeIndex >= 0) {
                spread.removeSheet(activeIndex);
            }
        }
    })
    $('.export').click(function(){
        var json = spread.toJSON();
        excelIo.save(json, function (blob) {
            //do whatever you want with blob
            //such as you can save it
            saveAs(blob, '销售价格维护.xlsx');
        }, function (e) {
            //process error
            console.log(e);
        });
    })

}

function openWebSocket(spread){
    return new Promise(function(resolve, reject){
        if (window.WebSocket) {
            var ws = new WebSocket('ws://www.pgmchina.com/websocket');
            ws.onopen = function () {
                console.log("WebSocket已打开");
            };
            ws.onmessage = function (res) {
                resolve(res);
                var data = JSON.parse(res.data)
                var sheet1 = spread.getSheet(1)
                if(data.platinum){
                    sheet1.setValue(3,4,data.platinum);
                }else{
                    sheet1.setValue(3,5,-1);
                }
                if(data.gold){
                    sheet1.setValue(13,4,data.gold);
                }else{
                    sheet1.setValue(13,5,-1);
                }
                if(data.XPD){
                    sheet1.setValue(22,4,data.XPD);
                }
                if(data.Rhodium){
                    sheet1.setValue(30,4,data.Rhodium);
                }else{
                    sheet1.setValue(30,5,-1);
                }
                if(data.Iridium){
                    sheet1.setValue(36,4,data.Iridium);
                }else{
                    sheet1.setValue(36,5,-1);
                }
                if(data.Ruthenium){
                    sheet1.setValue(42,4,data.Ruthenium);
                }else{
                    sheet1.setValue(42,5,-1);
                }

            }
            //连接发生错误的回调方法
            ws.onerror = function (event) {
                console.log(event)
                reject(event);
            }
        }else{
            alert("浏览器不支持WebSocket");
        }
    })
}

$(function () {
    var priceData;
    showLoading();
    GC.Spread.Sheets.LicenseKey = "www.pgmchina.com,355873627381961#A03MJMzN8UTNzIiOiQWSiwSflNHbhZmOiI7ckJye0ICbuFkI1pjIEJCLi4TPnJnWv3ERydUSyRkQ49mU4g5NB56RLJFayNneMl5LONnNkhnatFHTVRka6RVYCpWdqdkZaFjQ8VzQSJ4ZUVESwU7VBBTcrE7bEZ4bTx6Ti3GbHpHNVRlI0IyUiwyN8gjM8QTN6MTM0IicfJye35XX3JyMiZzZiojIDJCLiETMuYHITpEIkFWZyB7UiojIOJyebpjIkJHUiwiI6ADO4MDMgcDMyEzNxAjMiojI4J7QiwiIt36YuEmbph6YtdGcuc7d7JiOiMXbEJCLig1jlzahlDZmpnInmnIvvfbtmrIukjIvvDoimH9pnz9unHZvnPZgpb8hlLiOiEmTDJCLiEjN9EZOdc";
    var spread = new GC.Spread.Sheets.Workbook($("#ss")[0], { newTabVisible: false });
    var excelIo = new GC.Spread.Excel.IO();

    getRole().then(function(){
        return initSpread(spread);
    }).then(function(){
        return openWebSocket(spread);
    });

    saveData(spread, excelIo);

});