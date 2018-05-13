<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<link rel="stylesheet" href="<%=path%>/AgileLite/assets/app/css/app.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconform.css">
<script language="javascript" type="text/javascript"
	src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
<!-- 新添加日期控件 -->
</head>
<body>
	<div id="section_container">
		<section id="form_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>学生签到情况</h1>
				</div>
			</header>
			<article data-role="article" id="College_notice"
				data-scroll="verticle" class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<ul class="listitem">
						<li>选择任务: <select id="pks_id">
								<c:forEach var="pks" items="${pks}" varStatus="stauts">
									<option value="${pks.id}">${pks.task_name}</option>
								</c:forEach>
						</select></li>
						<li><input type="text" id="ym" id="ym" value="${trueMouth}"
							onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy年MM月'})"
							class="Wdate" /></li>
						<li id="ajaxdata"><button onclick="getMoth()">查询签到情况</button>
						</li>
					</ul>
					<ul class="listitem" id="td">
						<c:forEach items="${all}" var="al" varStatus="status">
							<c:forEach items="${al}" var="as" varStatus="status">
								<li><label
									href='StudentAttendance_details.do?stu_code=${as.stu_code}&true_name=${as.true_name}&signCount=${as.signCount}&phone=${as.phone}'
									data-toggle='html'>
										<div class='text'>
											${as.true_name}<small> 本月签到次数 ${as.signCount}</small>
										</div> </label>
								</li>
							</c:forEach>
						</c:forEach>
					</ul>
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
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/component/extend.js"></script>
	<script>
		function jump01() {
			A.Controller.section('#TaskDetails_section');
		}
	</script>
	<script type="text/javascript">
		function getMoth() {
			var ym = $("#ym").val();
			var pks_id = $("#pks_id").val();
			$.ajax({
				type : "get",
				contentType : "application/json",
				url : "ajaxStusSinState.do?",
				data : "ym=" + ym + "&pks_id=" + pks_id, //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法		
					$("#td").html(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						A.alert(status);
					}
				}
			});
		}
	</script>
</body>
</html>
