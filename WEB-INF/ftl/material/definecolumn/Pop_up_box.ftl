<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript">
    var BasePath="${BasePath}";
    
</script>
<title>无标题文档</title>
<link href="${BasePath}/css/popupcss.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src='${BasePath}/js/jquery-1.7.2.min.js'></script>
<script language="javascript">
    function submitCustom(){
	    var hascheck=document.getElementsByName("hascheck");
	    var f=false;
	    for(var i=0;i<hascheck.length;i++){
	    	if(hascheck[i].value==2){
	    		f=true;
	    	}
	    }
	    if(f==false){
	    	alert('至少选择一项');
	    }else{
	        $.ajax({
	                cache: true,
	                type: "POST",
	                url:BasePath+"/material/definecolumn/saveCustom.kq",
	                data:$('#custom').serialize(),
	                async: false,
	                error: function(request) {
	                    window.location.reload();
	                },
	                success: function(data) {
	                    parent.window.location.reload();
	                }
	            });
         }
    }
    
    function selectt(cell){
        var s=$(cell).parent().children().siblings().first().val();
        if(s==1){
            $(cell).parent().children().siblings().first().val('2');
        }else{
            $(cell).parent().children().siblings().first().val('1');
        }
    }
    
    function selectAll(){  
        $("input:checkbox").attr("checked", true);
        $("input[name='hascheck']").val('2');
    }
    
    function removeAll(){  
        $("input:checkbox").removeAttr("checked");
        $("input[name='hascheck']").val('1');
    }
