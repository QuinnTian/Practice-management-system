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
					<h1>专家指导</h1>
				</div>
			</header>
			<article data-role="article" id="practice_article"
				data-scroll="verticle" class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form autocomplete="off"
						oninput="range_output.value=parseInt(range.value)"
						class="form-common" action="SaveExpertGuidance.do" method="post">

						<label class="label-left" for="text">查询专长：</label> <label
							class="label-right"> <input type="text" name="expertise"
							id="expertise" required="required" onblur="getExpert()">
						</label> <label class="label-left" for="teacher">选择专家：</label> <select
							id="expert" name="expert">
							<option>选择专家</option>
						</select>
						<hr />
						<label class="label-left" for="text">提问问题：</label> <label
							class="label-right"> <textarea rows="5" type="text" name="quiz"
							id="quiz" required="required"></textarea>
						</label>
						<hr />
						<button class="block submit" onclick="doAdd()">
							<i class="iconfont iconline-rdo-tick"></i> <span>提交</span>
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
		//ajax 获取专家教师
		function getExpert() {
			$.ajax({
						type : "get",
						url : "ajaxExpert.do?",
						data : getExpertise(), //设置发送参数，即使参数为空，也需要设置     
						dataType : "text", //返回的类型为json  
						contentType : "application/x-www-form-urlencoded; charset=utf-8",
						scriptCharset : "utf-8",
						success : function(data) { //成功时执行的方法		

							setEt(data);
						},
						error : function(result, status) { //出错时会执行这里的回调函数                     
							if (status == 'error') {
								alert(status);
							}
						}
					});

		}
		function setEt(ajaxData) {//根据返回数据显示搜索结果
			var select = document.getElementById("expert");
			select.options.length = 1;
			$("#expert").html(ajaxData);
		};
		function getExpertise() {
			var expertise = $("#expertise").val();
			var dataSend = "expertise=" + expertise;
			return dataSend;
		}

		//恢复默认值
		function setExpert() {
			console.log("wwwwwww");
			$("#expert").empty();
			console.log("tttttttt");
		}
	</script>
	<script type="text/javascript">
		/*验证 2015年6月9日 11:50:24*/
		function doAdd() {
			var expert = $("#expert").val();
			var quiz = $("#quiz").val();
			console.log(expert.value);
			if (expert == "选择专家") {
				alert("请选择专家！");
				return null;
			}
			if (expert == "") {
				alert("暂无相关领域专家，请重新选择专长进行查询！");
				return null;
			}
			if (quiz == "") {
				alert("请填写想要提问的问题！");
				return null;
			}
			$("#form").submit();
			A.alert("提交成功");
		}
		$(function() {
			getExpert();
		});
	</script>
</body>

</html>
