<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<%=path%>/js/ichart.1.2.min.js"></script>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<title>实践教学管理</title>
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/agile.layout.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/flat.component.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/flat.color.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconline.css">


</head>
<body>
	<div id="section_container">
		<section id="aside_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"> <i
						class="iconfont iconline-arrow-left"></i></a>
					<h1>实习申请</h1>
				</div>
			</header>
			<article data-role="article" id="practice_article"
				data-scroll="verticle" class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form autocomplete="off" oninput="range_output.value=parseInt(range.value)" class="form-common">
						<label class="label-left" for="user">学号：</label> <label
							class="label-right"> <output id="stu_code" required>${stu_code}</output>
						</label>
						<hr />
						<label class="label-left" for="text">实践任务：</label> <label
							class="label-right"> <c:forEach items="${practice_task}"
								var="c">
								<output id="task_name">${c.task_name}</output>
								<input type="hidden" id="task_id" value="${c.id}">
								<input type="hidden" id="stu_id" value="${stu_id}">
							</c:forEach> </label>
						<hr />

						<div data-role="fieldcontain">
							<label class="label-left" for="text" for="fullname">公司查询*：</label>
							<input class="label-right" type="text" name="companyName"
								id="companyName" required="required" placeholder="例如：山东商业职业技术学院" onblur="search()">
							
							<select style="width: 100%" id="com_name" name = "com_name">
								<option value="1">实习单位</option>
							</select>
						</div>
						
						<label class="label-left" for="text">岗位名称：</label> <label
							class="label-right"> <input id="work_name" type="text"
							value="" placeholder="例如：java程序员" autocomplete="on" /> </label>
						<hr />
						 <label class="label-left" style="height:40px;">可否网签</label>
						 <label class="label-right" style="height:40px;">
						 <div id="is_net" class="toggle" data-role="toggle" data-on="是"
								data-on-value="1" data-off="否" data-off-value="2"
								style="margin-top:4px;"></div> </label>
						<hr />
						<label class="label-left" style="height:40px;">可否签就业合同</label>
						<label class="label-right" style="height:40px;">
						<div id="is_con" class="toggle" data-role="toggle" data-on="是"
								data-on-value="1" data-off="否" data-off-value="2"
								style="margin-top:4px;"></div> </label>
						<hr />
						
						<label class="label-left" for="user" >部门领导：</label> <label
							class="label-right"> <input id="deptAdmin" type="text"
							value="" placeholder="例如：王老师" /> </label>
						<hr />
						<label class="label-left" for="user" >公司所在地：</label> <label
							class="label-right"> <input id="comPla" type="text"
							value="" placeholder="例如：山东省济南市" /> </label>
						<hr />
						<label class="label-left" for="user" >工作所在地：</label> <label
							class="label-right"> <input id="workPla" type="text"
							value="" placeholder="例如：山东省济南市" /> </label>
						<hr />
						<input type="hidden" id="check_state" value="${check_state}" />
						<button class="block submit" onclick="doSubmit()">
							<i class="iconfont iconline-rdo-tick"></i> <span>提交</span>
						</button>
					</form>
				</div>
			</article>
		</section>
	</div>
	<!--- third --->
	<script
		src="<%=path%>/AgileLite/assets/third/jquery/jquery-2.1.3.min.js"></script>
	<script
		src="<%=path%>/AgileLite/assets/third/jquery/jquery.mobile.custom.min.js"></script>
	<script src="<%=path%>/AgileLite/assets/third/iscroll/iscroll-probe.js"></script>
	<script
		src="<%=path%>/AgileLite/assets/third/arttemplate/template-native.js"></script>
	<!-- agile -->
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/agile/js/agile.js"></script>
	<!--- bridge --->
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/bridge/exmobi.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/bridge/agile.exmobi.js"></script>
	<!-- app -->
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/app/js/app.js"></script>

	<script>
	
		function search(){
					$.ajax({
						type : "get",
						url : "ajaxCompany.do?",
						data : getCanShu(), //设置发送参数，即使参数为空，也需要设置     
						dataType : "text", //返回的类型为json  
						contentType : "application/x-www-form-urlencoded; charset=utf-8",
						scriptCharset : "utf-8",
						success : function(data) { 
						//成功时执行的方法		
							getPt(data);
						},
						error : function(result, status) { //出错时会执行这里的回调函数                     
							if (status == 'error') {
								alert(status);
							}
						}
					});
				return false;

		};

	function getPt(ajaxData) {//根据返回数据显示搜索结果
		console.log(ajaxData);
		$("#com_name").html(ajaxData);
	};
	function getCanShu() {
		//模糊查询 2015年7月3日 09:22:09邢志武
		var companyName = $("#companyName").val();
		var dataSend = "companyName=" + companyName;
		return dataSend;
	}
</script>
<script type="text/javascript">

function doSubmit(){
var isCommitted = document.getElementById("check_state").value;
 	if (isCommitted == "false") {
			var com_name = document.getElementById("com_name");
			var deptAdmin = document.getElementById("deptAdmin");
			var comPla = document.getElementById("comPla");
			var workPla = document.getElementById("workPla");
			var work_name = document.getElementById("work_name");
			if (com_name.value == "请选择实习单位") {
				alert("请通过下拉菜单选择实习单位");
				return false;
			}
			if (work_name.value == "") {
				alert("请填写岗位名称");
				return false;
			}
			if (deptAdmin.value == "") {
				alert("请填写部门领导");
				return false;
			}
			if (workPla.value == "") {
				alert("请填写工作所在地");
				return false;
			}
			if (comPla.value == "") {
				alert("请填写公司所在地");
				return false;
			}
			doSubmit2();  
			isCommitted = true1;//提交表单后，将表单是否已经提交标识设置为true
			return true1;
		} else if (isCommitted = "true")  {
			alert("您处于有效实习 状态，请不要重复提交！");
		} else if(isCommitted = "true1")  {
			alert("您已提交申请，请不要重复提交！");
		} 
}



function doSubmit2() {
		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "ajaxSubmitAppl.do?",
			data : getData(),      
			dataType : "text", //返回的类型为json
			success : function(data) {
				alert(data+"保存成功");
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert(status+"err");
				}
			}
		});}
function getData(){
				
			var stu_id = document.getElementById("stu_id").value;
			var com_name = document.getElementById("com_name").value;
			var task_id = document.getElementById("task_id").value;
			var work_name = document.getElementById("work_name").value;
	/* 	 	var is_net = document.getElementById("is_net").value;
			var is_con = document.getElementById("is_con").value; */ 
			var deptAdmin = document.getElementById("deptAdmin").value;
			var comPla = document.getElementById("comPla").value;
			var workPla = document.getElementById("workPla").value;

			/* + "&is_con=" + is_con + "&is_net=" + is_net */
		var dataSend = "stu_id="+stu_id+ "&task_id=" +task_id + "&work_name=" + work_name
			  + "&com_name=" + com_name + "&deptAdmin=" + deptAdmin+
			  "&comPla=" + comPla+ "&workPla=" + workPla;
				  return dataSend;
		}
</script>
</body>

</html>
