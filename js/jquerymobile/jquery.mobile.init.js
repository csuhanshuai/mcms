$(document).on("mobileinit", function ()
{
	//alert('mobileinit');

	$.mobile.ajaxEnabled = false;

	//console.log($.fn.buttonMarkup.defaults);
	//$.fn.buttonMarkup.defaults.corners = false;
	//$.fn.buttonMarkup.defaults.shadow = false;

	//$.mobile.defaultPageTransition = 'flip';

	//$.mobile.buttonMarkup.hoverDelay = false;
	//$.mobile.ignoreContentEnabled = true;
	//$.mobile.selectmenu.prototype.options.nativeMenu = false;

	// Navigation
	//$.mobile.page.prototype.options.backBtnText = "Go back";
	//$.mobile.page.prototype.options.addBackBtn = true;
	//$.mobile.page.prototype.options.backBtnTheme = "d";

	// Page
	//$.mobile.page.prototype.options.headerTheme = "c";
	//$.mobile.page.prototype.options.contentTheme = "c";
	//$.mobile.page.prototype.options.buttonTheme = "b";
	//$.mobile.page.prototype.options.footerTheme = "c";

	// Listviews
	//$.mobile.listview.prototype.options.headerTheme = "a";  // Header for nested lists
	//$.mobile.listview.prototype.options.theme = "c";  // List items / content
	//$.mobile.listview.prototype.options.dividerTheme = "d";  // List divider

	//$.mobile.listview.prototype.options.splitTheme = "c";
	//$.mobile.listview.prototype.options.countTheme = "c";
	//$.mobile.listview.prototype.options.filterTheme = "c";
	//$.mobile.listview.prototype.options.filterPlaceholder = "Filter data...";

});


$(document).on("pagecreate", function ()
{
	//alert('pagecreate');

	$('div[data-position="fixed"]').toolbar({ tapToggle: false });

	$('.ui-shadow').removeClass('ui-shadow');
	$('.ui-shadow-inset').removeClass('ui-shadow-inset');

	$('.ui-corner-all[data-role="collapsible"]').removeClass('ui-corner-all');
	$('input').parent().removeClass('ui-corner-all');
	$('textarea').removeClass('ui-corner-all');
	
});
