<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.sict.entity.Student"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>请假申请</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="<%=path%>/bootstrap/css/bootstrap.min.css" rel="stylesheet" rel="stylesheet" media="screen">
<link href="<%=path%>/bootstrap/sample in bootstrap v3/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<script src="<%=path%>/bootstrap/sample in bootstrap v3/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('.form_date').datetimepicker().on(
				'hide',
				function(ev) {
					var begin_time = $("#dtp_input2").val();
					var end_time = $("#dtp_input3").val();
					if(end_time==""){
						return;
					}
					var tbegin_time = Date.parse(new Date(begin_time));
					var tend_time = Date.parse(new Date(end_time));

					var now = new Date().getTime();//当前时间戳
					if ((now - tend_time) > 0) {
						alert("温馨提示：结束时间应该大于当前时间");
						return;
					} else if (tend_time - tbegin_time < 0) {
						alert("温馨提示：结束时间应该大于开始时间");
						return;
					}
					//请假时长
					var day = Math.floor((tend_time - tbegin_time)
							/ (24 * 60 * 60 * 1000));
					if (day == 0) {
						day = 1;
					} else if (day < 0) {
						alert("温馨提示：结束时间必须大于开始日期哦！");
						return;
					}
					var sday = "" + day;
					$("#sla_duration").attr("value", sday);
					$("#day").attr("value", sday);
				});
	});
	function checkForm() {

		var sla_type = $("#sla_type").val();
		var sla_real_students_id = $("#sla_real_students_id").val();
		var sla_place = $("#sla_place").val();
		var begin_time = $("#dtp_input2").val();
		var end_time = $("#dtp_input3").val();
		var sla_effects = $(":checked[name='sla_effects']").length;
		var sla_duration =$("#sla_duration").val();
		if (sla_type == "0") {
			alert("请选择请假类型");
			return null;
		} else if (sla_real_students_id == "") {
			alert("请输入请假学生");
			return null;
		} else if (sla_place == "") {
			alert("请输入请假去处");
			sla_place.focus();
			return null;
		} else if (begin_time == "") {
			alert("请选择开始时间");
			return null;
		} else if (end_time == "") {
			alert("请选择结束时间");
			return null;
		} else if (sla_duration=="" || sla_duration<0) {
			alert("您好，您选择的结束日期应该大于开始日期！");
			return;
		}else if (sla_effects <= 0) {
			alert("请选择请假影响范围！");
			return;
		} else if (end_time.value < begin_time.value) {
			alert("结束时间不能够早于开始时间，请重新选择！");
			return null;
		} else {
			$("#form").submit();
		}
	}
