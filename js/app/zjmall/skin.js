var currentindex=0;
var skin_obj={
	
		file_upload:function(file_input_obj, filepath_input_obj, img_detail_obj, example_obj,size){
		var multi=(typeof(arguments[5])=='undefined')?false:arguments[5];
		var queueSizeLimit=(typeof(arguments[6])=='undefined')?5:arguments[6];
		var callback=arguments[7];
		file_input_obj.omFileUpload({
			action:BasePath+'/uploadImageFile.kq',
			actionData:{
				do_action:'msgFileUpload',
				bid:bid,
				size:size
			},
			fileExt:'*.jpg;*.png;*.gif;*.jpeg;*.bmp',
			fileDesc:'Image Files',
			sizeLimit:200*1024,
			onError:function(ID, fileObj, errorObj, event){
				if(errorObj.type=='File Size'){
					alert('图片大小请控制在200KB！');
				}
			},
			autoUpload:true,
			multi:multi,
			queueSizeLimit:queueSizeLimit,
			swf:BasePath+'/js/upload/fileupload.swf?r='+Math.random(),
			method:'post',
			onComplete:function(ID, fileObj, response, data, event){
				var jsonData=eval('('+response+')');
				if(jsonData.status==1){
					if(!multi){
						filepath_input_obj.val(jsonData.imgpath);
						img_detail_obj.html(global_obj.img_link(jsonData.imgpath));
						example_obj.attr("src",BasePath+jsonData.imgpath);
					}else{
						callback(jsonData.imgpath);
					}
				}else{
					alert('上传失败请稍后再试！');
				};
			}
		});
	},
		material_one_init:function(){
			var $chkarry=$("div[name^='MsgImgDetail']");
			$chkarry.each(function(index){
				var i=$chkarry.eq(index).attr('countid');
			skin_obj.file_upload($('#MsgFileUpload'+i), $('#home_form input[name=setkey'+i+']'), $('#MsgImgDetail'+i),$('#setimg'+i));
			$('#MsgImgDetail'+i).html(global_obj.img_link($('#home_form input[name=setkey'+i+']').val()));
			
			});
			$("img[name='selecttarget']").click(function(){
				$("img[name='selecttarget']").removeClass();
				this.className='selectimg';
				currentindex=this.getAttribute('urlindex')
				$("div[name^='div']").css("display","none");
				$("#div"+currentindex).css("display","block");
			});
	}
}

function setvaluetotraget(obj,tagid)
{
	$("#settxt"+tagid)[0].textContent=obj.value;
	$('#setkey'+currentindex).attr("value",obj.value);
}

function navsetsave()
{

	$.ajax({
			'type' : 'post',
			'data' : ({
				'skinid' : skinid,
				'navindex':$('#navindex'+currentindex).val(),
				'id':$('#navid'+currentindex).val(),
				'setkey':$('#setkey'+currentindex).val(),
				'setvalue':$('#setvalue'+currentindex).val()
			}),
			'url' : ('savenav.kq'),
			success : function(str) {
				if(!str) return;
				alert("修改保存成功！");
			}
		});
}
