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
	var status = "initData";//记录用户选择查询的状态	

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
			url : "CampusLeader/web/ajaxGetApprovalLeave.do",
			data : "flag=" + flag + "&date=" + date,
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

	//查出系部所对应的班级 
	function changeCK() {
		$.ajax({
			type : "get",
			url : "CampusLeader/web/classList.do?",
			data : getCanShu(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法					
				showPractice(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert(status);
				}
			}
		});
	}
	function getCanShu() {
		var xibu = $("#department_id").val();
		var dataSend = "tiaojian=" + xibu;
		return dataSend;
	}
	function showPractice(ajaxData) {//根据返回数据显示搜索结果
		$("#classId").html(ajaxData);
	};
	function studList() {
		var selectedValue = document.getElementById("classId");
		var selectedIndex = selectedValue.selectedIndex;
		if ((selectedValue.options[selectedIndex].value == "请选择班级")) {
			alert("请先选择班级");
			return null;
		}
		var ajaxUrl = "studentList.do?ClassId="
				+ selectedValue.options[selectedIndex].value;
		Students(ajaxUrl);
	}
	//用来返回上一个界面的数据
	function studList2() {
		var class_id1 = $("#class_id1").val();
		var ajaxUrl = "studentList.do?ClassId=" + class_id1;
		Students2(ajaxUrl);
	}
	function mouseover(applicationCode) {
		$("#" + applicationCode).popover('show');
	}
	function mouseout(applicationCode) {
		$("#" + applicationCode).popover('hide');
	}
</script>
</head>
<body style="margin:50px" class="table-responsive">
	<nav class="navbar navbar-default">
		<div class="container-fluid">

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<br>
				<ul class="nav nav-pills" id="nav" role="tablist">
					<li role="presentation" class="active"><a href="CampusLeader/web/seeStudentLeaveList.do">老师推送<span
							class="badge">${ApprovalLevelNumber}</span>
					</a></li>
					<li onclick="getLevelApproval('others','null')" role="presentation"><a>其他领导审批 <span class="badge">${otherApprovalLevelNumber}</span>
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
					<div class="form-group">
						<!-- 系部和班级的选择！！！！  -->
						<%--
					 <%
					String dept_name = (String) request.getAttribute("dept_name");
				%>
						<label>选择系部:</label>
						<select name="department_id" id="department_id" class="form-control" onChange="changeCK()">
						<option value="0">请选择系部</option>
			<c:forEach var="departmentlist" items="${departmentlist}" varStatus="stauts">
				<option value="${departmentlist.id}"<c:if test="${departmentlist.org_name==dept_name}"> selected</c:if>>${departmentlist.org_name}</option>
			</c:forEach>
		</select> 
						
					</div>
					<div class="form-group">
						<label>选择班级:</label>
						<select id="classId" name="classId" class="form-control">
		                <option value="请选择班级">请选择班级</option>
	                    </select>
					</div> --%>
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
						<button type="button" class="btn btn-default" onclick="getLevelApprovalByDate()">查询</button>
				</form>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<table class="table table-striped table-bordered" id="content">
		<thead>
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
				<th>请假时长</th>
				<th>审批意见</th>
				<th>审批老师</th>
				<th>审批时间</th>
				<th>学生电话</th>
				<th>家长电话</th>
				<th>审批</th>
			</tr>

		</thead>
		<tbody>
			<c:forEach var="levelApproval" items="${levelApprList}" varStatus="stauts">
				<c:set scope="request" value="${levelApproval.application.sla_leave_type}" var="sla_leave_type" />
				<%
					String sla_leave_type = (String) request.getAttribute("sla_leave_type");
				%>

				<tr>
					<td>${stauts.index+1}</td>
					<td><c:set scope="request" value="${levelApproval.application.sla_real_students_id}"
							var="sla_real_students_id" /> <%
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
						<button type="button" class="btn btn-default" title="请假人数" id="${levelApproval.application.sla_code}"
							data-container="body" onmouseover="mouseover('${levelApproval.application.sla_code}')"
							onmouseout="mouseout('${levelApproval.application.sla_code}')" data-toggle="popover" data-placement="bottom"
							data-content="<%=studentNames%>"><%=tempRoword+"等"+realStudentsIdArr.length%>人
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
						<c:set scope="request" value="${levelApproval.application.sla_org_id}" var="sla_org_id" /> <%
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
												} else if("2".equals(sla_leave_type)) {
													out.println("班级请假");
												}else if("3".equals(sla_leave_type)){
													out.println("学生会请假");
												}else if("4".equals(sla_leave_type)){
													out.println("社团请假");
												}
						%>
					</td>
					<td>${levelApproval.application.sla_reason_desc}</td>
					<td><c:set scope="request" value="${levelApproval.application.sla_stu}" var="sla_stu" /> <%
 	String sla_stu = (String) request.getAttribute("sla_stu");
                     		Student	applyStudent=DictionaryService.findStudent(sla_stu);
                     		if(applyStudent!=null){
                       				out.println(applyStudent.getTrue_name());
                     		}
 %></td>
					<td><fmt:formatDate value="${levelApproval.application.sla_time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td><fmt:formatDate value="${levelApproval.application.sla_begin_time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td><fmt:formatDate value="${levelApproval.application.sla_end_time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>${levelApproval.application.sla_duration}</td>

					<td>${levelApproval.approval_opinion}</td>
					<td><c:set scope="request" var="approval_tea" value="${levelApproval.application.final_approval_tea}" /> <%
 	String approval_tea = (String) request
                       				.getAttribute("approval_tea");
                       		if (approval_tea != null)
                       			out.println(DictionaryService.findTeacher(approval_tea)
                       					.getTrue_name());
                       		else
                       			out.println("无");
 %></td>
					<td><fmt:formatDate value="${levelApproval.application.final_approval_time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>



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
					<td>
						<button class="btn btn-success" data-toggle="modal"
							onclick="agreeOrDisagree('${levelApproval.application.id}','y','${levelApproval.id}',this)">同意</button>
						<button class="btn btn-default" data-toggle="modal"
							onclick="agreeOrDisagree('${levelApproval.application.id}','n','${levelApproval.id}',this)">不同意</button>
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
					<h4 class="modal-title" id="myModalLabel">添加审批意见</h4>
				</div>
				<div class="modal-body">
					<form id="updateApplication" name="updateApplication" action="CampusLeader/web/ApprovalLeave.do" method="post">
						<input type="hidden" value="" name="id" id="id" />
						<input type="hidden" value="" name="userChoose" id="userChoose" />
						<input type="hidden" value="" name="levelApprovalId" id="levelApprovalId" />

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
		function agreeOrDisagree(id, userChoose, levelApprovalId, currentButton) {
			var promptMsg = currentButton.innerText + ':';
			$("#message-text").html(promptMsg);
			$("#userChoose").attr("value", userChoose);
			$("#levelApprovalId").attr("value", levelApprovalId);
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
			return false;
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