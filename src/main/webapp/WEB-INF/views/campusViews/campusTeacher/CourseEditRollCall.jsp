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
.select {
	width: 50%;
	background-color: white;
	border: none;
	font-size: 20px;
}

.fon {
	color: black;
	font-size: 20px;
}

.fon1 {
	color: green;
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
					<h1>${year} 第${semester}学期</h1>
					<a id="add" data-toggle="html" href="CourseManageIndex.do"><i
						class="iconfont iconline-home"></i> </a>
				</div>
			</header>
			<article data-role="article" id="guideRecord" data-scroll="verticle"
				class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form class="form-square" action="doSubmitRollCall.do" name="form"
						id="form" method="post">
						<input type="hidden" id="reduce" name="reduce" value=""> <input
							type="hidden" id="date" name="date" value="${date}"> <input
							type="hidden" id="classroom" name="classroom"
							value="${classroom}"> <input type="hidden"
							id="section_num" name="section_num" value="${section_num}">
						<input type="hidden" id="tc_id" name="tc_id" value="${tc_id}">
						<input type="hidden" id="log_id" name="log_id" value="${log_id}">
						<input type="hidden" id="ces2" name="ces2" value="${ces2}">
						<label class="label-left"><font class="fon">课程</font>
						</label>
						<div class="label-right">
							<output>${date} 第${section_num}节 教室${cs_name} </output>
						</div>
						<label class="label-left "><font class="fon">教学班</font></label>
						<div class="label-right">
							<output>
								<font > ${tc_name}</font>
							</output>
						</div>
						<hr />
						<font color="red">提示：请点击选择缺勤学生！</font>
						<hr>
						<!-- <button class="block submit" id="submit" name="submit">
							<i class="iconfont iconline-rdo-tick fon"></i> <span>确定</span>
						</button> -->
						<c:forEach var="a" items="${allstus}">

							<ul class="listitem">
								<li><a data-role="checkbox" id="mem"> <label
										for="class" class="black fon">${a.stu_code} &nbsp;${a.true_name}${a.temp3}</label>
										<c:if test="${a.temp3.equals('（请假）')}">
										</c:if> <c:if test="${a.temp3.equals('')}">
											<input type="checkbox" name="ck" id="ck" value="${a.id}"
												class="ck">
										</c:if> </a></li>
							</ul>
						</c:forEach>

						<button class="block submit" id="submit" name="submit">
							<i class="iconfont iconline-rdo-tick fon"></i> <span>确定</span>
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
	<script
		src="<%=path%>/AgileLite/assets/component/timepicker/agile.timepicker.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/component/extend.js"></script>

	<script type="text/javascript">
	$(document).ready(function() {
	
		var ces2 = $("#ces2").val();  //需要默认选中的缺勤 人员
		ces2 = ces2.substring(1,ces2.toString().length-1);
		var arrayList = ces2.split(",");
		for(var i = 0 ;i<arrayList.length; i++){
		$(":checkbox").each(
		       function(){
		            if($(this).val() == arrayList[i].trim() ){
		             $(this).attr("checked",true);
		            }
		  }); 
		}
	});
	
		$('#submit').on(A.options.clickEvent, function() {
			var i = 0;
			var b = [];
			$.each($(".ck:checked"), function(i, n) {
				b[i] = n.value;
				$('#reduce').attr("value", b);
			});
			$('#form').submit();

		});
	</script>
</body>
</html>
