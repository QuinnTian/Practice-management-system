<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>

<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<%=path%>/js/ichart.1.2.min.js"></script>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script language="javascript" type="text/javascript"
	src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
<title>招聘信息列表</title>
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
<body>
	<div id="section_container">
		<section id="RecruitmentInformationList_section" data-role="section">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i>
					</a>
					<h1>招聘信息列表</h1>
				</div>
			</header>
			<article data-role="article" id="main_article" class="active"
				data-scroll="verticle" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form autocomplete="off"
						oninput="range_output.value=parseInt(range.value)"
						class="form-common">
						<label class="label-left" for="company">企业名称</label> <label
							class="label-right"> <c:set var="com_id" value="${recruitInfo.com_id}" scope="request"></c:set>
				<%
					String com_id = (String) request.getAttribute("com_id");
				%><input type="hidden" name="com_id" id="com_id"
					value="${recruitInfo.com_id}"> <input type="text"
					value="<%out.println(DictionaryService.findCompany(com_id).getCom_name());%>"> </label>
						<hr />
						
						
						<label class="label-left">生效时间</label> <label class="label-right">
							<c:set var="effect_time" value="${recruitInfo.effect_time}" scope="request"></c:set>
				<%
					String e_time=(String) request.getAttribute("effect_time").toString().subSequence(0, 10);
				 %>
				<input type="text"  class="Wdate"
					onClick="WdatePicker()" name="effect_time" id="effect_time"
					value="<%=e_time%>"> </label>
						<hr />
						
						
						<label class="label-left" for="Expiration ">失效时间</label> <label
							class="label-right"> <c:set var="end_time" value="${recruitInfo.end_time}" scope="request"></c:set>
				<%
					String end_time=(String) request.getAttribute("end_time").toString().subSequence(0, 10);
				 %>
				<input type="text" name="end_time" id="end_time"
					class="Wdate" onClick="WdatePicker()"
					value="<%=end_time%> ">
						</label>
						<hr />
						
						
						<label class="label-left" for="Job ">岗位名称</label> <label
							class="label-right"> <input type="text" id="post_id"  name="post_id"
				value="${recruitInfo.post_id}"> </label>
						<hr />
						
						
						<label class="label-left" for="Professional">招聘专业</label> <label
							class="label-right"> <input type="text" name="recruit_prof" id="recruit_prof"
					value="${recruitInfo.recruit_prof}"> </label>
						<hr />
						
						
						<label class="label-left" for="number">招聘人数</label>
						<div class="label-right" id="number" href="#">
							<<input type="text" name="recruit_num" id="recruit_num"
					value="${recruitInfo.recruit_num}">
						</div>
						<hr />
						
						
						<p>&nbsp;</p>
						<div class="listitem">
							<label class="sliver">招聘描述:</label>
						</div>
						<div class="card">
							<textarea name="recruit_desc" id="recruit_desc" 
							rows="5" cols="30">${recruitInfo.recruit_desc}</textarea>
						</div>

					</form>
					<div class="card noborder">
						<button class="submit width-full" id="btn_confirm">推送信息</button>
					</div>
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
	<%-- <script type="text/javascript"
		src="<%=path%>/AgileLite/assets/bridge/exmobi.js"></script> --%>
		
		
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/bridge/agile.exmobi.js"></script>
	<!-- app -->
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/app/js/app.js"></script>
	<script
		src="<%=path%>/AgileLite/assets/component/timepicker/agile.timepicker.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/component/extend.js"></script>
	<script>
		(function() {

			$('#btn_confirm').on(A.options.clickEvent, function() {
				A.alert('提示', '推送成功！')

				return false;
			});

		})();
	</script>
</body>
</html>
