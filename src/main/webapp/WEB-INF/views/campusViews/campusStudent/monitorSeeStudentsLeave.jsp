<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="com.sict.service.DictionaryService"%>
<%@ page import="com.sict.entity.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>
<!DOCTYPE HTML >
<html>
<head>
<base href="<%=basePath%>">
<title>请假审批</title>
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
<link href="<%=path%>/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="<%=path%>/bootstrap/sample in bootstrap v3/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

<script type="text/javascript">
	var status="";//记录用户选择查询的状态
	var type = "${type}";
	function getLevelApprovalByDate(){
		var date=$("#dtp_input2").val();
		if(date==null || date==""){
			alert("请选择时间后，查询！");
			return;
		}
		getLevelApproval(status,date);
	}
	function getLevelApproval(flag,date) {
		if (flag == null || flag == "") {
			alert("error");
			return;
		} 
		status=flag;//修改状态
		a=flag;
		$.ajax({
			type : "get",
			url : "campusStudent/web/ajaxGetApprovalLeave.do",
			data : "flag=" + flag+"&date=" + date,
			dataType : "text",
			success : function(ajaxData) {
				showRecord(ajaxData);
			},
			error : function(result, status) {
				if (status == 'error') {
					alert(status);
				}
			}
		});

	}
	function showRecord(ajaxData) {
		$("#content").html(ajaxData);
	};
	/* 	function mouseover(applicationCode) {
	 $("#" + applicationCode).popover('show');
	 }
	 function mouseout(applicationCode) {
	 $("#" + applicationCode).popover('hide');
	 }
	 */
