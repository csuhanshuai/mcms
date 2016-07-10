
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Tiny, opensource, Bootstrap WYSIWYG rich text editor from MindMup</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="keywords" content="opensource rich wysiwyg text editor jquery bootstrap execCommand html5" />
    <meta name="description" content="This tiny jQuery Bootstrap WYSIWYG plugin turns any DIV into a HTML5 rich text editor" />
    

	<link href="${BasePath}/js/app/article/external/google-code-prettify/prettify.css" rel="stylesheet">
       <link href="${BasePath}/css/article/bootstrap-combined.no-icons.min.css" rel="stylesheet">
       <link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">

       <script src="${BasePath}/js/jquery-1.7.2.min.js"></script>
        <script src="${BasePath}/js/app/article/external/jquery.hotkeys.js"></script>
	<script src="${BasePath}/js/app/article/bootstrap-wysiwyg.js"></script>
	  <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/js/bootstrap.min.js"></script>
	<script src="${BasePath}/js/app/article/external/google-code-prettify/prettify.js"></script>
    <style type="text/css">
		body, html{background:url(${BasePath}/images/main-bg.jpg) left top fixed no-repeat;}
		.r_nav{background:url(../images/global/nav-bg.png) right no-repeat; height:40px;/* overflow:hidden;*/}
		.r_con_wrap{background:#fff; padding:20px; padding-top:12px; padding-bottom:1px; min-height:20px;}
	li {
    list-style-type: none;
}
.r_nav ul {
    background: url("../images/global/nav-ul-bg.jpg") no-repeat scroll left top rgba(0, 0, 0, 0);
    height: 40px;
    padding-left: 12px;
}
	.r_nav ul li {
	    background: url("../images/bg.png") repeat scroll -40px 0 rgba(0, 0, 0, 0);
	    float: left;
	    height: 28px;
	    line-height: 28px;
	    margin-right: 10px;
	    margin-top: 11px;
	    position: relative;
	    text-align: center;
	    width: 120px;
	}
		#editor {
	max-height: 400px;
	height: 350px;
	background-color: white;
	border-collapse: separate; 
	border: 1px solid rgb(204, 204, 204); 
	padding: 4px; 
	box-sizing: content-box; 
	-webkit-box-shadow: rgba(0, 0, 0, 0.0745098) 0px 1px 1px 0px inset; 
	box-shadow: rgba(0, 0, 0, 0.0745098) 0px 1px 1px 0px inset;
	border-top-right-radius: 3px; border-bottom-right-radius: 3px;
	border-bottom-left-radius: 3px; border-top-left-radius: 3px;
	overflow: scroll;
	outline: none;
}
#voiceBtn {
  width: 20px;
  color: transparent;
  background-color: transparent;
  transform: scale(2.0, 2.0);
  -webkit-transform: scale(2.0, 2.0);
  -moz-transform: scale(2.0, 2.0);
  border: transparent;
  cursor: pointer;
  box-shadow: none;
  -webkit-box-shadow: none;
}

