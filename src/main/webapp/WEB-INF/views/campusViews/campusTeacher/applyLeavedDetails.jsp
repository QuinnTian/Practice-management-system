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
<title>教师端</title>
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
		<section id="TaskDetails_section" data-role="section">
				<header>
					<div class="titlebar">
						<a data-toggle="back" href="#"><i class="iconfont iconline-arrow-left"></i></a>
						<h1> 申请详情</h1>
					</div>
				</header>
				<article data-role="article" id="main_article" data-scroll="verticle" class="active" style="top:44px;bottom:0px;">
					<div class="scroller">
						<form autocomplete="off" oninput="range_output.value=parseInt(range.value)" class="form-common" name="form">
							<label class="label-left" >申请类型</label>
							<div style="height:auto;" class="label-right">
								<output  >
								${sla_type}
								</output>
							</div>
							<hr>
							<label class="label-left" >地点</label>
							<div style="height:auto;" class="label-right">
								<output >
									${application.sla_place}
								</output>
							</div>
							<hr>

							<label class="label-left" >申请级别</label>
							<div style="height:auto;" class="label-right">
								<output >
									${sla_rank}
								</output>
							</div>
							<hr>
							<label class="label-left" >开始时间</label>
							<div style="height:auto;" class="label-right">
								<output  >
									${application.sla_begin_time}
								</output>
							</div>
							<hr>
							<label class="label-left" >结束时间</label>
							<div style="height:auto;" class="label-right">
								<output>
									${application.sla_end_time}
								</output>
							</div>
							<hr>
							<label class="label-left" >时长</label>
							<div style="height:auto;" class="label-right">
								<output>
									${application.sla_duration}
								</output>
							</div>
							<hr>
							<label class="label-left" >原因描述</label>
							<div style="height:auto;" class="label-right">
								<output  >
									${application.sla_reason_desc}
								</output>
							</div>
							<hr>
							<label class="label-left" >申请人</label>
							<div style="height:auto;" class="label-right">
								<output  >
									${student.true_name}
								</output>
							</div>
							<hr>
							<label class="label-left" >所在班级</label>
							<div style="height:auto;" class="label-right">
								<output  >
									${class_name}
								</output>
							</div>
							<hr>
							<label class="label-left" >联系电话</label>
							<div style="height:auto;" class="label-right">
								<output  >
									${student.phone}
								</output>
							</div>
							<hr>
							<div class="listitem">
								<lable class="sliver">
									意见
								</lable>

							</div>
							<input type="hidden"/>
							<div id="opinion" class="card noborder">
								<output rows="5"> ${opinion}  </output>
							</div>
						</form>
						<nav class="menubar"  style="width: 100% ; background-color: #FFFFFF; text-align:center;" >
							
						</nav>
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
</body>
</html>
