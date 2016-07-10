jQuery.fn.extend({
	dateDisplay : function(url) {
		$(this).datepicker({
		    yearRange: '1960:2100', //取值范围.
		    showOn: 'both', //输入框和图片按钮都可以使用日历控件。
		    buttonImage: url + '/images/calendar.gif', //日历控件的按钮
		    buttonImageOnly: true,
		    showButtonPanel: true
		});
	},

	selectAll : function(obj) {
		$(this).click(function() {
			if ($(this).attr('checked') == true) { 
				  $('#'+obj).find('input[type="checkbox"]').each(function() {
					  $(this).attr('checked', true);
				  });
			} else { 
				$('#'+obj).find('input[type="checkbox"]').each(function() {
					 $(this).attr('checked', false);
				 });
			}
		});
	},
	
	display : function(obj) {
		$(this).click(function() {
			if($('#'+obj).is(':hidden')) {
				$('#'+obj).parents('table').css({border:'1px solid #e6e6e6', background: '#eeeeee'});
				$('#'+obj).show();
			}else{
				$('#'+obj).parents('table').css({border:'0px solid #e6e6e6', background: '#ffffff'});
				$('#'+obj).hide();
			}
		});
	}
});

