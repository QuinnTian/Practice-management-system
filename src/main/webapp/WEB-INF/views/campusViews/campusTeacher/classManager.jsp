<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="en">
<meta charset="utf-8" />
<base href="<%=basePath%>">
<head>
<title>班级管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1,user-scalable=no">
<!-- Bootstrap -->
<link href="<%=path%>/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">

<script src="<%=path%>/bootstrap/js/jquery.min.js"></script>
 <script src="<%=path %>/bootstrap/js/bootstrap.min.js"></script> 


</head>
<body>
	<br>
	<div>
		<h1>班级管理</h1>
	</div>
	<div class="container" style="padding:0px;padding-top:20px;">
		<nav class="navbar navbar-default">

			<form class="navbar-form navbar-left" role="search">

				<div class="form-group">
					<label for="time">班级</label>
					<select class="form-control" id="clazz">
						<c:forEach var="classes" items="${classList}">
							<option value="${classes.id}">${classes.org_name}</option>
						</c:forEach>
					</select>
				</div>
			</form>

		</nav>

		<table class="table table-hover table-bordered">
			<thead>
				<tr>
					<th>序号</th>
					<th>学号</th>
					<th>姓名</th>
					<th>班级</th>
					<th>性别</th>
					<th>手机</th>
					<!-- 	<th>宿舍</th> -->
					<th>职务</th>
					<th>操作</th>

				</tr>
			</thead>
			<tbody id="content">
				<c:forEach var="stu" items="${stuList}" varStatus="status">
					<tr>
						<td>${status.index+1}</td>
						<td>${stu.stu_code }</td>
						<td>${stu.true_name }</td>
						<td><c:set value="${stu.class_id}" scope="request" var="class_id" /> <%
 	String class_id = (String) request.getAttribute("class_id");
 		out.println(DictionaryService.findOrg(class_id).getOrg_name());
 %></td>
						<td>${stu.sex}</td>
						<td>${stu.phone}</td>
						<td id="${stu.id}">${stu.temp1}</td>
						<%-- <td>${stu.temp2}</td> --%>
						<td>
							<button class="btn btn-success" onclick="openModel('${stu.id}')">任职</button>
							<button class="btn btn-default" onclick="dismissal('${stu.id}')">离职</button>
						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="ture">
		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<form id="appointment" name="appointment" action="saveStudentDuties.do" method="post">
					<input type="hidden" value="" name="stuId" id="stuId" />
					<div class="modal-body">
						<div class="form-group">
							<label for="time">班委职务</label>
							<select class="form-control" name="dutiesId">
								<c:forEach var="duties" items="${dutiesList}">
									<option value="${duties.id}">${duties.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="time">是否班级管理员</label>
							<select class="form-control" name="flag">
								<option value="n">否</option>
								<option value="y">是</option>
							</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">备注:</label>
							<textarea class="form-control" id="message-text" name="note"></textarea>
						</div>
						<p style="color:red">*一般情况：班长职务为班级管理员</p>
					</div>
				</form>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="closeModal()">提交</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="ture">
		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div class="form-group">
					<label for="message-text" class="control-label">离职原因:</label>
					<textarea class="form-control" id="quitReason" name="quitReason"></textarea>
				</div>
				<input type="hidden" value="" name="studentId" id="studentId" />
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" onclick="closeModal2()">确定</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$("#clazz").change(function() {
				var url = "ajaxGetStudents.do";
				var params = {
					"classId" : $("#clazz").val()
				};
				$.post(url, params, function(data) {
					$("#content").html(data);
				});
				return false;
			});

		});

		//打开bootstap的模态框
		function openModel(stuId) {
			var duty = $("#" + stuId).html();
			if (!(duty == "" || duty == null)) {
				alert("老师，该学生已有职务，请先离职，在任职！");
				return;
			}
			$("#stuId").attr("value", stuId);
			$("#myModal").modal();
		}
		//保存
		function closeModal() {

			$("#myModal").modal('hide');
			$("#appointment").submit();
			return false;
		}
		//撤职方法
		function dismissal(stuId) {
			var duty = $("#" + stuId).html();
			if (duty == "" || duty == null) {
				alert("该学生没有职务，不能离职！");
				return;
			}
			openModel2(stuId);
		}
		function openModel2(stuId) {
			$("#studentId").attr("value", stuId);
			$("#myModa2").modal();

		}
		function closeModal2() {
			$("#myModa2").modal('hide');
			var stuId = $("#studentId").val();
			var duty = $("#" + stuId).html();
			var quitReason = $("#quitReason").val();
			var url = "ajaxGetStudents.do";
			var params = {
				"classId" : $("#clazz").val(),
				"stuId" : stuId,
				"duty" : duty,
				"quitReason" : quitReason
			};
			$.post(url, params, function(data) {
				$("#content").html(data);
			});
			return false;
		}
	</script>
</body>
</html>