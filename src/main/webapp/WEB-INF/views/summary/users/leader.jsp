<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../titlebar2.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript"
	src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#summaryTable').DataTable({
			columnDefs : [ {
				orderable : false,//禁用排序
				targets : [ 5 ]
			//指定的列，以“，”号分割
			} ]

		});
	});
	function ajaxTosxzj() {
		var year = $("#year").val();
		/* alert(year); */
		localStorage.grade = year;
		$.ajax({
			type : "get",
			url : "ajaxIndex.do?",
			data : "year=" + year,
			dataType : "text",
			success : function(data) {
				//重新构建table  目前问题：清除datatable后，显示0条数据，0行
				$('#summaryTable').dataTable().fnClearTable(); //将数据清除  
				$("#test").html(data);
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
	<div class="container-fluid">

		<c:if test="${!empty result}">
			<font size="5" color="red">${result}</font>
		</c:if>
		<br> 选择年级： <input value="${ym}" id="year" name="year"
			style="width: 80px" class="Wdate" type="text"
			onClick="WdatePicker({dateFmt:'yyyy'})"> <input type="button"
			id="btn" value="查询" onclick="ajaxTosxzj()">
		<table id="summaryTable" class="display" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>序号</th>
					<th>实习总结标题</th>
					<th>创建日期</th>
					<th>起始日期</th>
					<th>结束日期</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="test">
				<c:forEach var="summary" items="${wenjuan}" varStatus="stauts">
					<tr>
						<td>${stauts.index+1}</td>
						<td>${summary.title}</td>
						<td><fmt:formatDate value="${summary.createDate}"
								pattern="yyyy-MM-dd" type="date" /></td>
						<td>${summary.startDate}</td>
						<td>${summary.endDate}</td>
						<td><a
							href="<%=path %>/summary/analysis.htm?id=${summary.id}&title=${summary.title}">月总结结果统计分析</a>
							<a href="<%=path %>/summary/textexcle.htm?id=${summary.id}">导出文本题答案</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<%--<script type="text/javascript">
		/* 吴敬国 2015-9-8  去掉了日期和实习任务的弹框*/
		function url_replace(url_add, answerDate) {
			/* var month = document.getElementById(answerDate).value; */
			var practiceTasksID = document.getElementById('practiceId').value;
			document.location.href = url_add + '?answerDate=' + answerDate+'&practiceTasksID=' +practiceTasksID;//不以新窗口打开
		}
	</script>
--%>
</body>
</html>
