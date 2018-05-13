<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
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
    function checkComName(){
    	var com_name = document.getElementById("com_name").value;
    	$.ajax({
					type : "get",
					contentType : "application/json",
					url : "ajaxCheckComName.do?",
					data : "com_name=" + com_name,
					dataType : "text",
					success : function(data) {
						console.log("ajax返回成功");
						showStus(data);
					},
					error : function(result, status) {
						if (status == 'error') {
							A.alert(status);
						}
					}
				});
				
		function showStus(ajaxData) {
			$("div[id ='d']").remove();
			$("#div").html(ajaxData);
		}
    }
	function doAdd() {
		var industry = document.getElementById("industry");
		var mark = document.getElementById("mark");
		if (mark.value == "2") {
			alert("当前企业已存在，请直接填写实习申请！");
			return;
		}
		if (industry.value == "请选择行业") {
			alert("请选择行业");
			return;
		}
		$("#form").submit();
	}
</script>
<title>新增单位</title>
</head>
<body onload="is_weixin()">
	<div id="page1" data-role="page">
		<div data-role="content" data-theme="e">
			<form name="form1" id="form" method="post" action="saveCompany.do">

				<div data-role="fieldcontain">

					<label for="fullname">企业名称 *：</label> <input type="text"
						name="com_name" id="com_name" value="${company.com_name}" onblur="checkComName()">
						<div id = "div"></div>
				</div>
				<div data-role="fieldcontain">
					<label for="fullname">企业短名 *：</label> <input type="text"
						name="short_name" id="short_name" value="${company.short_name}">
				</div>
				<div data-role="fieldcontain">
					<label for="fullname">行业范围 *：</label><select id="industry"
						name="industry"><option>请选择行业</option>
						<c:forEach var="industry" items="${mapIndustry}"
							varStatus="stauts">
							<option value="${industry.key}">${industry.value}</option>
						</c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain">
					<label for="fullname">企业联系人*：</label> <input type="text"
						name="contacts" id="contacts" value="${company.contacts}">
				</div>
				<div data-role="fieldcontain">
					<label for="fullname">企业联系人电话 *：</label> <input type="text"
						name="phone" id="phone" value="${company.phone}">
				</div>
				<div data-role="fieldcontain">
					<label for="fullname">企业地址：</label>
					<textarea name="address" style="width:290px;height:70px;">${company.address}</textarea>
					<input type="hidden" name="applicable_scope" id="applicable_scope"
						value="${company.applicable_scope}">
				</div>
				<div data-role="fieldcontain">
					<label for="fullname">Email ：</label> <input type="text"
						name="email" id="email" value="${company.email}">
				</div>
				<div data-role="fieldcontain">
					<input type="hidden" name="check_state" id="check_state"
						value="${company.check_state}">
				</div>
				<input type="button" data-inline="true" value="提交" onclick="doAdd()" id="commit">
				<input type="button" data-inline="true" value="关闭本窗口"
					onclick="WeixinJSBridge.call('closeWindow');" />
			</form>

			<script>
				$('#page1').bind('pageinit', function(event) {
					$('form').validate({
						rules : {
							com_name : {
								required : true
							},
							contacts : {
								required : true
							},
							phone : {
								required : true,
								number : true
							},
							email : {
								email : true
							}
						}
					});
				});
			</script>
		</div>
	</div>

</body>
</html>

