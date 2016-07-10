var count = 1;  
var rcount = 0;  
/**
 * 生成多附件上传框
 */  
function createInput(parentId){  
    count++; 
    rcount++;
    var str = '<div name="div" ><font style="font-size:12px;">附件</font>'+  
    '   '+ '<input type="file" contentEditable="false" id="uploads' + count + '' +  
    '" name="uploads'+ count +'" value="" style="width: 220px"/><input type="button"  value="删除" onclick="removeInput(this)" />'+'</div>';  
    document.getElementById(parentId).insertAdjacentHTML("beforeEnd",str);  
  // $("#btnsub").attr('disabled','');
} 

function removeconfid(tid,obj)
{
$('#okbtn').on('click', function(e) {
		window.location.href = "removeProductType.kq?id=" + id;
	});
	$('#deleteModal').modal({
		keyboard : true
	});

}
/**
 * 删除消息
 */
function removeMessage(id,obj) {
	
	$('#okbtn').on('click', function (e) {
		removeconfid(id,obj)
		});
	$('#deleteModal').modal({
		  keyboard: true
	});
	
}



/**
 * 删除多附件删除框
 */  
function removeInput(obj){  
rcount--;
if(rcount<1)
{
$("#btnsub").attr('disabled','disabled');
}
  $(obj.parentNode ).remove();
}  
function addOldFile(data){  
    var str = '<div name="div' + data.name + '" ><a href="#" style="text-decoration:none;font-size:12px;color:red;" onclick="removeOldFile(event,' + data.id + ')">删除</a>'+  
    '   ' + data.name +   
    '</div>';  
    document.getElementById('oldImg').innerHTML += str;  
}  
  
function removeOldFile(evt, id){  
    // 前端隐藏域，用来确定哪些file被删除，这里需要前端有个隐藏域
    $("#imgIds").val($("#imgIds").val()=="" ? id :($("#imgIds").val() + "," + id));  
    var el = evt.target == null ? evt.srcElement : evt.target;  
    var div = el.parentNode;  
    var cont = document.getElementById('oldImg');      
    if(cont.removeChild(div) == null){  
        return false;  
    }  
    return true;  
}  

function subcheck(type)
{
	if(type != '1')
		{
var checkvalue=$("#imgpath").attr("value");
	if(checkvalue==""||!checkvalue){
		alert("请上传图片！");
	  return false;
	  }else
	  {	
	  $("#addform").submit();		
	  }}
	else
		{
		$("#addform").submit();		
		}
}

//单个图片上传
function ajaxFileUploadlogo(id,w,h){  
var arrId = [];
arrId[0]=id;
$.ajaxFileUpload({  
    url:BasePath+'/up/upload.kq',  
    secureuri:false,  
    fileElementId: arrId,  // 这里不在是以前的id了，要写成数组的形式哦！
    dataType: 'json',  
    data: {  
    	fileName:'.jpg',
    	fileType:'jpg',
    	w:w,
    	h:h                 // 需要传输的数据
            },  
    success: function (data){ 
	$("#logoimg").attr("src",data[1]);
	$("#logopath").attr("value",data[1]);
    },  
    error: function(data){  
alert("Error:"+data);
    }  
});  
}  

//多个图片上传
function ajaxFileUploadImgs(h,w){  
    
    // 获取file的全部id
var uplist = $("input[name^=uploads]"); 
var arrId = [];
for (var i=0; i< uplist.length; i++){
    if(uplist[i].value){  
        arrId[i] = uplist[i].id;  
    }  
    else
    {
    alert("请选择图片！");
    return false;
    }
    }    
$.ajaxFileUpload({  
    url:BasePath+'/up/upload.kq',  
    secureuri:false,  
    fileElementId: arrId,  // 这里不在是以前的id了，要写成数组的形式哦！
    dataType: 'json',  
    data: {  fileName:'.jpg',fileType:'jpg',h:h,w:w
                 // 需要传输的数据
            },  
    success: function (data){ 
    for(var i=1; i<= uplist.length; i++)
    {
    $('#imgul').append('<li id="imgli" style="float: left; width: 20%;"><img style="width:100%;"  src="'+BasePath+data[i]+'"  class="imagestyle"/></li>'); 
    }
    $("#btnsub").hide();
    $("#btnadd").hide();
    $("#divline").hide();
    $("#more").hide();
    $("#imgpath").attr("value",data[1]);
    $("#fristimgw").attr("value",data["1w"]);
    $("#fristimgh").attr("value",data["1h"]);
    $("#imgcount").attr("value",uplist.length);

    },  
    error: function(data){  
alert("Error:"+data);
    }  
});  
}  

function changetoupdate()
{
		$("#mallname").removeAttr("disabled");
		$("#footerword").removeAttr("disabled");
		$("#outtimeset").removeAttr("disabled");
		$("#footword").removeAttr("disabled");		
		$("#cstel").removeAttr("disabled");
		$("#butc").css("display","none");	
		$("#buts").css("display","block");
		alert("已切换到编辑模式，现在可以修改信息了！");
}

function changskin(skinid,obj)
{
	$("#skinid").attr("value",skinid);	
	$("#imgul").find("li").removeClass();
	obj.className='cur';
}