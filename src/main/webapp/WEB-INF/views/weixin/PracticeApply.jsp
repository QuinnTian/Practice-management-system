<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<!DOCTYPE>

<html>
<head>
<title>实习申请</title>
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
	var isCommitted = false;//表单是否已经提交标识，默认为false
	function doAdd() {
		if (isCommitted == false) {
			var post_id = document.getElementById("post_id");
			var com_name = document.getElementById("com_name");
			var leader = document.getElementById("leader");
			var work_orgion = document.getElementById("work_orgion");
			var com_orgion = document.getElementById("com_orgion");
			if (com_name.value == "1") {
				alert("请通过下拉菜单选择实习单位");
				return;
			}
			if (com_name.value == "1") {
				alert("请通过下拉菜单选择实习单位");
				return;
			}
			if (post_id.value == "") {
				alert("请填写岗位名称");
				return;
			}
			if (leader.value == "") {
				alert("请填写部门领导");
				return;
			}
			if (work_orgion.value == "") {
				alert("请填写工作所在地");
				return;
			}
			if (com_orgion.value == "") {
				alert("请填写公司所在地");
				return;
			}
			$("#form").submit();
			isCommitted = true;//提交表单后，将表单是否已经提交标识设置为true
			return true;//返回true让表单正常提交
		} else {
			alert("请不要重复提交！");
		}

	}

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
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			scriptCharset : "utf-8",
			success : function(data) { //成功时执行的方法		

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
		//级联查询
		/* var applicable_scope = $("#applicable_scope").val();
		var industry = $("#industry").val();
		var dataSend = "tiaojian=" + applicable_scope + "," + industry;
		return dataSend; */
		//模糊查询 2015年7月3日 09:22:09邢志武
		var companyName = $("#companyName").val();
		var dataSend = "companyName=" + companyName;
		return dataSend;
	}
	/*
	 iphone不支持onkeyup事件
	 加入兼容 
	 周睿20160720
	 */
	$(function() {
		var bind_name = "input";
		if (navigator.userAgent.indexOf("MSIE") != -1) {
			bind_name = "propertychange";
		}
		$('#companyName').bind(bind_name, function() {
			getCompany();
		});
	});
</script>
</head>
<body onload="is_weixin()">

	<div id="page1" data-role="page">
		<div data-role="content" data-theme="e">
			<form id="form" method="post" action="savePracticeApply.do">
				<div data-role="fieldcontain">

					<c:set var="sc" value="${practiceRecord.stu_id}" scope="request"></c:set>
					<%
						String str_stu_id = (String) request.getAttribute("sc");
					%>
					<label for="fullname">学号 *：</label><input type="text"
						name="stu_code"
						value="<%out.println(DictionaryService.findStudent(str_stu_id).getStu_code());%>"
						readonly> <input type="hidden" name="stu_id"
						value="${practiceRecord.stu_id}">
				</div>
				<div data-role="fieldcontain">
					<input type="hidden" value="${pt.id}" name="pracktask_id">
					<c:set var="sc" value="${pt.id}" scope="request"></c:set>
					<%
						String pdr = (String) request.getAttribute("sc");
					%>
					<label for="fullname">实践任务 *：</label><input type="text"
						name="task_name"
						value="<%out.println(DictionaryService.findPracticeTask(pdr).getTask_name());%>"
						readonly> <input type="hidden" name="praid"
						value="${pt.id}">
				</div>
				<%-- <label for="fullname">适用学院 *：</label> <select id="applicable_scope"
					name="applicable_scope">
					<option>请选择适用学院</option>
					<c:forEach var="applicable_scope" items="${college}"
						varStatus="stauts">
						<option value="${applicable_scope.id}">${applicable_scope.org_name}</option>
					</c:forEach>
				</select> 所属行业：<select id="industry" name="industry" onChange=getCompany()><option>请选择行业</option>
					<c:forEach var="industry" items="${mapIndustry}" varStatus="stauts">
						<option value="${industry.key}">${industry.value}</option>
					</c:forEach>
				</select><select id="com_name" name="com_name"> <option >实习单位</option> 
				</select>  --%>
				<div data-role="fieldcontain">
					<label for="fullname">公司查询（请输入关键字，选择实习单位；若查询不到，请在聊天界面回复xzqy，填写企业信息之后进行实习申请）：</label>
					<input type="text" name="companyName" id="companyName"
						required="required" placeholder="例如：山东商业职业技术学院">
					<!-- <input type="button" value="查询" onclick="getCompany()">  -->
					<select id="com_name" name="com_name">
						<option value="1">实习单位(必选)</option>
					</select>
				</div>
				<div data-role="fieldcontain">
					<label for="fullname">岗位名称 *：</label> <input type="text"
						name="post_id" id="post_id" value="${pr.post_id}"
						placeholder="例如：Java程序员" required="required">
				</div>
				<fieldset data-role="controlgroup" data-type="horizontal">
					<legend>可否网签：</legend>
					<label for="male">可以</label> <input type="radio" name="is_netsign"
						id="male" value="1" checked="checked"> <label for="female">不可以</label>
					<input type="radio" name="is_netsign" id="female" value="2">
				</fieldset>

				<fieldset data-role="controlgroup" data-type="horizontal">
					<legend>可否签就业合同：</legend>
					<label for="male">可以</label> <input type="radio" name="is_contract"
						id="male" value="1" checked="checked"> <label for="female">不可以</label>
					<input type="radio" name="is_contract" id="female" value="2">
				</fieldset>
				<%-- 	<div data-role="fieldcontain">
					<label for="fullname">企业指导老师 *：</label> <input type="text"
						name="com_teacher" id="com_teacher"
						value="${pr.com_teacher}">
				</div>
				<div data-role="fieldcontain">
					<label for="fullname">企业老师电话 *：</label> <input type="text"
						name="com_phone" id="com_phone"
						value="${pr.com_phone}">
				</div> --%>
				<div data-role="fieldcontain">
					<label for="fullname">部门领导* ：</label> <input type="text"
						required="required" name="leader" id="leader" value="${pr.leader}"
						placeholder="例如：王老师">
				</div>
				<div data-role="fieldcontain">
					<label for="fullname">公司所在地 ：</label> <input type="text"
						name="com_orgion" id="com_orgion" value="${pr.com_orgion}"
						required="required" placeholder="例如：山东省济南市">
				</div>
				<div data-role="fieldcontain"></div>
				<div data-role="fieldcontain">
					<label for="fullname">工作所在地* ：</label> <input type="text"
						name="work_orgion" id="work_orgion" value="${pr.work_orgion}"
						required="required" placeholder="例如：山东省济南市">
				</div>
				<!-- <button value="提交" onclick="doAdd()"></button> -->
				<input type="button" data-inline="true" value="提交" onclick="doAdd()">
				<input type="button" data-inline="true" value="关闭本窗口"
					onclick="WeixinJSBridge.call('closeWindow');" />
			</form>
		</div>
	</div>
</body>
</html>

