<%@page import="com.sict.service.DictionaryService"%>
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
<title>学生端</title>
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
	href="<%=path%>/AgileLite/assets/component/timepicker/timepicker.css">
<link rel="stylesheet" href="<%=path%>/AgileLite/assets/app/css/app.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconform.css">
</head>
<body>
	<div id="section_container">
			<section id="form_section" data-role="section" class="active">
				<header>
					<div class="titlebar">
						<a data-toggle="back" href="#"><i class="iconfont iconline-arrow-left"></i></a>
						<h1>班级分配</h1>
					</div>
				</header>
				<article data-role="article" id="guideRecord" data-scroll="verticle" class="active" style="top:44px;bottom:0px;">
					<div class="scroller">
						<form autocomplete="off" name="bjfp" oninput="range_output.value=parseInt(range.value)" class="form-square">
							<label class="label-left" >检查人</label>
							<div data-role="select" class="label-right">
								<select name="sel" id="sel">
								<option>请选择检查人</option>
								<c:forEach var="s" items="${asso}">
								<option value="${s.sam_stu_id}" id="sel">
								<c:set var="sam_stu_id" value="${s.sam_stu_id}" scope="request"></c:set>
								<%
							String sam_stu_id = (String) request.getAttribute("sam_stu_id");
							out.print(DictionaryService.findStudent(sam_stu_id).getTrue_name());
								%>
								
								</option>
								</c:forEach>
								</select>
							</div>
							<label class="label-left" >入学年份</label>
							<div id="showClass" data-role="select"class="label-right">
								<select name="year" id="year" onchange="getTheClass()">
									<option value="">请选择年级</option>
									<c:forEach items="${trueyear}" var="t">
										<option value="${t}">${t}</option>
									</c:forEach>
								</select>
							</div>
						</form>
						
						<button class="block outline" id="dosave">保存</button>
						<input type="hidden" id="collage" value="${collage}"/>
						<input type="hidden" id=standardId value="${standardId}"/>
					</div>
				</article>
			</section>
		</div>
	<!--- third --->
	<script src="<%=path%>/AgileLite/assets/third/jquery/jquery-2.1.3.min.js"></script>
	<script
		src="<%=path%>/AgileLite/assets/third/jquery/jquery.mobile.custom.min.js"></script>
	<script src="<%=path%>/AgileLite/assets/third/iscroll/iscroll-probe.js"></script>
	<script src="<%=path%>/AgileLite/assets/third/arttemplate/template-native.js"></script>
	<!-- agile -->
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/agile/js/agile.js"></script>
	<!--- bridge --->
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/bridge/exmobi.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/bridge/agile.exmobi.js"></script>
	<!-- app -->
	<script type="text/javascript" src="<%=path%>/AgileLite/assets/app/js/app.js"></script>
	<script
		src="<%=path%>/AgileLite/assets/component/timepicker/agile.timepicker.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/component/extend.js"></script>
<script type="text/javascript">
function getTheClass(){
			
			var year = document.getElementById("year").value;//入学年份
			var collage = $("#collage").val();
			var dataSend = "year=" + year+"&collage="+collage;
			$.ajax({
				type : "post",
				url : "getTheClass.do",
				data : dataSend, //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法	
					showStus(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
					}
				}
			});
		}	
		function showStus(ajaxData) {
		$("label[id ='c']").remove();
		$("div[id ='cc']").remove();
			$("#showClass").after(ajaxData);
		}	
		</script>
		<script type="text/javascript">
		$('#dosave').on(A.options.clickEvent, function(){ 
		var standardId =document.getElementById("standardId").value;//指标id
		var sel = document.getElementById("sel").value;//检查人
		var year = document.getElementById("year").value;//年级
		var classs = document.getElementById("classs").value;//班级
		var dataSend = "year=" + year+"&sel="+sel+"&classs="+classs+"&standardId="+standardId;
		$.ajax({
				type : "post",
				url : "doSaveThis.do",
				data : dataSend, //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法	
					alert("保存成功");
					window.location.href= "classDistribution.do";
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
					alert("保存失败："+error);
					}
				}
			});
		});
</script>
</body>
</html>
