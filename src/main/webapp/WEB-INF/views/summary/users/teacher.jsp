<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../titlebar.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript">
	//根据年级得到实习任务
	function changeGrade() {
		$.ajax({
			type : "get",
			url : "ajaxGetPraByChangeGrade.do?",
			data : getGrade(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法					
				showPracticeList(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert(status);
				}
			}
		});
	}
	function getGrade() {
		var grade = $("#grade").val();
		var dataSend = "grade=" + grade;
		return dataSend;
	}
	function showPracticeList(ajaxData) {
		$("#praticeTaskId").html(ajaxData);
	};
	$(document).ready(function() {

		var myselect = document.getElementById("praticeTaskId");
		var index = myselect.selectedIndex; // selectedIndex代表的是你所选中项的index
		var group_name = myselect.options[index].text;
		document.getElementById("groupname").innerText = group_name;

		$('#summaryTable').DataTable({

			columnDefs : [ {
				"targets" : [ 5 ],
				"visible" : false,
				"searchable" : false
			}, {
				orderable : false,//禁用排序
				targets : [ 6 ]
			//指定的列，以“，”号分割
			} ]

		});
		changePricticeId();
	});
	function changePricticeId() {
		var praticeTaskId = $("#praticeTaskId").val();
		$("#practiceId").val(praticeTaskId);

		var myselect = document.getElementById("praticeTaskId");
		var index = myselect.selectedIndex; // selectedIndex代表的是你所选中项的index
		var group_name = myselect.options[index].text;
		document.getElementById("groupname").innerText = group_name;
		//var year = $("#year").val();
		/* alert(year); */
		//localStorage.grade =year;
		$.ajax({
			type : "get",
			url : "ajaxIndexTeacher.do?",
			data : "praticeTaskId=" + praticeTaskId,
			dataType : "text",
			success : function(data) {
				//重新构建table  目前问题：清除datatable后，显示0条数据，0行
				$('#summaryTable').dataTable().fnClearTable(); //将数据清除  
				$("#test").html(data);
				;
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

<body>
	<input type="hidden" value="${practiceId}" id="practiceId"
		name="practiceId">
	<input type="hidden" value="${grade}" id="grade" name="grade">
	<div class="container-fluid">

		<c:if test="${!empty result}">
			<font size="5" color="red">${result}</font>
		</c:if>
		<br> <b>条件查询：</b> <select name="praticeTaskId" id="praticeTaskId">
			<c:forEach items="${praList}" var="group" varStatus="status">

				<option value="${group.id}" id="name">${group.task_name}</option>
			</c:forEach>
		</select> <input type="button" value="查询" id="seacher"
			onclick="changePricticeId();" /> <font color="red"> <b>您当前选择的是：<span
				id="groupname" name="groupname"></span>的学生总结
		</b></font>
		<table id="summaryTable" class="display" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>序号</th>
					<th>实习总结标题</th>
					<th>创建日期</th>
					<th>起始日期</th>
					<th>结束日期</th>
					<th>提交数量</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="test">
				<c:forEach var="summary" items="${summaryQuestionnaires}"
					varStatus="stauts">
					<tr>
						<td>${stauts.index+1}</td>
						<td>${summary.title}</td>
						<td><fmt:formatDate value="${summary.createDate}"
								pattern="yyyy-MM-dd" type="date" /></td>
						<td>${summary.startDate}</td>
						<td>${summary.endDate}</td>
						<td>${summary.commitNum}</td>
						<td>
							<%-- <a id="qnuser${stauts.index+1}" data-toggle="modal" data-target="#myModal${stauts.index+1}">查看实习报告</a> --%>
							<a id="qnuser${stauts.index+1}" href="#"
							onclick="url_replace('<%=path %>/summary/${summary.id }/queryUserSummary/sumbitSummaryUserList.htm','${summary.startDate}')">查看实习报告</a>
							<a href="<%=path %>/summary/${summary.id}/summaryPreview.htm">查看总结题目</a>
						</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
		<input type="hidden" id="lastGroupName" value="${lastGroupName}">
	</div>

	<script type="text/javascript">
		/* 吴敬国 2015-9-8  去掉了日期和实习任务的弹框*/
		function url_replace(url_add, answerDate) {
			/* var month = document.getElementById(answerDate).value; */
			var practiceTasksID = document.getElementById('praticeTaskId').value;
			document.location.href = url_add + '?answerDate=' + answerDate
					+ '&practiceTasksID=' + practiceTasksID;//不以新窗口打开
		}
	</script>
</body>
</html>

