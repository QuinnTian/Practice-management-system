<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
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
	function getCompany() {
		$.ajax({
			type : "get",
			/* contentType : "application/json", */
			url : "ajaxCompany.do?",
			data : getCanShu(), //设置发送参数，即使参数为空，也需要设置     
			//dataType : "jsonp",
       /*  jsonp: "callbackparam",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(默认为:callback)
                   jsonpCallback:"success_jsonpCallback",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名 */
			           
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法		
				console.log("gchjcvhjj");
				getPt(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert(status);
				}
			}
		});

	}
	function getPt(ajaxData) {//根据返回数据显示搜索结果
		console.log(ajaxData);
		$("#com_name").html(ajaxData);
	};
	function getCanShu() {
		var applicable_scope = $("#applicable_scope").val();
		var industry = $("#industry").val();
		var dataSend = "tiaojian=" + applicable_scope + "," + industry;
		return dataSend;
	}
</script>
</head>
<body>

	<form action="">
 
		：<select id="applicable_scope" name="applicable_scope">
			<option>请选择适用学院</option>
			<c:forEach var="applicable_scope" items="${company}"
				varStatus="stauts">
				<option value="${applicable_scope.applicable_scope}">${applicable_scope.applicable_scope}</option>
			</c:forEach>
		</select> 所属行业：<select id="industry" name="industry" onChange=getCompany()><option>请选择行业</option>
			<c:forEach var="industry" items="${company}" varStatus="stauts">
				<option value="${industry.industry}">${industry.industry}</option>

			</c:forEach>
		</select><select id="com_name" name="com_name"><option>请选择公司</option></select>
	</form>
	<br>

</body>
</html>
