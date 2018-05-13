<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<!DOCTYPE >

<html>
<head>
<title>专家指导</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<meta name="viewport" content="width=device-width">
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
<script src="<%=path%>/js/jquery.validate.js"></script>

<style>
label.error {
	color: red;
	font-size: 16px;
	font-weight: normal;
	line-height: 1.4;
	margin-top: 0.5em;
	width: 100%;
	height:100%;
	float: none;
}

@media screen and (orientation: portrait) {
	label.error {
		margin-left: 0;
		display: block;
	}
}

@media screen and (orientation: landscape) {
	label.error {
		display: inline-block;
		margin-left: 22%;
	}
}

em {
	color: red;
	font-weight: bold;
	padding-right: .25em;
}
</style>

<script type="text/javascript">
	
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideOptionMenu');
		WeixinJSBridge.call('showToolbar');
	});

	function is_weixin() {
		var ua = navigator.userAgent.toLowerCase();
		if (ua.match(/MicroMessenger/i) == "micromessenger") {

		} else {
			/* window.location.href = "http://www.baidu.com"; */
		}
	}
</script>

<script>
	//ajax 获取专家教师
	function getExpert() {
		$.ajax({
			type : "get",
			url : "ajaxExpert.do?",
			data : getExpertise(), //设置发送参数，即使参数为空，也需要设置     
			dataType : "text", //返回的类型为json  
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			scriptCharset : "utf-8",
			success : function(data) { //成功时执行的方法		

				setEt(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert(status);
				}
			}
		});

	}
	function setEt(ajaxData) {//根据返回数据显示搜索结果
		var select = document.getElementById("expert");
		select.options.length = 1;
		$("#expert").html(ajaxData);
	};
	function getExpertise() {
		var expertise = $("#expertise").val();
		var dataSend = "expertise=" + expertise;
		return dataSend;
	}
	
	//恢复默认值
	function setExpert(){
	console.log("wwwwwww");
	$("#expert").empty();
	console.log("tttttttt");
	}
</script>
<script type="text/javascript">
/*验证 2015年6月9日 11:50:24*/
function doAdd() {
		var expert=$("#expert").val();
		var quiz=$("#quiz").val();
		console.log(expert.value);
		if (expert =="选择专家") {
			alert("请选择专家！");
			return null ;
		}	
		if (expert =="") {
			alert("暂无相关领域专家，请重新选择专长进行查询！");
			return null ;
		}	
		if (quiz =="") {
			alert("请填写想要提问的问题！");
			return null;
		}
			$("#form").submit();
	}
</script>


</head>
<body onload="is_weixin()">
	<div id="page1" data-role="page">
		<div data-role="content" data-theme="e">
		<form id="form" method="post" action="saveExpertQuiz.do" >
					<div data-role="fieldcontain">
					<label for="fullname">查询专长*：</label> <input type="text"
						name="expertise" id="expertise" required="required">
						<input type="button" value="查询" onclick="getExpert()" onfocus="setExpert()"> 
				</div>
				 选择专家*： <select id="expert" name="expert">
					<option>选择专家</option>
				</select>
				<div data-role="fieldcontain">
					<label for="fullname">提问问题 *：</label> <input type="text"
						name="quiz" id="quiz" required="required">
				</div>
				
				<input type="button" data-inline="true" value="提交"
					onclick="doAdd()">  <input type="button"
					data-inline="true" value="关闭本窗口"
					onclick="WeixinJSBridge.call('closeWindow');" />
					<input type="hidden" id="stu_id" name="stu_id" value="${stu_id}">
			</form>
		</div>
		</div>
		
</body>
</html>




