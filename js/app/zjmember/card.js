var currentindex=0;
var card_obj={
	
		file_upload:function(file_input_obj, filepath_input_obj, img_detail_obj,size){
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
			sizeLimit:size*1024,
			onError:function(ID, fileObj, errorObj, event){
				if(errorObj.type=='File Size'){
					alert('图片大小请控制在'+size+'KB！');
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
						//img_detail_obj.html(global_obj.img_link(jsonData.imgpath));
						img_detail_obj.attr("src",BasePath+jsonData.imgpath);
					}else{
						callback(jsonData.imgpath);
					}
				}else{
					alert('上传失败请稍后再试！');
				};
			}
		});
	},
		material_two_init:function(){
			card_obj.file_upload($('#MsgFileUpload1'), $('#material_form input[name=carimgurl]'), $('#setimg1'),500);
			card_obj.file_upload($('#MsgFileUpload2'), $('#material_form input[name=logoimgurl]'),$('#setimg2'),200);
			$('.mod_form input').filter('[name=name]').on('keyup paste blur', function(){
				$('.ctitle').html($(this).val());
			})
			$('.mod_form input').filter('[name=namecolor]').on('keyup paste blur', function(){
				$('.ctitle').css('color',$(this).val());
			})
			$('.mod_form input').filter('[name=numbercolor]').on('keyup paste blur', function(){
				$('.cnumber').css('color',$(this).val());
			})
			$('.mod_form input').filter('[name=cardnoinit]').on('keyup paste blur', function(){
				$('.cnumber').html($(this).val());
			})

				
	}
}