div[data-role="editor-toolbar"] {
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

.dropdown-menu a {
  cursor: pointer;
}
 .btn_green {
    background: url("../images/global/ok-btn-bg.jpg") repeat scroll 0 0 rgba(0, 0, 0, 0);
    border: medium none;
    border-radius: 5px;
    color: #FFFFFF;
    display: block;
    float: left;
    height: 30px;
    line-height: 30px;
    margin-right: 10px;
    text-align: center;
    text-decoration: none;
    width: 145px;
}
	</style>

  </head>
  <body>

<div id="iframe_page">
    <div class="iframe_content"  style="padding:15px 25px;">
        <div class="r_nav">
    <ul>
	<li class="cur"><a href="javascript:">新增文章</a></li>
   </ul>
</div>

<div   class="r_con_wrap">
	<table border="0" cellpadding="5" cellspacing="0">
            <tr>
            
             <td>文章标题 <input type="text" name="ctitle" id="ctitle" value="<#if article?? >${article.title?default('')}</#if>" size="25" class="form_input" notnull /></td>
             <td>文章类型
             
                <select name="ctype" id="ctype" >                  
                	   <#if list??  >
						    <#list list as ptype>
							<option value="${(ptype.id)}" <#if article??&&article.type==ptype.id >selected</#if>>${(ptype.typename)}</option>
						    </#list>   
			     </#if>

                </select>
                </td>
              
            </tr>
        </table>
  </div>
 <table  border="0" style="width:100%">
 <tr>
 	<td style="width:70%;max-width: 400px;">
 	<div id="d1" class="hero-unit" style="padding:20px;margin-bottom:0px">
    <div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
      <div class="btn-group">
        <a class="btn dropdown-toggle" data-toggle="dropdown" atitle="Font" title="字体"><i class="icon-font"></i><b class="caret"></b></a>
          <ul class="dropdown-menu">
          </ul>
        </div>
      <div class="btn-group">
        <a class="btn dropdown-toggle" data-toggle="dropdown" atitle="Font Size" title="大小"><i class="icon-text-height"></i>&nbsp;<b class="caret"></b></a>
          <ul class="dropdown-menu">
          <li><a data-edit="fontSize 5"><font size="5">5</font></a></li>
          <li><a data-edit="fontSize 4"><font size="4">4</font></a></li>
          <li><a data-edit="fontSize 3"><font size="3">3</font></a></li>
	  <li><a data-edit="fontSize 2"><font size="2">2</font></a></li>
          <li><a data-edit="fontSize 1"><font size="1">1</font></a></li>
           </ul>
      </div>
      <div class="btn-group">
        <a class="btn" data-edit="bold" atitle="Bold (Ctrl/Cmd+B)" title="粗体"><i class="icon-bold"></i></a>
        <a class="btn" data-edit="italic" atitle="Italic (Ctrl/Cmd+I)" title="斜体"><i class="icon-italic"></i></a>
        <a class="btn" data-edit="strikethrough" atitle="Strikethrough" title="删除线"><i class="icon-strikethrough"></i></a>
        <a class="btn" data-edit="underline" atitle="Underline (Ctrl/Cmd+U)" title="强调"><i class="icon-underline"></i></a>
      </div>
      <div class="btn-group">
        <a class="btn" data-edit="insertunorderedlist" atitle="Bullet list" title="符号列表"><i class="icon-list-ul"></i></a>
        <a class="btn" data-edit="insertorderedlist" atitle="Number list"  title="数字列表"><i class="icon-list-ol"></i></a>
        <a class="btn" data-edit="outdent" atitle="Reduce indent (Shift+Tab)" title="减少缩进"><i class="icon-indent-left"></i></a>
        <a class="btn" data-edit="indent" atitle="Indent (Tab)" title="缩进"><i class="icon-indent-right"></i></a>
      </div>
      <div class="btn-group">
        <a class="btn" data-edit="justifyleft" atitle="Align Left (Ctrl/Cmd+L)" title="左对齐"><i class="icon-align-left"></i></a>
        <a class="btn" data-edit="justifycenter" atitle="Center (Ctrl/Cmd+E)" title="居中对齐"><i class="icon-align-center"></i></a>
        <a class="btn" data-edit="justifyright" atitle="Align Right (Ctrl/Cmd+R)" title="右对齐"><i class="icon-align-right"></i></a>
        <a class="btn" data-edit="justifyfull" atitle="Justify (Ctrl/Cmd+J)" title="两端对齐"><i class="icon-align-justify"></i></a>
      </div>
      <div class="btn-group">
		  <a class="btn dropdown-toggle" data-toggle="dropdown" atitle="Hyperlink" title="超链接"><i class="icon-link"></i></a>
		    <div class="dropdown-menu input-append">
			    <input class="span2" placeholder="路径，例如：http://" type="text" data-edit="createLink"/>
			    <button class="btn" type="button">Add</button>
        </div>
        <a class="btn" data-edit="unlink"  atitle="Remove Hyperlink" title="删除超链接"><i class="icon-cut"></i></a>

      </div>
      
      <div class="btn-group">
        <a class="btn" atitle="Insert picture (or just drag & drop)"  title="插入图片(支持直接拖放或Carl+C)"  id="pictureBtn"><i class="icon-picture"></i></a>
        <input type="file" title="插入图片(支持直接拖放或Carl+C)"  data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
      </div>
      <div class="btn-group">
        <a class="btn" data-edit="undo" atitle="Undo (Ctrl/Cmd+Z)" title="复原"><i class="icon-undo"></i></a>
        <a class="btn" data-edit="redo" atitle="Redo (Ctrl/Cmd+Y)" title="重做"><i class="icon-repeat"></i></a>
      </div>
      <input type="text" data-edit="inserttext" id="voiceBtn" x-webkit-speech="">
    </div>

    <div id="editor" >
      <div><#if article?? >${article.content?default('')}</#if></div>
    </div>
 	</td>
 	<td ></td>
 	<td style="max-width: 480px;margin: auto;" >
 	<div id="preview" class="hero-unit" style="padding:20px;margin-bottom:0px;overflow-y:auto; overflow-x:hidden;">

	
	</div>
 	
 	</td>
 </tr>
 </table>
 
 <div   class="hero-unit" style="padding:5px;margin-bottom:0px;margin-right: auto; margin-left: auto;text-align:center; ">
	         <span style="padding:5px 5px;margin-left: 150px;">
	            <input type="button" class="btn_green" value="提交" name="submit_btn"  id="submit_btn">&nbsp;&nbsp;&nbsp;&nbsp;
	            <input type="button" class="btn_green" value="清空" name="clean_btn"  id="clean_btn">
                  </span>
  </div>

<form action="${BasePath}/articleManage/addArticle.kq" name="addForm" id="addForm" method="post">
<input type="hidden"  name="id" id="id"  <#if article??>value="${article.id}"</#if> />
 <input type="hidden"  name="title" id="title"/>
 <input type="hidden"  name="type" id="type"/>
 <input type="hidden"  name="content" id="content"/>
</form>



<script>
  $(function(){
    function initToolbarBootstrapBindings() {
      var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier', 
            'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
            'Times New Roman', 'Verdana', '宋体', '黑体', '仿宋', '楷体', '隶书', '幼圆', '微软雅黑'],
            fontTarget = $('[atitle=Font]').siblings('.dropdown-menu');
      $.each(fonts, function (idx, fontName) {
          fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
      });

      $('a[atitle]').tooltip({container:'body'});
    	$('.dropdown-menu input').click(function() {return false;})
		    .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
        .keydown('esc', function () {this.value='';$(this).change();});

      $('[data-role=magic-overlay]').each(function () { 
        var overlay = $(this), target = $(overlay.data('target')); 
        overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
      });
      if ("onwebkitspeechchange"  in document.createElement("input")) {
        var editorOffset = $('#editor').offset();
        $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});
      } else {
        $('#voiceBtn').hide();
      }
	};
	function showErrorAlert (reason, detail) {
		var msg='';
		if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
		else {
			console.log("error uploading file", reason, detail);
		}
		$('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
		 '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
	};
    initToolbarBootstrapBindings();  
	$('#editor').wysiwyg({ fileUploadError: showErrorAlert} );
    window.prettyPrint && prettyPrint();
    
	$('#preview').height($('#d1').height());
	
	   run();//加载页面时启动定时器  
       var interval;  
	   function run() {  
	      interval = setInterval(preview, "1000");  
	   }  
	   function preview() {  
	      
	      $('#preview').html($('#editor').html());
	   }  
	
		$('#submit_btn').click(function(){
		
			if($.trim($('#ctitle').val())==""){
				alert("请输入标题");
				return;
			}
			
	       var form=document.getElementById("addForm");	
		    form.content.value= $.trim($('#preview').html().replace(/\'/g,"\\'"));
		   form.type.value=$('#ctype').val();
		   form.title.value=$('#ctitle').val();
		   if(form.id.value!=""){
		   form.action="${BasePath}/articleManage/updateArticle.kq"
		   }
		   form.submit();	
			 			 
		})
		
		$('#clean_btn').click(function(){	
		
			 $('#editor').html("");	 
		})
		

    
  });
</script>

</html>
