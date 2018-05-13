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

</head>
<body>
	<div id="section_container">
		<section id="record_section" data-role="section" >
				<header>
					<div class="titlebar">
						<a data-toggle="back" href="#"><i class="iconfont iconline-arrow-left"></i></a>
						<h1>早操记录管理详情</h1>

					</div>
				</header>
				<article data-role="article" id="guideRecord" data-scroll="verticle" class="active" style="top:44px;bottom:0px;">
					<div class="scroller">
						<form  class="form-common">
						    <label class="label-left" >指标</label>
								<div class="label-right">
							    	<output >${standard_name}</output>
							    </div>
						    <hr/>
						    <label class="label-left" >检察人员</label>
								<div class="label-right">
							    	<output >${inspect_person}</output>
							    </div>
						    <hr/>
						    <label class="label-left">班级</label>
								<div class="label-right">
							    	<output >${class_name}</output>
							    </div>
						    <hr/>
						     <label class="label-left">得分</label>
								<div class="label-right">
							    	<output >${d.sum_grade}</output>
							    </div>
						    <hr/> 
						    <label class="label-left" >检查时间</label>
								<div class="label-right">
							    	<output >${time}</output>
							    </div>
						    <hr/>
						    <input type="hidden" id="f" name="f" value="${d.id}">
						</form>
						
						<div class="card noborder">
							<input type="button" class="block outline"  id="find" value="扣分项查看">
								
							
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
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/bridge/exmobi.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/bridge/agile.exmobi.js"></script>
	<!-- app -->
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/app/js/app.js"></script>
	<script type="text/javascript">
	
		$('#find').on(A.options.clickEvent, function() {
			var id=$("#f").val();
			location.href="morningExercisesAddPointsDetails.do?id="+id;
		});
	
	
	</script>
</body>
</html>
