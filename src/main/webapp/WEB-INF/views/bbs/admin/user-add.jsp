<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,member-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="H-ui.admin_2.3.1/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="H-ui.admin_2.3.1/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="H-ui.admin_2.3.1/lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
<link href="H-ui.admin_2.3.1/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>添加用户</title>
</head>
<body>
<div class="pd-20">
  <form method="post" class="form form-horizontal" id="form-member-add">
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red">*</span>用户名：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text" value="" placeholder="" 
        id="member-name" name="userName" datatype="*2-16" nullmsg="用户名不能为空">
      </div>
      <div class="col-4"> </div>
    </div>
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red">*</span>密码：</label>
      <div class="formControls col-5">
        <input type="password" class="input-text" value="" placeholder="" 
        id="passWord" name="passWord"  datatype="*2-8" nullmsg="密码不能为空">
      </div>
      <div class="col-4"> </div>
    </div>
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red">*</span>性别：</label>
      <div class="formControls col-5 skin-minimal">
        <div class="radio-box">
          <input type="radio" id="sex-1" value="1" name="sex" datatype="*" nullmsg="请选择性别！">
          <label for="sex-1">男</label>
        </div>
        <div class="radio-box">
          <input type="radio" id="sex-2" value="2" name="sex">
          <label for="sex-2">女</label>
        </div>
      </div>
      <div class="col-4"> </div>
    </div>
    <div class="row cl">
      <label class="form-label col-3">个性签名：</label>
      <div class="formControls col-5">
        <textarea name="seeString" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="textarealength(this,100)"></textarea>
        <p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
      </div>
      <div class="col-4"> </div>
    </div>
    <div class="row cl">
      <div class="col-9 col-offset-3">
        <input class="btn btn-primary radius" type="submit" onclick="closet()" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
      </div>
    </div>
  </form>
</div>
<script type="text/javascript" src="H-ui.admin_2.3.1/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="H-ui.admin_2.3.1/lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="H-ui.admin_2.3.1/lib/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="H-ui.admin_2.3.1/lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="H-ui.admin_2.3.1/js/H-ui.js"></script> 
<script type="text/javascript" src="H-ui.admin_2.3.1/js/H-ui.admin.js"></script>
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	
});
function closet(){
	$.ajax({
		type : "get",
		url : "admin/userAdd.do?",
		contentType : "application/json",
		data : getData(), //设置发送参数，即使参数为空，也需要设置                
		dataType : "text", //返回的类型为json                
		success : function(data) { //成功时执行的方法	
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		},
		error : function(result, status) { //出错时会执行这里的回调函数                     
			if (status == 'error') {
				alert(status);
			}
		}
	});	
}
function getData() {
	var userName = $("#userName").val();
	var data = "userName=" + userName ;
	return data;

}

</script>
</body>
</html>