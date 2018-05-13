<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>核对信息</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script src="<%=path%>/js/jquery.validate.js"></script>
</head>
<body onload="is_weixin()">
	<div id="page1" data-role="page">
		<div data-role="content" data-theme="e">
			<form name="form1" id="myform" method="post" action="saveInfo.do">
				<div data-role="fieldcontain">
					<c:set var="sc" value="${stu_id}" scope="request"></c:set>
					<%
						String str_stu_id = (String) request.getAttribute("sc");
					%>
					<label for="fullname">学号 *：</label><input type="text"
						name="stu_ids"
						value="<%out.println(DictionaryService.findStudent(str_stu_id).getStu_code());%>"
						readonly> <input type="hidden" name="stu_id"
						value="${stu_id}">
					<div data-role="fieldcontain">
						<c:set var="sc" value="${checktask_id}" scope="request"></c:set>
						<%
							String pdr = (String) request.getAttribute("sc");
						%>
						<label for="fullname">实践任务 *：</label><input type="text"
							name="task_name"
							value="<%out.println(DictionaryService.findPracticeTask(pdr).getTask_name());%>"
							readonly> <input type="hidden" name="infoid"
							value="${infoid}"> <label for="fullname">任务描述 *：</label><input
							type="text" name="checktaskchecktaskdes"
							value="<%out.println(DictionaryService.findPracticeTask(pdr).getTask_desc());%>"
							readonly>
					</div>

					<fieldset data-role="controlgroup" data-type="horizontal">
						<legend>核对结果：</legend>
						<label for="male">正确</label> <input type="radio"
							name="check_result" id="male" value="1"> <label
							for="female">修改</label> <input type="radio" name="check_result"
							id="female" value="2">
					</fieldset>
					<label for="fullname">备 注 ：</label> <input type="text" name="note"
						id="note" value="${s.note}"> <input type="submit"
						data-inline="true" value="提交" onclick="WeixinJSBridge.call();">
					<input type="button" data-inline="true" value="关闭本窗口"
						onclick="WeixinJSBridge.call('closeWindow');" />
				</div>
			</form>
		</div>
	</div>
	<script>
		$('#page1').bind('pageinit', function(event) {
			var s = $("input:radio[name='check_result']").val();
			if (s == '2') {
				$('input').validate({
					rules : {
						note : {
							required : true
						}
					}
				});
			}
		});
	</script>

</body>
</html>