</script>
</head>
<body style="margin:50px" class="table-responsive">
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<br>
				<ul class="nav nav-pills" id="nav" role="tablist">
					<li role="presentation" class="active"><a href="campusStudent/web/monitorSeeStudentsLeave.do?type=${type}">未审批<span class="badge">${ApprovalLevelNumber}</span>
					</a></li>
					<li onclick="getLevelApproval('no','null')" role="presentation"><a>审批未通过 <span class="badge">${noApprovalLevelNumber}</span>
					</a></li>
					<li onclick="getLevelApproval('yes','null')" role="presentation"><a>审批通过 <span class="badge">${yesApprovalLevelNumber}</span>
					</a></li>
				</ul>
				<form class="navbar-form navbar-left" role="search">
					<!-- 	<div class="form-group">
						<label>选择班级</label>
						<select class="form-control">
							<option>精英1401</option>
							<option>软件1401</option>
						</select>
					</div> -->
				<!-- 	<div class="form-group">
						<label for="time">时间查询</label> <input type="text" class="form-control" placeholder="Search">
					</div>

					<button type="submit" class="btn btn-default">查询</button> -->
						<div class="form-group">
						<label for="dtp_input2">时间查询</label>
						<div class="input-group date form_date col-md-8" data-date="" data-date-format="" data-link-field="dtp_input2"
							data-link-format="yyyy-mm-dd">
							<input class="form-control" size="16" type="text" value="" name="date" id="date" readonly> <span class="input-group-addon"><span
								class="glyphicon glyphicon-remove"></span></span> <span class="input-group-addon"><span
								class="glyphicon glyphicon-calendar"></span></span>
						</div>
						<input type="hidden" id="dtp_input2" value="" /> <br />
					</div>
					<button type="button" class="btn btn-default" onclick="getLevelApprovalByDate()">查询</button>
					<button type="button" class="btn btn-primary btn-lg"
						onclick="location.href='campusStudent/web/studentsLeaderLeave.do?type=${type}'">班级请假</button>
				</form>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<table class="table table-striped table-bordered">
		<thead>
			<tr>
			<tr>
				<th>序号</th>
				<th>请假学生</th>
				<th>组织</th>
				<th>请假类型</th>
				<th>请假原因</th>
				<th>申请人</th>
				<th>申请时间</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<th>请假时长(天)</th>
			<!-- 	<th>审批结果</th> -->
		<!-- 		<th>审批意见</th> -->
				<th>审批人</th>
				<th>审批时间</th>
				<th>学生电话</th>
				<th>家长电话</th>
				<th>审批状态</th>
			</tr>
		</thead>
		<tbody id="content">
			<!--集体请假  start-->
			<%
				int i=0;//用于记录为审批的条数
			%>
			<c:forEach var="application" items="${approvingGroupLeaveList}" varStatus="stauts">


				<c:set scope="request" value="${application.sla_leave_type}" var="sla_leave_type" />
				<%
					String sla_leave_type = (String) request.getAttribute("sla_leave_type");
				%>
				<tr>

					<td><%=++i%></td>
					<td><c:set scope="request" value="${application.sla_real_students_id}" var="sla_real_students_id" /> <%
 	String sla_real_students_id = (String) request.getAttribute("sla_real_students_id");
  		String[] realStudentsIdArr = sla_real_students_id.split(",");
  		Student stu = null;
  		String studentNames = "";
  		if (sla_leave_type.equals("2")) {//集体请假
  			int num=0;
  		String tempRoword="";
  			for (String str : realStudentsIdArr) {
  				stu = DictionaryService.findStudent(str);
  				if (stu != null) {
  					studentNames += stu.getTrue_name() + ",";
  					if(num>=2)
  						continue;
  					tempRoword+=stu.getTrue_name() + ",";
  					num++;
  					
  				}
  			}
 %>
						<button type="button" class="btn btn-default" title="请假人姓名" id="${application.sla_code}" data-container="body"
							onmouseover="mouseover('${application.sla_code}')" onmouseout="mouseout('${application.sla_code}')" data-toggle="popover"
							data-placement="bottom" data-content="<%=studentNames%>"><%=tempRoword+"等"+realStudentsIdArr.length%>人
						</button>
						<%
							}
						 		
						%></td>
					<td>
						<%
							if(sla_leave_type.equals("2")){
								 
								out.println(DictionaryService.findOrg(stu.getClass_id()).getOrg_name());
							}else if(sla_leave_type.equals("3") || sla_leave_type.equals("4")){
								//TODO 学生会、社团请假显示 2016-05-20
								out.println("无法获取...");
							}
						%>
						
					</td>
					<td>
						<%
							if ("1".equals(sla_leave_type)) {
													out.println("个人请假");
												} else {
													out.println("集体请假");
												}
						%>
					</td>
					<td>${application.sla_reason_desc}</td>
					<td><c:set scope="request" value="${application.sla_stu}" var="sla_stu" /> <%
 	String sla_stu = (String) request.getAttribute("sla_stu");
  		Student applyStudent = DictionaryService.findStudent(sla_stu);
  		if (applyStudent != null) {
  			out.println(applyStudent.getTrue_name());
  		}
 %></td>
					<td><fmt:formatDate value="${application.sla_time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td><fmt:formatDate value="${application.sla_begin_time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td><fmt:formatDate value="${application.sla_end_time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>${application.sla_duration}</td>
				<%-- 	<td><c:if test="${application.sla_approval_state==1}">
							审批中
						</c:if> <c:if test="${application.sla_approval_state==2}">
							同意
						</c:if> <c:if test="${application.sla_approval_state==3}">
							不同意
						</c:if> <c:if test="${application.sla_approval_state==4}">
							领导审批中
						</c:if> <c:if test="${application.sla_approval_state==5}">
							领导同意
						</c:if> <c:if test="${application.sla_approval_state==6}">
							领导不同意
						</c:if></td> --%>
					<td><c:set scope="request" var="approval_tea" value="${application.final_approval_tea}" /> <%
 	String approval_tea = (String) request.getAttribute("approval_tea");
  		if (approval_tea != null)
  			out.println(DictionaryService.findTeacher(approval_tea).getTrue_name());
  		else
  			out.println("无");
 %></td>
					<td><c:if test="${empty application.final_approval_time}">
							无
						</c:if> <fmt:formatDate value="${application.final_approval_time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>
						<%
							if ("1".equals(sla_leave_type)) {
													if (stu != null) {
														out.println(stu.getPhone());
													}
												} else {
													if (applyStudent != null) {
														out.println(applyStudent.getPhone());
													}
												}
						%>
					</td>
					<td>
						<%
							if ("1".equals(sla_leave_type)) {
													if (stu != null) {
														out.println(stu.getHome_phone());
													}
												} else {
													if (applyStudent != null) {
														out.println(applyStudent.getHome_phone());
													}
												}
						%>
					</td>
				<td><c:if test="${application.sla_approval_state==1}">
							审批中
						</c:if> <c:if test="${application.sla_approval_state==2}">
							同意
						</c:if> <c:if test="${application.sla_approval_state==3}">
							不同意
						</c:if> <c:if test="${application.sla_approval_state==4}">
							院领导审批中
						</c:if> <c:if test="${application.sla_approval_state==5}">
							院领导同意
						</c:if> <c:if test="${application.sla_approval_state==6}">
							院领导同意
						</c:if></td>
				</tr>

			</c:forEach>
			<!--集体请假  end-->
			<!--个人请假  start-->
			<c:forEach var="application" items="${appList}" varStatus="stauts">
				<tr>

					<td><%=++i%></td>
					<td><c:set scope="request" value="${application.sla_real_students_id}" var="sla_real_students_id" /> <%
 	String sla_real_students_id = (String) request.getAttribute("sla_real_students_id");
  		Student stu = DictionaryService.findStudent(sla_real_students_id);
  		out.println(stu.getTrue_name());
 %></td>
					<td>
						<%
							out.println(DictionaryService.findOrg(stu.getClass_id()).getOrg_name());
						%>
					</td>
					<td><c:set scope="request" value="${application.sla_leave_type}" var="sla_leave_type" /> <%
 	String sla_leave_type = (String) request
           				.getAttribute("sla_leave_type");
  					if("1".equals(sla_leave_type)){
  						out.println("个人请假");
  					}else{
  						out.println("集体请假");
  					}
 %></td>
					<td>${application.sla_reason_desc}</td>
					<td><c:set scope="request" value="${application.sla_stu}" var="sla_stu" /> <%
 	String sla_stu = (String) request.getAttribute("sla_stu");
  		out.println(DictionaryService.findStudent(sla_real_students_id).getTrue_name());
 %></td>
					<td><fmt:formatDate value="${application.sla_time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td><fmt:formatDate value="${application.sla_begin_time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td><fmt:formatDate value="${application.sla_end_time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>${application.sla_duration}</td>
					<%-- <td><c:if test="${application.sla_approval_state==1}">
							审批中
						</c:if> <c:if test="${application.sla_approval_state==2}">
							同意
						</c:if> <c:if test="${application.sla_approval_state==3}">
							不同意
						</c:if> <c:if test="${application.sla_approval_state==4}">
							领导审批中
						</c:if> <c:if test="${application.sla_approval_state==5}">
							领导同意
						</c:if> <c:if test="${application.sla_approval_state==6}">
							领导不同意
						</c:if></td> --%>
					<td><c:set scope="request" var="approval_tea" value="${application.final_approval_tea}" /> <%
 	String approval_tea = (String) request.getAttribute("approval_tea");
  		if (approval_tea != null)
  			out.println(DictionaryService.findTeacher(approval_tea).getTrue_name());
  		else
  			out.println("无");
 %></td>
					<td><c:if test="${empty application.final_approval_time}">
							无
						</c:if> <fmt:formatDate value="${application.final_approval_time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>
						<%
							out.println(stu.getPhone());
						%>
					</td>
					<td>
						<%
							out.println(stu.getHome_phone());
						%>
					</td>
					<td><c:if test="${application.sla_approval_state==1}">
							审批中
						</c:if> <c:if test="${application.sla_approval_state==2}">
							同意
						</c:if> <c:if test="${application.sla_approval_state==3}">
							不同意
						</c:if> <c:if test="${application.sla_approval_state==4}">
							院领导审批中
						</c:if> <c:if test="${application.sla_approval_state==5}">
							院领导同意
						</c:if> <c:if test="${application.sla_approval_state==6}">
							院领导同意
						</c:if></td>
				</tr>

			</c:forEach>
			<!--个人请假  end-->
		</tbody>
	</table>
	<script src="<%=path%>/bootstrap/js/jquery.min.js"></script> 
<%-- 	<script src="<%=path%>/bootstrap/sample in bootstrap v3/jquery/qu.js"></script>   --%>
	<script src="<%=path%>/bootstrap/sample in bootstrap v3/js/bootstrap.min.js"></script>
	<script src="<%=path%>/bootstrap/sample in bootstrap v3/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script src="<%=path%>/bootstrap/sample in bootstrap v3/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
	<script type="text/javascript">
		function mouseover(applicationCode) {
			$("#" + applicationCode).popover('show');
		}
		function mouseout(applicationCode) {
			$("#" + applicationCode).popover('hide');
		}
		$(function() {
			$('#nav a:first').tab('show');
		});

		$('#nav a').click(function() {

			$(this).tab('show');
		});
		$('.form_date').datetimepicker({
			format : 'yyyy-mm-dd ',
			language : 'zh-CN',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0
		});
	</script>
</body>
</html>
