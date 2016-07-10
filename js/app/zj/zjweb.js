

var zj_obj={
	material_init:function(){
		$('#material>.list').masonry({itemSelector:'.item', columnWidth:367});
	},	
	material_multi_init:function(){
		var material_multi_list_even=function(){
			$('.multi .first, .multi .list').each(function(){
				var children=$(this).children('.control');
				$(this).mouseover(function(){children.css({display:'block'});});
				$(this).mouseout(function(){children.css({display:'none'});});
				
				children.children('a[href*=#del]').click(function(){
					if($('.multi .list').size()<=1){
						alert('无法删除，多条图文至少需要2条消息！');
						return false;
					}
					if(confirm('删除后不可恢复，继续吗？')){
						$(this).parent().parent().remove();
						$('.multi .first a[href*=#mod]').click();
						$('.mod_form').css({top:37});
					}
				});
				
				children.children('a[href*=#mod]').click(function(){
					var position=$(this).parent().offset();
					var material_form_position=$('#material_form').offset();
					var cur_id='#'+$(this).parent().parent().attr('id');
					$('.mod_form').css({top:position.top-material_form_position.top});
					$('.mod_form input[name=inputTitle]').val($(cur_id+' input[name=Title\\[\\]]').val());
					$('.mod_form input[name=inputDescription]').val($(cur_id+' input[name=Description\\[\\]]').val());
					/*$('.mod_form input[name=inputUrl]').val($(cur_id+' input[name=Url\\[\\]]').val());*/
					$('.mod_form select[name=inputUrl]').find("option[value='"+$(cur_id+' input[name=Url\\[\\]]').val()+"']").attr("selected", true);
					$('.big_img_size_tips').html(cur_id=='#multi_msg_0'?'640*360px':'300*300px');
					$('.multi').data('cur_id', cur_id);
					global_obj.file_upload($('#MsgFileUpload'), $(cur_id+' input[name=ImgPath\\[\\]]'), $(cur_id+' .img'));
				});
				$('.mod_form select[name=inputUrl]').find("option[value='"+$('input[name=Url\\[\\]]').val()+"']").attr("selected", true);
			});
		}
		
		global_obj.file_upload($('#MsgFileUpload'), $('.multi .first input[name=ImgPath\\[\\]]'), $('.first .img'));
		$('.multi').data('cur_id', '#'+$('.multi .first').attr('id'));
		$('.mod_form input').filter('[name=inputTitle]').on('keyup paste blur', function(){
			var cur_id=$('.multi').data('cur_id');
			$(cur_id+' input[name=Title\\[\\]]').val($(this).val());
			$(cur_id+' .title').html($(this).val());
		});
		$('.mod_form input').filter('[name=inputDescription]').on('keyup paste blur', function(){
			var cur_id=$('.multi').data('cur_id');
			$(cur_id+' input[name=Description\\[\\]]').val($(this).val());
			$(cur_id+' .description').html($(this).val());
		});
		$('.mod_form select').filter('[name=inputUrl]').change(function(){
			var cur_id=$('.multi').data('cur_id');
			$(cur_id+' input[name=Url\\[\\]]').val($(this).val());
		});
		
		material_multi_list_even();
		$('a[href=#add]').click(function(){
			$(this).blur();
			if($('.multi .list').size()>=10){
				alert('你最多只可以加入10条栏目链接！');
				return false;
			}
			$('.multi .list, a[href*=#mod], a[href*=#del]').off();
			$('<div class="list" id="id_'+Math.floor(Math.random()*1000000)+'">'+$('.multi .list:last').html()+'</div>').insertAfter($('.multi .list:last'));
			$('.multi .list:last').children('.info').children('.title').html('标题').siblings('.img').html('缩略图');
			$('.multi .list:last input').filter('[name=Title\\[\\]]').val('').end().filter('[name=Url\\[\\]]').val('').end().filter('[name=ImgPath\\[\\]]').val('');
			material_multi_list_even();
		});
	},
	
	url_init:function(){
		$('#add_form').submit(function(){
			if(global_obj.check_form($('*[notnull]'))){return false};
			$('#add_form input:submit').attr('disabled', true);
			return true;
		});
	}

}