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
	<style>
			#plus {
				position: absolute;
				clear: both;
				top: 54%;
				display: inline-block;
				text-decoration: none;
				-webkit-transform: translateY(-50%);
				-ms-transform: translateY(-50%);
				transform: translateY(-50%);
				-webkit-font-smoothing: antialiased;
				right: 23px;
				font-size: 20px;
			}
		</style>
	
</head>
<body>
	<div id="section_container">
		<section id="form_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>早操详情添加</h1>
					
				</div>
			</header>
			<article data-role="article" id="guideRecord" data-scroll="verticle"
				class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form autocomplete="off"
						oninput="range_output.value=parseInt(range.value)"
						class="form-square" id="form1" name="form1" action="morningExercisesAddPoints.do">
						<input type="hidden" id="a" name="a" value="">
						<input type="hidden" id="b" name="b" value="">
						<label class="label-left">班级责任人</label>
						<div data-role="select" class="label-right">
							<select name="sel" id="sel" onchange="test()">
								<option value="">请选择当前的负责人</option>
								<c:forEach var="stu" items="${students}">
									<option value="${stu.id}" >${stu.true_name}</option>
								</c:forEach>
							</select>
						</div>
						<label class="label-left">查操合作人</label>
						<div  class="label-right" id="aaaa">
							<input type="text" readonly="true" value="" name="connect" id="connect">
						</div>
						<span id="plus" class="iconfont iconline-mark-plus" ></span>
						
						<!-- <input type="button" class="block outline" id="addPerson" value="添加查操合作人"></input> -->
						<input type="button" class="block " id="add" value="添加查操记录"></input>
					</form>
				</div>
			</article>
		</section>
	</div>
	<div id="collaborator_modal" data-role="modal" class="modal bg-carrot ">
		<header>
			<div class="titlebar">
				<a data-toggle="back" href="#"><i
					class="iconfont iconline-arrow-left"></i> </a>
				<h1>添加查操合作人</h1>
			</div>
		</header>
		<article data-role="article" id="modal_article" data-scroll="verticle"
			class="active" style="top:44px;bottom:0px;">
			<div class="scroller">
				<form class="form-group">
					<div class="card">
						<ul class="listitem" id="addMember">
							<li class="title">添加查操合作人</li>
							<c:forEach var="union_stu" items="${union_student}">
							<li class="nopadding"><a data-role="checkbox" id="con"> <label
									for="classs" class="black" id="cons" >
									<c:set var="unstu_id" value="${union_stu.sam_stu_id}"
								scope="request"></c:set> <%
 	String unstu_id = (String) request.getAttribute("unstu_id");
 	out.print(DictionaryService.findStudent(unstu_id)
 			.getTrue_name());
 %></label> <input type="checkbox"  name="student" class="student" value="${union_stu.sam_stu_id}" id="classs">
							</a></li>
							</c:forEach>
						</ul>
					</div>
				</form>
			</div>
		</article>
		<footer id="edit_footer" style="bottom: 0px;">
					<nav class="menubar">
						<a class="menu active"  id="add_mark">
							<span class="menu-icon iconfont iconline-rdo-tick"></span>
						    <span class="menu-text">确定</span>
						</a>
						<a class="menu active" id="delete_mark">
							<span class="menu-icon iconfont iconline-rdo-cancel"></span>
						    <span class="menu-text">取消</span>
						</a>
					</nav>
				</footer>
				
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
	<script
		src="<%=path%>/AgileLite/assets/component/timepicker/agile.timepicker.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/component/extend.js"></script>
	<script>
		$("#plus").on(A.options.clickEvent, function() {
			A.Controller.modal('#collaborator_modal');
			
		});
		//添加查操合作人点击确定后执行
		$("#add_mark").on(A.options.clickEvent, function() {
			var a=[];
			var d=[];
			$.each($(".student:checked"),function(i,n){
			    a[i]=n.value;
			    $('#a').attr("value",a);
			    d[i]=$(
						":checked[name='student']:eq(" + i + ")")
						.prev().text();
			});
			$("#aaaa").text(d);		      
 			A.Controller.modal('#collaborator_modal');
 				
 			
	});			
		//点击右上角加号执行
		$("#add").on(A.options.clickEvent, function() {
			var option=$("#sel option:selected");  
 			var options=option.val();
 			if(options==""){
 				A.confirm("提示","请完善信息！",function(){
 					return true;
 				});
 			}else{
			$('#b').attr("value",options);
			$('#form1').submit();
 			}
     	});
		//点击model取消按钮
		$("#delete_mark").on(A.options.clickEvent, function() {
			A.Controller.modal('#collaborator_modal');	
		});
		
	</script>
</body>
</html>