</script>
</head>
<body style="margin:50px">
	<div class="container">
		<form class="form-horizontal" role="form" action="campusStudent/web/doStudentsLeave.do" method="post" id="form">

			<h1>我要请假 </h1>
			<div class="row">
				<div class="col-xs-5 col-md-offset-3">
					<div class="form-group ">
					<!-- 	<label>请假人</label> -->
						<c:set var="student_id" scope="request" value="${student.id}" />
						<%
							String student_id = (String) request.getAttribute("student_id");
							Student stu = DictionaryService.findStudent(student_id);
						%>
						
						<%-- <output class="form-control" ><%=stu.getTrue_name()%></output> --%>
						 <input
							type="hidden" class="form-control" id="sla_stu" name="sla_stu" value="${student.id}"> 
					</div>
					<div class="form-group">
						<label>请假类型</label>
						<select class="form-control" id="sla_type" name="sla_type">
							<option value="0">请选择请假类型</option>
							<option value="1">事假</option>
							<option value="2">病假</option>
							<option value="3">探亲</option>
							<option value="4">旅游</option>
							<option value="5">学校任务</option>
							<option value="6">社团任务</option>
							<option value="7">其他</option>
						</select>
					</div>
					<div class="form-group">
						<label>请假级别</label>
						<select class="form-control" id="sla_rank" name="sla_rank">
							<option>请选择请假类型</option>
							<option value="1">比较着急</option>
							<option value="2">不是很着急</option>
							<option value="3">不着急</option>
						</select>
					</div>
					<div class="form-group">
						<label>请假学生</label> <output class="form-control" ><%=stu.getTrue_name()%></output> <input type="hidden" class="form-control"
							id="sla_real_students_id" name="sla_real_students_id" value="${student.id}">
					</div>
					<div class="form-group">
						<label>请假去处</label> <input type="text" class="form-control" id="sla_place" name="sla_place" value="" placeholder="请填入请假去处">
					</div>
					<div class="form-group">
						<label>请假影响范围:</label>
						<!-- 
						<input type="checkbox" class="form-control" id="sla_effects" name="sla_effects"> -->
						<input type="checkbox" name="sla_effects" id="sla_effects1" value="1" /><label for="sla_effects1">早操</label> <input
							type="checkbox" name="sla_effects" id="sla_effects2" value="2" /><label for="sla_effects2">上课</label> <input
							type="checkbox" name="sla_effects" id="sla_effects3" value="3" /><label for="sla_effects3">晚自习</label> <input
							type="checkbox" name="sla_effects" id="sla_effects4" value="4" /><label for="sla_effects4">夜不归宿</label> <input
							type="checkbox" name="sla_effects" id="sla_effects5" value="5" /><label for="sla_effects5">集体活动</label> <input
							type="checkbox" name="sla_effects" id="sla_effects6" value="6" /><label for="sla_effects6">军训</label> <input
							type="checkbox" name="sla_effects" id="sla_effects7" value="7" /><label for="sla_effects7">劳动周</label> <input
							type="checkbox" name="sla_effects" id="sla_effects8" value="8" /><label for="sla_effects8">周末离校</label>
					</div>
					<div class="form-group">
						<label for="dtp_input2" class="control-label"> 开始时间</label>
						<div class="input-group date form_date" data-date="" data-date-format="" data-link-field="dtp_input2"
							data-link-format="yyyy-mm-dd hh:ii:mm">
							<input class="form-control" size="16" type="text" value=""  readonly> <span class="input-group-addon"><span
								class="glyphicon glyphicon-remove"></span> </span> <span class="input-group-addon"><span
								class="glyphicon glyphicon-calendar"></span> </span>
						</div>
						<input type="hidden" id="dtp_input2" name="begin_time" value="" />
						<!-- name="sla_begin_time" -->

					</div>
					<div class="form-group">
						<label for="dtp_input3">结束时间</label>
						<div class="input-group date form_date " data-date="" data-date-format="" data-link-field="dtp_input3"
							data-link-format="yyyy-mm-dd hh:ii:mm">
							<input class="form-control" size="16" type="text" value=""  readonly> <span class="input-group-addon"><span
								class="glyphicon glyphicon-remove"></span> </span> <span class="input-group-addon"><span
								class="glyphicon glyphicon-calendar"></span> </span>
						</div>
						<input type="hidden" id="dtp_input3" name="end_time" value="" />
						<!-- name="sla_end_time" -->
					</div>

					<div class="form-group ">
						<label>请假时长（天）</label>
						<output  class="form-control" id="day"></output>
						<input type="hidden" class="form-control" id="sla_duration" name="sla_duration" value="" placeholder="无需填写 自动计算">
					</div>
					<div class="form-group ">
						<label>是否出校</label>
						<select class="form-control" id="is_level_school" name="is_level_school">
							<option value="1">出校</option>
							<option value="2">不出校</option>
							<option value="3">出校但不出市</option>
							<option value="4">出校但不出省</option>
							<option value="5">出校出省</option>
						</select>
					</div>
					<input type ="hidden" id="sla_org_id" name="sla_org_id" value="${student.class_id}"/>
					<div class="form-group">
						<label>请假原因</label>
						<textarea class="form-control" row=3 id="sla_reason_desc" name="sla_reason_desc"></textarea>
					</div>
					<input name="type" id="type" value="${type}" type="hidden" />
					<div class=" col-lg-6 col-md-5 col-sm-6 col-xs-6" align="center">
						<input type="button" id="submit1" value="提交" onclick="checkForm()" />
					</div>
					<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6" align="center">
						<input type="button" class="btn btn-default" value="返回" onclick="location.href='campusStudent/web/seeStudentsLeaveList.do?type='+${type}" />
					</div>
				</div>
		</form>
	</div>
	<script src="<%=path%>/bootstrap/sample in bootstrap v3/js/bootstrap.min.js"></script>
	<script src="<%=path%>/bootstrap/sample in bootstrap v3/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script src="<%=path%>/bootstrap/sample in bootstrap v3/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
	<script>
		$('.form_date').datetimepicker({
			format : 'yyyy-mm-dd hh:ii:mm',
			language : 'zh-CN',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 0,
			forceParse : 0
		});
	</script>
</body>
</html>
