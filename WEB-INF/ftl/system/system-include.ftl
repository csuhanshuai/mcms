<!-- 引用Spring标签 -->
<#assign spring=JspTaglibs["/WEB-INF/tlds/spring.tld"]/>
<#assign form=JspTaglibs["/WEB-INF/tlds/spring-form.tld"]/>

<!-- 引入公共样式 -->
<link rev="stylesheet" rel="stylesheet" type="text/css" href="${BasePath}/css/ytsys-base.css" />


<link rev="stylesheet" rel="stylesheet" type="text/css" href="${BasePath}/css/thickbox.css"  media="screen" />
<link rev="stylesheet" rel="stylesheet" type="text/css" href="${BasePath}/css/ui.datepicker.css" media="screen"  />  


<!-- 引入公共脚本 -->
<script type="text/javascript"  src="${BasePath}/js/jquery-1.4.2.min.js" ></script>
<script type="text/javascript"  src="${BasePath}/js/common.js"></script>
<script type="text/javascript"  src="${BasePath}/js/common/form/finance.js"></script>
<script type="text/javascript"  src="${BasePath}/js/common/thickbox/thickbox.js"></script>  

<!--日期控件-->
<script type="text/javascript"  src="${BasePath}/js/common/form/ui.datepicker.js" charset="UTF-8" ></script>
<script type="text/javascript"  src="${BasePath}/js/common/form/ui.datepicker-zh-CN.js"  charset="UTF-8" ></script>

<!-- 引入前台验证 -->
<link rel="stylesheet" href="${BasePath}/js/common/validate/css/validator.css" type="text/css"></link>
<script type="text/javascript" src="${BasePath}/js/common/validate/Fv.js"></script>
<script type="text/javascript" src="${BasePath}/js/common/validate/Fw.js"></script>


<script type="text/javascript" src="${BasePath}/js/common/historyperpage.js"></script>