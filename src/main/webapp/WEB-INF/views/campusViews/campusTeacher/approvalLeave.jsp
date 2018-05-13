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
<link href="<%=path%>/bootstrap/sample in bootstrap v3/css/bootstrap-datetimepicker.min.css" rel="stylesheet"
	media="screen">
<script src="<%=path%>/bootstrap/sample in bootstrap v3/jquery/jquery-1.8.3.min.js"></script> 
<script type="text/javascript">
	var status = "";//记录用户选择查询的状态
	var type = "${type}";
	function getLevelApprovalByDate() {
		var date = $("#dtp_input2").val();
		if (date == null || date == "") {
			alert("请选择时间后，查询！");
			return;
		}
		getLevelApproval(status, date);
	}

	function getLevelApproval(flag, date) {
		if (flag == null || flag == "") {
			alert("error");
			return;
		}
		status = flag;//修改状态
		$.ajax({
			type : "get",
			url : "CampusTeacher/web/ajaxGetApprovalLeave.do",
			data : "flag=" + flag + "&type=" + type + "&date=" + date,
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
</script>
</head>
<body style="margin:50px" class="table-responsive">
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<br>
				<ul class="nav nav-pills" id="nav" role="tablist">
					<li role="presentation" class="active"><a href="CampusTeacher/web/seeStudentLeaveList.do?type=${type}">未审批<span
							class="badge">${ApprovalLevelNumber}</span>
					</a></li>
					<li onclick="getLevelApproval('no','null')" role="presentation"><a>审批未通过 <span class="badge">${noApprovalLevelNumber}</span>
					</a></li>
					<li onclick="getLevelApproval('yes','null')" role="presentation"><a>审批通过 <span class="badge">${yesApprovalLevelNumber}</span>
					</a></li>
					<li onclick="getLevelApproval('subLeader','null')" role="presentation"><a>交领导审批<span class="badge">${yesApprovalLevelNumber}</span>
					</a></li>
					<li onclick="getLevelApproval('others','null')" role="presentation"><a>其他审批 <span class="badge">${otherApprovalLevelNumber}</span>
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
					<div class="form-group">
						<label for="dtp_input2">时间查询</label>
						<div class="input-group date form_date col-md-8" data-date="" data-date-format="" data-link-field="dtp_input2"
							data-link-format="yyyy-mm-dd">
							<input class="form-control" size="16" type="text" value="" placeholder="审批时间">
							<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span> <span
								class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
						</div>
						<input type="hidden" id="dtp_input2" value="" />
						<br />
					</div>
					<button id="query" type="button" class="btn btn-default" onclick="getLevelApprovalByDate()">查询</button>

				</form>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<table class="table table-striped table-bordered" id="content">
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
				<th>学生电话</th>
				<th>家长电话</th>
				<th>审批</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="application" items="${applicationListAll}" varStatus="staut">

				<c:set scope="request" value="${application.sla_leave_type}" var="sla_leave_type" />
				<%
					String sla_leave_type = (String) request.getAttribute("sla_leave_type");
				%>
				<tr>

					<td>${stauts.index+1}</td>
					<td><c:set scope="request" value="${application.sla_real_students_id}" var="sla_real_students_id" /> <%
 	String sla_real_students_id = (String) request.getAttribute("sla_real_students_id");
         		String[] realStudentsIdArr = sla_real_students_id.split(",");
         		Student stu = null;
         		String studentNames="";
         		int num=0;
      	  		String tempRoword="";
         		if(!(sla_leave_type.equals("1"))){//集体请假
      	   		for (String str : realStudentsIdArr) {
      	  	
      	   			stu = DictionaryService.findStudent(str);
      	   			if (stu != null) {
      	   				studentNames+=stu.getTrue_name() + ",";
      	   			if(num>=2)
  						continue;
  					tempRoword+=stu.getTrue_name() + ",";
  					num++;
      	   			}
      	   		}
 %>
						<button type="button" class="btn btn-default" title="请假人姓名" id="${application.sla_code}" data-container="body"
							onmouseover="mouseover('${application.sla_code}')" onmouseout="mouseout('${application.sla_code}')"
							data-toggle="popover" data-placement="bottom" data-content="<%=studentNames%>"><%=tempRoword+"等"+realStudentsIdArr.length%>人
						</button> <%
 	}
         		if(sla_leave_type.equals("1")){//个人请假
         			for (String str : realStudentsIdArr) {
      	   			stu = DictionaryService.findStudent(str);
      	   			if (stu != null) {
      	   				out.println(stu.getTrue_name());
      	   			}
      	   		}
         		}
 %></td>
					<td>
						<%
							if ("1".equals(sla_leave_type)) {
									out.println(DictionaryService.findOrg(stu.getClass_id()).getOrg_name());
							}
						%>
						<c:set scope="request" value="${application.sla_org_id}" var="sla_org_id" /> <%
 	String sla_org_id = (String) request.getAttribute("sla_org_id");
					Association association = DictionaryService.findAssociation((sla_org_id));
 		if (association != null) {
 			out.println(association.getSa_name());
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
					<td><select onchange="agreeOrDisagree('${application.id}',this.value,this.options[this.selectedIndex])">
							<option value="00" name="00">请选择</option>
							<option id="aa" value="y">同意</option>
							<option id="bb" value="n">不同意</option>
							<option id="cc" value="ys">同意交领导</option>
							<option id="dd" value="ns">不同意交领导</option>
						</select> <%-- <button class="btn btn-success" data-toggle="modal" onclick="agreeOrDisagree('${application.id}','y',this)">同意</button>
						<button class="btn btn-default" data-toggle="modal" onclick="agreeOrDisagree('${application.id}','n',this)">不同意</button>
						<button class="btn btn-success" data-toggle="modal" onclick="agreeOrDisagree('${application.id}','ys',this)">同意交领导</button>
						<button class="btn btn-default" data-toggle="modal" onclick="agreeOrDisagree('${application.id}','ns',this)">不同意交领导</button> --%>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="ture">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div class="modal-body">
					<form id="updateApplication" name="updateApplication" action="CampusTeacher/web/ApprovalLeave.do" method="post">
						<input type="hidden" value="" name="id" id="id" />
						<input type="hidden" value="" name="userChoose" id="userChoose" />
						<input type="hidden" value="${type}" name="type" id="type" />

						<div class="form-group">
							<label for="message-text" class="control-label">意见:</label>
							<textarea class="form-control" id="message-text" name="approval_opinion"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="closeModal('submit')">提交</button>
				</div>
			</div>
		</div>
	</div>
	<script src="<%=path%>/bootstrap/sample in bootstrap v3/js/bootstrap.min.js"></script>
	<script src="<%=path%>/bootstrap/sample in bootstrap v3/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script src="<%=path%>/bootstrap/sample in bootstrap v3/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
	<script>
		//打开bootstap的模态框
		function agreeOrDisagree(id, userChoose, currentButton) {
			var promptMsg = currentButton.innerText + ':';
			$("#message-text").html(promptMsg);
			$("#userChoose").attr("value", userChoose);
			$("#id").attr("value", id);
			$("#myModal").modal();
		}
		//保存
		function closeModal(state) {

			$("#myModal").modal('hide');
			if (state = "submit") {
				$("#updateApplication").submit();
			}
			$("#id").attr("value", "");
			$("#message-text").html("");
			return false;
		}

		function showRecord(ajaxData) {
			$("#content").html(ajaxData);
		};
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
