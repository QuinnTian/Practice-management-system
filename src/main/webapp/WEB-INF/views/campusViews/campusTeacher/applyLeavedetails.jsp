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
							<input type="hidden" id="id" value="${id}"/>
							<div class="card noborder">
								<textarea rows="5" id="opinion"> </textarea>
							</div>
						</form>
						<nav class="menubar"  style="width: 100% ; background-color: #FFFFFF; text-align:center;" >
							<div>
								<button id="agree" class="submit" style="margin-right: 10px;"  data-toggle="modal">
									<i class="iconfont iconline-rdo-tick"></i>
									<span>同意</span>
								</button>
								<button class="cancel" id="disagree">
									<i class="iconfont iconline-rdo-cancel"></i>
									<span>不同意</span>
								</button>
								<button id="submit">
									<i class="iconfont iconline-rdo-tick"></i>
									<span>上交</span>
								</button>
							</div>
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
<script>
 
			(function() {
			$('#submit').on(A.options.clickEvent, function() {
			var state=1;
			var id = document.getElementById("id").value;
			var opinion = document.getElementById("opinion").value;
			$.ajax({
			type : "post",
			url : "ajaxcheck.do?i=1"+"&id="+id+"&opinion="+opinion, 
			data:null,               
			success : function(data) { //成功时执行的方法	
				A.confirm("提示","上交成功！",function(){
				/* location.href = "internshipApproval.do"; */
				},function(){
				return false;
				});
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					A.alert("上交失败！");
			}	}});
				});
			
			$('#agree').on(A.options.clickEvent, function() {
			var state=1;
			var id = document.getElementById("id").value;
			var opinion = document.getElementById("opinion").value;
			$.ajax({
			type : "post",
			url : "ajaxcheck.do?i=2"+"&id="+id+"&opinion="+opinion, 
			data:null,               
			success : function(data) { //成功时执行的方法	
				A.confirm("提示","通过成功！",function(){
				},function(){
				return false;
				});
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					A.alert("通过失败！");
			}	}});
				});
				
				$('#disagree').on(A.options.clickEvent, function() {
			var state=1;
			var id = document.getElementById("id").value;
			var opinion = document.getElementById("opinion").value;
			$.ajax({
			type : "post",
			url : "ajaxcheck.do?i=3"+"&id="+id+"&opinion="+opinion,  
			data:null,               
			success : function(data) { //成功时执行的方法	
				A.confirm("提示","不通过成功！",function(){
				/* location.href = "internshipApproval.do"; */
				},function(){
				return false;
				});
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					A.alert("不通过失败！");
			}	}});
				});	
			})();
		</script>

</body>
</html>