</script>
</head>
<body>
<form id="custom" name="custom">
    <div class="bao" style="width:800px; margin:0 auto; padding: 10px; float: left;">
    <input type="hidden"  name="tableType" <#if type?? && type=="1">value="1"<#elseif type?? && type=="2"> value="2"</#if> />
      <ul >
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if index_?? && index_=="1">value="2"<#else> value="1"</#if> />
          <input type="hidden" name="code" value="index_"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);"  <#if index_?? && index_=="1"> checked="checked"</#if>/>
          <label >索引</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if itemName?? && itemName=="1">value="2"<#else> value="1"</#if> />
          <input type="hidden" name="code" value="itemName"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if itemName?? && itemName=="1"> checked="checked"</#if>  />
          <label >产品</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if cegBuyer?? && cegBuyer=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="cegBuyer"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);"  <#if cegBuyer?? && cegBuyer=="1"> checked="checked"</#if>  />
          <label >CEG Buyer</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if supplierCode?? && supplierCode=="1">value="2"<#else> value="1"</#if>   />
          <input type="hidden" name="code" value="supplierCode"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if supplierCode?? && supplierCode=="1"> checked="checked"</#if> />
          <label >Supplier Code</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if supplierName?? && supplierName=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="supplierName"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if supplierName?? && supplierName=="1"> checked="checked"</#if>/>
          <label >Supplier Name</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if poCreateDate?? && poCreateDate=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="poCreateDate"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if poCreateDate?? && poCreateDate=="1"> checked="checked"</#if> <#if poCreateDate?? && poCreateDate=="1"> checked="checked"</#if>/>
          <label >PO Create Date</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if contractCode?? && contractCode=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="contractCode"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if contractCode?? && contractCode=="1"> checked="checked"</#if>/>
          <label >Contract Code</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if planner?? && planner=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="planner"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if planner?? && planner=="1"> checked="checked"</#if>/>
          <label >计划员</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if classCode?? && classCode=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="classCode"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if classCode?? && classCode=="1"> checked="checked"</#if>/>
          <label >大类编码</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if year?? && year=="1">value="2"<#else> value="1"</#if> />
          <input type="hidden" name="code" value="year"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);"  <#if year?? && year=="1"> checked="checked"</#if>/>
          <label >年月</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if itemCode?? && itemCode=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="itemCode"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if itemCode?? && itemCode=="1"> checked="checked"</#if>/>
          <label >Item Code</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if itemDescription?? && itemDescription=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="itemDescription"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if itemDescription?? && itemDescription=="1"> checked="checked"</#if>/>
          <label >Item Description</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if lineNum?? && lineNum=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="lineNum"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if lineNum?? && lineNum=="1"> checked="checked"</#if>/>
          <label >Line Num</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if shipmentNum?? && shipmentNum=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="shipmentNum"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if shipmentNum?? && shipmentNum=="1"> checked="checked"</#if>/>
          <label >Shipment Num</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if quantityPo?? && quantityPo=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="quantityPo"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if quantityPo?? && quantityPo=="1"> checked="checked"</#if>/>
          <label >Quantity PO</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if quantityUnreceived?? && quantityUnreceived=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="quantityUnreceived"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if quantityUnreceived?? && quantityUnreceived=="1"> checked="checked"</#if>/>
          <label>Quantity Unreceived</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if notFinishedNum?? && notFinishedNum=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="notFinishedNum"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if notFinishedNum?? && notFinishedNum=="1"> checked="checked"</#if>/>
          <label >半成品</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if finishedNum?? && finishedNum=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="finishedNum"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if finishedNum?? && finishedNum=="1"> checked="checked"</#if>/>
          <label >成品</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if sumNum?? && sumNum=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="sumNum"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if sumNum?? && sumNum=="1"> checked="checked"</#if>/>
          <label >数量汇总</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if outputTime?? && outputTime=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="outputTime"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if outputTime?? && outputTime=="1"> checked="checked"</#if>/>
          <label >产出时间</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if dullCycle?? && dullCycle=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="dullCycle"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if dullCycle?? && dullCycle=="1"> checked="checked"</#if>/>
          <label >呆滞周期</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if stockAge?? && stockAge=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="stockAge"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if stockAge?? && stockAge=="1"> checked="checked"</#if>/>
          <label >货龄</label>
        </li>
        
        
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if poLineRemark?? && poLineRemark=="1">value="2"<#else> value="1"</#if>   />
          <input type="hidden" name="code" value="poLineRemark"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if poLineRemark?? && poLineRemark=="1"> checked="checked"</#if> />
          <label >Po行备注</label>
        </li>
        
        
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if canConsumption?? && canConsumption=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="canConsumption"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if canConsumption?? && canConsumption=="1"> checked="checked"</#if>/>
          <label >是否可消耗</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if consumptionPlan?? && consumptionPlan=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="consumptionPlan"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if consumptionPlan?? && consumptionPlan=="1"> checked="checked"</#if>/>
          <label >可消耗计划</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if stockReason?? && stockReason=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="stockReason"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if stockReason?? && stockReason=="1"> checked="checked"</#if>/>
          <label >备货原因</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if dullProject?? && dullProject=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="dullProject"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if dullProject?? && dullProject=="1"> checked="checked"</#if>/>
          <label >产生呆滞的项目</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if remark?? && remark=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="remark"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if remark?? && remark=="1"> checked="checked"</#if>/>
          <label >备注</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if handlerOption?? && handlerOption=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="handlerOption"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if handlerOption?? && handlerOption=="1"> checked="checked"</#if>/>
          <label >评审处理意见</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if handler?? && handler=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="handler"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if handler?? && handler=="1"> checked="checked"</#if>/>
          <label >对应责任人</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if currentStatus?? && currentStatus=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="currentStatus"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if currentStatus?? && currentStatus=="1"> checked="checked"</#if>/>
          <label >当前状态</label>
        </li>
        <li class="fuxuan">
          <input type="hidden"  name="hascheck" <#if nextHandler?? && nextHandler=="1">value="2"<#else> value="1"</#if>/>
          <input type="hidden" name="code" value="nextHandler"/>
          <input type="checkbox" name="cbox" onclick="javascript:selectt(this);" <#if nextHandler?? && nextHandler=="1"> checked="checked"</#if>/>
          <label >下一步处理责任人</label>
        </li>
      </ul>
 
   
  </div>
   <div class="button">
        <input type="button" onclick="javascript:selectAll();" value="全选" />
        <input type="button" onclick="javascript:removeAll();" value="全不选" />
        <input type="submit" onclick="javascript:submitCustom();" value="确认"></input>
    </div>
</form>
</body>
</html>
