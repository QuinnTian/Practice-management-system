<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>

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
<link type="text/css"
	href="http://dev.jtsage.com/cdn/datebox/latest/jqm-datebox.min.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="http://dev.jtsage.com/cdn/datebox/latest/jqm-datebox.core.min.js"></script>
<script type="text/javascript"
	src="http://dev.jtsage.com/cdn/datebox/latest/jqm-datebox.mode.datebox.min.js"></script>
<script type="text/javascript"
	src="http://dev.jtsage.com/cdn/datebox/i18n/jquery.mobile.datebox.i18n.en_US.utf8.js"></script>
<script type="text/javascript">
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideOptionMenu');
		WeixinJSBridge.call('showToolbar');
	});

	function changeSelectName(id) {
		var name = document.getElementById(id + "_code").options[document
				.getElementById(id + "_code").selectedIndex].text;
		document.getElementById(id + "_name").value = name;
	}

	function is_weixin() {
		var ua = navigator.userAgent.toLowerCase();
		if (ua.match(/MicroMessenger/i) == "micromessenger") {

		} else {
			/* window.location.href = "http://www.baidu.com"; */
		}
	}
	
</script>
<title>实习记录</title>
</head>
<body onload="is_weixin()">
	<div data-role="content" data-theme="e">
		<form name="form1" id="myform" method="post"
			action="savePracticeState.do">
			<div data-role="fieldcontain">
			<input type="hidden" name="stu_id" id="stu_id" value="${stu_id}">
			<c:set var="sc" value="${stu_id}" scope="request"></c:set>
				<%
					String str_stu_id = (String) request.getAttribute("sc");
				%>
				<label for="fullname">学号 *：</label><input type="text"
					name="stu_code"
					value="<%out.println(DictionaryService.findStudent(str_stu_id).getStu_code());%>" readonly>
			<div data-role="fieldcontain">
					<c:set var="sc" value="${pt.id}" scope="request"></c:set>
					<%
						String pdr = (String) request.getAttribute("sc");
					%>
					<label for="fullname">实践任务 *：</label><input type="text"
						name="task_name" value="<%out.println(DictionaryService.findPracticeTask(pdr).getTask_name());%>" readonly>
					<input type="hidden" name="checktask_id" id="checktask_id" value="${pt.id}">
					<input type="hidden" name="practicerecord" id="practicerecord" value="${practicerecord}">
				</div>
					<label for="fullname"> 到岗时间*：</label> <input name="work_time" required="required"
					id="frmMain_txt_SB_SERVERTIME" type="date" data-role="datebox"
					data-options='{"mode": "datebox"}'> <label for="fullname">实习协议时间*：</label>
				<input name="prct_contract_time" id="frmMain_txt_SB_SERVERTIME" type="date" required="required"
					data-role="datebox" data-options='{"mode": "datebox"}'> <label
					for="fullname">网签时间 ：</label> <input name="netsign_time" 
					id="netsign_time" type="date" data-role="datebox"
					data-options='{"mode": "datebox"}'> <label for="fullname">合同时间
					：</label> <input name="contract_time" id="contract_time" type="date" 
					data-role="datebox" data-options='{"mode": "datebox"}'> <label
					for="fullname">离职时间 *：</label><input name="dimission_time" required="required"
					id="dimission_time" type="date" data-role="datebox"
					data-options='{"mode": "datebox"}'> <input type="hidden" required="required"
					name="state" id="state" value=""> <input type="submit"
						data-inline="true" value="提交" onclick="WeixinJSBridge.call();"> <input
					type="button" data-inline="true" value="关闭本窗口"
					onclick="WeixinJSBridge.call('closeWindow');" /> <input
					type="hidden" data-inline="true" value="测试" onclick="is_weixin();" />
			</div>
		</form>
	</div>
</body>
</html>

