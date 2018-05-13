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
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconform.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/component/timepicker/timepicker.css">
<link rel="stylesheet" href="<%=path%>/AgileLite/assets/app/css/app.css">

	
</head>
<%-- <head>
<meta charset="UTF-8">
<meta name="viewport"
	content="height = device-height,
	width = device-width,
	initial-scale = 1,
	minimum-scale = 0.1,
	maximum-scale = 3,
	user-scalable = yes,<!-- 
	target-densitydpi = device-dpi -->
	" />
</head> --%>
<body>
	<div id="section_container">
		<section id="aside_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"> <i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>招聘信息添加</h1>
				</div>
			</header>
			<article data-role="article" id="main_article" data-scroll="verticle"
				class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
				<form autocomplete="off" 
					class="form-square" name="form1" id="form1" method="post"
		action="doAddRecruitInfo.do">
					<label class="label-left">所属行业</label> <label class="label-right">
						<select id="industry" name="industry"
					style=" width:200px" onChange="getCompany()"><option
							value="0">请选择行业</option>
						<c:forEach var="industry" items="${mapIndustry}"
							varStatus="stauts">
							<option value="${industry.key}">${industry.value}</option>
						</c:forEach>
				</select> </input> 
				
				</label> <label
						class="label-left">企业名称</label> <label class="label-right">
						<select name="com_id" id="com_id"
					style="width:200px;font-family: sans-serif">
						<option value="0">请选择</option>
				</select> </label> 
				
				<label class="label-left">岗位名称：
					</label> <label class="label-right"> <input type="text" id="post_id" name="post_id"
					style=" width: 200px"> </input> </label>

					<label class="label-left">招聘专业： </label> <label
						class="label-right"> <input type="text" id="recruit_prof"
					name="recruit_prof" style=" width: 200px" /> </label>
					
					 <!-- <label
						class="label-left">开始时间</label> <label class="label-right">
						<input type="text" id="recruit_eff"
					name="recruit_eff" style=" width: 200px" class="Wdate"
					onClick="WdatePicker()" /> </label> 
					
					<label class="label-left">截止时间</label>
					<label class="label-right"> <input type="text" id="recruit_end"
					name="recruit_end" style=" width: 200px" class="Wdate"
					onClick="WdatePicker()" /> </label>  -->
					
					<label class="label-left"
							for="date">生效时间</label>
						<div data-role="date" class="label-right">
							<label>请选择日期</label> <input type="hidden" id="recruit_eff"
					name="recruit_eff" />
						</div>
						
						<label class="label-left" for="date">截止时间</label>
						<div data-role="date" class="label-right">
							<label>请选择日期</label> <input type="hidden" id="recruit_end"
					name="recruit_end" />
						</div>
					
					<label
						class="label-left">招聘人数</label> <label class="label-right">
						<input type="text" id="recruit_num"
					name="recruit_num" style=" width: 200px" /> </label> 
					
					
					<div class="form-group">
						<div class="listitem">
							<label class="sliver">描述:</label>
						</div>
						<div class="card">
							<textarea rows="5" class="noborder" id="recruit_desc" name="recruit_desc">
								</textarea>
						</div>
					</div>
					<div class="card noborder">
					<input type="button" id="save" name="save" value="保存" onclick="save()" />
				</div>
				</form>
			</div>
			</atricle>

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
	<%-- <script type="text/javascript"
		src="<%=path%>/AgileLite/assets/bridge/exmobi.js"></script> --%>
		
		
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/bridge/agile.exmobi.js"></script>
	<!-- app -->
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/app/js/app.js"></script>
		<script src="<%=path%>/AgileLite/assets/component/timepicker/agile.timepicker.js"></script>
	<script type="text/javascript" src="<%=path%>/AgileLite/assets/component/extend.js"></script>
	<script type="text/javascript">
	function getCompany() {
		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "ajaxgetCompanyByIndustry.do?",
			data : getTeaData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "json", //返回的类型为json                
			success : function(data) { //成功时执行的方法

				showCom(data);

			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
                  alert("出错了！");
				}
			}
		});
	}
	
	function getTeaData() {
		var val = $("#industry").val();
		var dataSend = "industry=" + val;
		return dataSend;
	}
	
	function showCom(ajaxData) {
		var com = eval(ajaxData);
		console.log(ajaxData);
		var select = document.getElementById("com_id");
		select.options.length = 1;

		if (com.length > 0) {

			for ( var i = 0; i < com.length; i++) {
				console.log(com[i]);
				select.options.add(new Option(com[i].com_name, com[i].id));
			}
		}

	}
	
	
	
	$('#save').on(A.options.clickEvent,function(){
		 var industry = $("#industry").val();//获取行业
		var com_id = $("#com_id").val();//获取企业名称
		var post_id = $("#post_id").val();//获取岗位名称
		var recruit_prof = $("#recruit_prof").val();//招聘专业
		var recruit_desc = $("#recruit_desc").val();//招聘描述
		var recruit_num = $("#recruit_num").val();//招聘人数
		var recruit_eff = $("#recruit_eff").val();//开始时间
		var recruit_end = $("#recruit_end").val();//截止时间

		if (industry == "0") {

			alert("请选择所属行业！");
			return;
		}
		if (com_id == "0") {

			alert("请选择企业！");
			return;
		}
		if (post_id == "") {

			alert("请填写岗位名称！");
			return;
		}
		if (recruit_prof == "") {

			alert("请填写招聘的专业！");
			return;
		}
		if (recruit_desc == "") {

			alert("请填写招聘描述！");
			return;
		}
	
		if (recruit_num == "") {

			alert("请填写招聘人数！");
			return;
		}
		if (isNaN(recruit_num)) {

			alert("招聘人数必须是数字！");
			return;
		}
		if (recruit_eff == "") {

			alert("请选择生效时间！");
			return;
		}
		if (recruit_end == "") {

			alert("请选择结束时间！");
			return;
		}
		if (recruit_end < recruit_eff) {
			alert("结束时间不能够早于开始时间，请重新选择！");
			return null;
		} 

		document.form1.submit();
	});
	</script>
</body>
</html>
