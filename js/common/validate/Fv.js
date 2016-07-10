/**
*  
*/
var Tool = {};
Tool.onReady=function(handler){
	window.onload=handler;
}
Tool.createSpan=function(style,msg){
	return "<span class="+style+">"+msg+"</span>"
}
Tool.getEl=function(id){
	return document.getElementById(id);
}
//为消息提供样式选择
Cls=function(){
	this.input="inputsgl";
	this.radio="";
	this.check="";
	this.textarea="";
	this.select="";
	this.defaultCls="onshow";
	this.blurCls="";
	this.focusCls="onfocus";
	this.errorCls="onerror";
	this.rightCls="oncorrect";
	this.setClass=function(o,className){
		o.className=this[className];
	};
}
//此类定义了一些正则表达式
Reg=function(){
	this.noempty=/^([\s\S]*)$/,
	this.user=/^\w{6,12}$/;//用户名 一般是 6-12位
	this.email=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;//电子邮件
	this.phone=/^\d{3}-\d{8}|\d{4}-\d{8}|\d{4}-\d{7}$/;//国内电话号码
	//this.html=/^<(\S*?)[^>]*>.*?</\1>|<.*? />$/;
	this.blank=/^$/;
	this.postcode=/^[1-9]\d{5}(?!\d)$/;//邮编
	this.card=/^\d{15}|\d{18}$/;//身份证号码
	this.tinteger=/^[1-9]\d*$/;//正整数
	this.tinteger=/^-[1-9]\d*$/;//负整数
	this.integezero=/^-*[0-9]\d*$/;					//整数(包括0)
	this.intege=/^-?[1-9]\d*$/;					//整数
	this.intege1=/^[1-9]\d*$/;					//正整数
	this.intege2=/^-[1-9]\d*$/;					//负整数
	this.num=/^([+-]?)\d*\.?\d+$/;			//数字
	this.num1=/^[1-9]\d*|0$/;					//正数（正整数 + 0）
	this.num2=/^-[1-9]\d*|0$/;					//负数（负整数 + 0）
	this.num4=/^([+]?)\d*\.?\d+$/;			//正数字
	this.decmal=/^([+-]?)\d*\.\d+$/;			//浮点数
	this.decmal1=/^[1-9]\d*.\d*|0.\d*[1-9]\d*$/;//正浮点数
	this.decmal2=/^-([1-9]\d*.\d*|0.\d*[1-9]\d*)$/;//负浮点数
	this.decmal3=/^-?([1-9]\d*.\d*|0.\d*[1-9]\d*|0?.0+|0)$/;//浮点数
	this.decmal4=/^[1-9]\d*.\d*|0.\d*[1-9]\d*|0?.0+|0$/; //非负浮点数（正浮点数 + 0）
	this.decmal5=/^(-([1-9]\d*.\d*|0.\d*[1-9]\d*))|0?.0+|0$/;//非正浮点数（负浮点数 + 0）
	this.color=/^[a-fA-F0-9]{6}$/;				//颜色
	this.chinese=/^[\u4E00-\u9FA5\uF900-\uFA2D]+$/;					//仅中文
	this.ascii=/^[\x00-\xFF]+$/;				//仅ACSII字符
	this.zipcode=/^\d{6}$/;						//邮编
	this.mobile=/^(13|14|15|18)[0-9]{9}$/;				//手机
	this.mobiletc=/^(133|153|189)[0-9]{8}$/;		//电信手机
	this.ip4=/^(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)\.(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)\.(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)\.(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)$/;	//ip地址
	this.notempty=/^\S+$/;						//非空
	this.picture=/(.*)\.(jpg|bmp|gif|ico|pcx|jpeg|tif|png|raw|tga)$/;	//图片
	this.rar=/(.*)\.(rar|zip|7zip|tgz)$/,								//压缩文件
	this.date=/^\d{4}(\-|\/|\.)\d{1,2}\1\d{1;2}$/;					//日期
	this.qq=/^[1-9]*[1-9][0-9]*$/;				//QQ号码
	this.tel=/^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;	//电话号码的函数(包括验证国内区号,国际区号,分机号)
	this.username=/^\w+$/;						//用来用户注册。匹配由数字、26个英文字母或者下划线组成的字符串
	this.name=/^[\w\u4E00-\u9FA5\uF900-\uFA2D]*$/;   //数字 字母  下划线 与中文
	this.letter=/^[A-Za-z]+$/;					//字母
	this.classpath=/^[a-z]([a-z]+\.)+([A-Z]{1}[a-zA-Z])+$/;              //类路径
	this.letter_u=/^[A-Z]+$/;					//大写字母
	this.letter_l=/^[a-z]+$/;					//小写字母
	this.letter_ln=/(([0-9]+[a-zA-Z]+[0-9]*)|([a-zA-Z]+[0-9]+[a-zA-Z]*))/;			//数字字母
	this.floatNum=/^[0-9]\d+(?=\.{0,1}\d+$|$)/;
	this.idcard=/^[1-9]([0-9]{14}|[0-9]{17})$/;	//身份证
		
}
//表单组件验证类
Fv=function(c){
	this.config=c;
	this.form; //设置当前注册的表单
	this.cls= new Cls;//初使化消息样式
	this.regexp=new Reg;//初使化正则表达式
	
	
	//注册当前form表单对象
	this.register=function(){
		this.form=document.forms[c.form];
		this.form.onsubmit=this.submit(c);//设置当前表单的提交监听函数
		this.reg(this.config.fields);
	}
	
	setMsg=function(o,c,m){//设置消息方法，局部方法，当一个内部类来用
		if(m == null || m == "null"){
			o.className="";
			o.innerHTML="";
		}else{
			o.className=c;
			o.innerHTML=m;
		}
	}
	
	this.reg=function(cf){//注册表单,主要是将配置信息注册到表单中
		if(cf.length<1) return;
		var o,k;
		
		var cl=this.cls.defaultCls;
		var el=this.cls.errorCls;
		var rl=this.cls.rightCls;
		for(var i=0;i<cf.length;i++){
			k=cf[i];
			o=this.form[k.name];
			
			var t=Tool.getEl(k.msgTip);
			var r=(typeof(k.regExp)=="string")?this.regexp[k.regExp]:k.regExp;
			if( o.value == null || o.value=="" || o.type == "select-one"){
				//添加默认表单组件信息 
				k.defaultMsg?this.addMsg(this.cls.defaultCls,k.defaultMsg,k.msgTip):"";
				//添加得到焦点时的信息
				k.focusMsg?this.addFocusListener(o,{cls:this.cls.focusCls,msg:k.focusMsg,tip:k.msgTip}):"";
			}else{
				var clazz,msg;
				if(r && !r.test(o.value)){
					clazz=el;
					msg=k.errorMsg;
				}else{
					clazz=rl;
					msg=k.rightMsg;
				}
				setMsg(t,clazz,msg);
			}
		
			
			//为组件添加失去焦点监听函数
			this.addBlurListener(o,k);
		}	
	}
	//添加得到焦点事件 o 表单对象,m消息对象
	this.addFocusListener=function(o,m){
		var arr=(!o.length || o.nodeName=='SELECT')?[o]:o;
		for(var i=0;i<arr.length;i++){
			arr[i].onfocus=this.addEvMsg(m.cls,m.msg,m.tip);
		}
	}
	//添加表单组件失去焦点
	this.addBlurListener=function(o,k){
		//var arr=o.length?o:[o];
		var arr=(!o.length || o.nodeName=='SELECT')?[o]:o;
		var t=this.getType(o);
		for(var i=0;i<arr.length;i++){
			arr[i].onblur=(this[t+"OnBlur"])(o,k);
		}
	}

	//文本框推动焦点时触发的事件
	this.textOnBlur=function(o,k){
		var cl=this.cls.defaultCls;
		var el=this.cls.errorCls;
		var rl=this.cls.rightCls;
		var t=Tool.getEl(k.msgTip);
		var r=(typeof(k.regExp)=="string")?this.regexp[k.regExp]:k.regExp;
		return function(){
			var clazz,msg;
			if(o.value==""){
				clazz=cl;
				msg=k.defaultMsg;
			}else{
				if(r && !r.test(o.value)){
					clazz=el;
					msg=k.errorMsg;
				}else{
					clazz=rl;
					msg=k.rightMsg;
					
					if(k.event) k.event(true);
				}
			}
			setMsg(t,clazz,msg);
			
			
		}
	}
	//多选框失去焦点时触发的事件
	this.checkOnBlur=function(o,k){
		var dc=this.cls.defaultCls;
		var rc=this.cls.rightCls;
		return function(){
			var cls=dc,msg=k.defaultMsg;
			var tip=Tool.getEl(k.msgTip);
			var c=0;
			for(var j=0;j<o.length;j++){
				if(o[j].checked){
					c++;
					if(c>=k.number){
						cls=rc;
						msg=k.rightMsg;
						break;
					}
				}
			}
			setMsg(tip,cls,msg);
		}
	
	}
	//单选框失去焦点时触发的事件
	this.radioOnBlur=function(o,k){
		var dc=this.cls.defualtCls;
		var rc=this.cls.rightCls;
		return function(){
			var cls=dc,msg=k.defaultMsg;
			var tip=Tool.getEl(k.msgTip);
			for(var j=0;j<o.length;j++){
				if(o[j].checked){
					cls=rc;
					msg=k.rightMsg;
					break;
				}
			}
			setMsg(tip,cls,msg);
		}
	
	}
	
		//下拉列表失去焦点时触发的事件
	this.selectOnBlur=function(o,k){
		var dc=this.cls.defaultCls;
		var rc=this.cls.rightCls;
		return function(){
			var cls=dc,msg=k.defaultMsg;
			var tip=Tool.getEl(k.msgTip);
			if(o.selectedIndex>0){
				cls=rc;
				msg=k.rightMsg;
			}
			setMsg(tip,cls,msg?msg:'');
		}
	
	}
	
	
	this.submit=function(){//由于事件监听函数不能有参数,所以这里用一个闭包
		var f=this.form;//f为this.form 的一个引用，当在闭包函数中的时候，this 指向的是window，而不是当前的那个对象了
		var re=this.regexp;
		var style=this.cls;
		var config=this.config;
		return function(){
			var result=true;
			var c,r,o,cla,msg,tip;
			var vf=config.fields;
			for(var i=0;i<vf.length;i++){//循环验证表单是否验证通过
				c=vf[i];
				o=f[c.name];
				tip=Tool.getEl(c.msgTip);
				
				var r=(typeof(c.regExp)=="string")?re[c.regExp]:c.regExp;
				if(isPassed(o,c,r)){
					cla=style.errorCls;
					msg=c.errorMsg;
					result=false;
					setMsg(tip,cla,msg);
				}
			}
			var r=config['submit']?(config['submit'])(result):true;
			return result && r;
		}
	}
	
	isPassed=function(o,c,r){//是否通过验证
		var type=o.type || (o.length && o[0].type);
		switch(type){
			case 'text' :
			case 'password':{//判断文本控件，这样的控件是可以有正则表达式的
				if(!c.allownull && o.value ==''){
					return true;
				}else if(c.allownull && o.value ==''){
					return false;
				}else{
					return !r.test(o.value);
				}
//				return (!c.allownull &&  !r.test(o.value)) || (c.allownull && o.value!='' && !r.test(o.value));
			}
			case 'radio':
				return !(c.allownull || isChecked(o,1));
			case 'checkbox':
				return !(c.allownull || isChecked(o,c.number));
			case 'select-one':
				return  !(c.allownull || o.selectedIndex>0);
			default:
				return true;
		}
		return false;
	}
	//判断选中个数是
	isChecked=function(o,n){
		var c=0;
		for(var i=0;i<o.length;i++){
			if(o[i].checked) c++;
		}
		return c>=n;
	}
	
	//判断下拉列表是否被选择了
	isSelected=function(o,n){
		var c=0;
		for(var i=0;i<o.length;i++){
			if(o[i].checked) c++;
		}
		return c>=n;
	}
	//失去焦点时显示的信息
	this.onblurMsg=function(o,c){
		var cl=this.cls.defaultCls;
		var el=this.cls.errorCls;
		var rl=this.cls.rightCls;
		var t=Tool.getEl(c.msgTip);
		var r=(typeof(c.regExp)=="string")?this.regexp[c.regExp]:c.regExp;
		return function(){
			var clazz,msg;
			if(o.value==""){
				clazz=cl;
				msg=c.defaultMsg;
			}else{
				if(r && !r.test(o.value)){
					clazz=el;
					msg=c.errorMsg;
				}else{
					clazz=rl;
					msg=c.rightMsg;
				}
			}
			setMsg(t,clazz,msg);
		}
	}
	
	this.addMsg=function(c,m,i){
		var o = Tool.getEl(i);
		o.className=c;
		o.innerHTML=m;
	}
	this.addEvMsg=function(c,m,i){
		return function(){
			var s = Tool.getEl(i);
			s.className=c;
			s.innerHTML=m;
		}
	}
	
	
	this.getType=function(o){
		var type=o.type || (o.length && o[0].type);
		switch(type){
			case 'text' :
			case 'password':
				return "text";
			case 'radio':
				return "radio";
			case 'checkbox':
				return "check";
			case 'select-one':
				return "select";
			default:
				return '';
		}
	}
	
	this.getEl=function(name){
		return this.form[name];
	}
	
	this.addClass=function(f){
		var cn=this.getType(f);
		this.cls.setClass(f,cn);
	}

}