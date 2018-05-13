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
<style type="text/css">

.fon {
	color: black;
	font-size: 20px;
}

.fon1 {
	color: green;
	font-size: 20px;
}

body {
	color: black;
	font-size: 22px;
}

input[type="checkbox"] {
	display: block;
}
</style>
<style type="text/css">
.outer {
	border: 1px solid #ccc;
	border-radius: 6px;
}

.accordionbar {
	display: block;
	padding: 10px;
	border-bottom: 1px solid #ccc;
	background-color: #efefef;
	color: #444;
}

.accordionbar.active {
	color: #aaa;
}

[data-role="accordion"] {
	overflow: hidden;
	height: 0px;
	/*可以适当加一些动画*/
	z-index: 10;
	-webkit-transition: height 0.3s ease-in-out, box-shadow 0.6s linear;
	-moz-transition: height 0.3s ease-in-out, box-shadow 0.6s linear;
	-o-transition: height 0.3s ease-in-out, box-shadow 0.6s linear;
	-ms-transition: height 0.3s ease-in-out, box-shadow 0.6s linear;
	transition: height 0.3s ease-in-out, box-shadow 0.6s linear;
} /* 必须为被控制的组件添加默认样式不显示*/
[data-role="accordion"].active {
	border-bottom: 1px solid #ccc;
	height: auto;
	/*可以适当加一些动画*/
	-webkit-transition: height 0.5s ease-in-out, box-shadow 0.1s linear;
	-moz-transition: height 0.5s ease-in-out, box-shadow 0.1s linear;
	-o-transition: height 0.5s ease-in-out, box-shadow 0.1s linear;
	-ms-transition: height 0.5s ease-in-out, box-shadow 0.1s linear;
	transition: height 0.5s ease-in-out, box-shadow 0.1s linear;
	box-shadow: 0px 0px 0px 1px rgba(155, 155, 155, 0.3);
} /* 必须为被控制的组件添加active样式，显示组件*/
[data-role="accordionone"] {
	display: none;
} /* 必须为被控制的组件添加默认样式不显示*/
[data-role="accordionone"].active {
	display: block;
} /* 必须为被控制的组件添加active样式，显示组件*/
</style>
<script async src="http://c.cnzz.com/core.php"></script>


</head>
<body>
	<div id="section_container">
		<section id="form_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>${year} 第${semester}学期</h1>
					<a id="add" data-toggle="html" href="CourseManageIndex.do"><i
						class="iconfont iconline-home"></i> </a>
				</div>
			</header>
			<article data-role="article" id="guideRecord" data-scroll="verticle"
				class="active" style="top:44px;bottom:0px;">

				<form action="doSubmitAmPerson.do" name="form" id="form"class="form-square"
					method="post">
					<input type="hidden" id="es" name="es" value="${es}">
					<input type="hidden" id="reduce" name="reduce" value=""> <input
						type="hidden" id="date" name="date" value="${date}"> <input
						type="hidden" id="classroom" name="classroom" value="${classroom}">
					<input type="hidden" id="section_num" name="section_num"
						value="${section_num}"> <input type="hidden" id="tc_id"
						name="tc_id" value="${tc_id}"> <input type="hidden"
						id="index_id" name="index_id" value=""> 
						<output>${date} &nbsp;${section_num}节 &nbsp; ${cs_name} </output><br>
					<label class="label-left">教学班：</label>
					<div class="label-right">
						<output> ${tc_name}</output>
					</div>
					<hr />
					<div class="outer">
						<a class="accordionbar" data-role="accordionbar"
							data-toggle="accordion" href="#accordion2" readonly="readonly">请选择要评价的学生！</a>
						<ul data-role="accordionone" id="accordion2"
							class="listitem active">
							<c:forEach var="meb" items="${stus}" varStatus="stauts">
								<li>
									<div class="text">
										<a data-role="checkbox" id="mem"> <label for="class"
											class="black"><font size="4px">${meb.stu_code} &nbsp;${meb.true_name}</font></label> <input type="checkbox"
											name="member" id="mebs" value="${meb.id}" class="ck">
										</a>
									</div></li>
							</c:forEach>
						</ul>

					</div>
					<label class="label-left">评价: </label>
					<div class="label-right"data-role="select">
					<select  name="index_id1" id="index_id1" >
								<option value="">请选择</option>
								<c:forEach var="e" items="${ei}" varStatus="status">
									<option value="${e.id}">${e.index_name}</option>
								</c:forEach>
					</select>
					</div>
					<br>
					<button class="block submit" id="kpm" name="kpm">
						<i class="iconfont iconline-rdo-tick"></i> <span>确定</span>
					</button>
					<br>
				</form>
			</article>
	</div>
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
	<script
		src="<%=path%>/AgileLite/assets/component/timepicker/agile.timepicker.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/component/extend.js"></script>

	<script type="text/javascript">
		(function() {
			//[必须]添加accordion控制器
			A.Controller.add({
				accordion : {
					selector : '[data-toggle="accordion"]',
					isToggle : true,
				//仅控制目标显隐
				},
				accordionone : {
					selector : '[data-toggle="accordionone"]',
				}
			});

		})();

		$('#kpm').on(A.options.clickEvent, function() {
			var tx1 = $("#tx1").val();
			var index_id1 =  $("#index_id1").val();
			
			var b = [];
			$.each($(".ck:checked"), function(i, n) {
				b[i] = n.value;
				$('#reduce').attr("value", b);
				$('#tx').attr("value", tx1);
				$('#index_id').attr("value", index_id1);
			});
			var reduce = $("#reduce").val();
			if (reduce == "") {
				A.alert("请选择要评价的学生");
				return false;
			}
			if (index_id1 == "") {
				A.alert("请选择原因");
				return false;
			}
			$('#form').submit();
			return false;

		});
	</script>
</body>
</html>
