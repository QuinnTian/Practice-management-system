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
	$(document).ready(function() {
		$('#summaryTable').DataTable({

			columnDefs : [ {
				orderable : false,//禁用排序
				targets : [ 6 ]
			//指定的列，以“，”号分割
			} ]

		});
	});
	//新增下载!!!!
	function download(file_id) {
		if(file_id==""){
		alert("此总结没有对应文件");
		return null;
		}else  
		{
		window.location.href = "downloadFile.do?file_id="+file_id;
		}
		}
</script>
</head>

<body>

	<div class="container-fluid">

		<c:if test="${!empty result}">
			<font size="5" color="red">${result}</font>
		</c:if>
		<br /> <%-- <a href="<%=path%>/summary/newSummary.htm"
			class="btn btn-lg btn-info" style="width: 12%">创建总结模板</a> --%> <a
			href="<%=path%>/summary/uploadSummary.htm"
			class="btn btn-lg btn-info" style="width: 12%">导入总结</a>

		<br><br>
		<table id="summaryTable" class="display" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>#</th>
					<th>总结标题</th>
					<th>创建日期</th>
					<th>起始日期</th>
					<th>结束日期</th>
					<th>问题数量</th>
					<th>操作</th>
				</tr>
				
			</thead>

			<tbody>
				<c:forEach var="summary" items="${wenjuan}" varStatus="stauts">
					<tr>
						<td>${stauts.index+1}</td>
						<td><a
							href="<%=path %>/summary/newSummary.htm?qn_id=${summary.id}">${summary.title}</a></td>
						<td><fmt:formatDate value="${summary.createDate}"
								pattern="yyyy-MM-dd" type="date" /></td>
						<td>${summary.startDate}</td>
						<td>${summary.endDate}</td>
						<td>${summary.questionNum}</td>
						<td><a href="<%=path %>/summary/${summary.id}/question.htm">添加总结问题</a>
							<!-- return confirm('确认删除问卷吗')吴敬国 2015-6-15 --> <a
							href="<%=path %>/summary/${summary.id}/summaryState.do"> <c:if
									test="${summary.state == '1'}">关闭总结</c:if> <c:if
									test="${summary.state == '0'}">开启总结</c:if>
									
									
						</a> <%-- <a href="<%=path %>/summary/${summary.id}/summaryPreview.htm">下载总结</a> --%>
						
						
						<a href="<%=path %>/summary/${summary.id}/summaryPreview.htm">预览总结</a>
						<%-- <a href="javascript:void(0);" onclick="doDelete('${summary.isHaveSubmit}','${summary.id}');">删除</a>2015-12-31 --%>
							<!-- 								<a target="_blank" id="analysis${stauts.index+1}" -->
							<!-- 									onclick="change_analysis_url(this)" --> <!-- 									href="<%=path%>/summary/questionnaire/analysis.htm?id=${summary.id}&month=">结果</a> -->
<!-- 							<a id="qnuser${stauts.index+1}" data-toggle="modal" -->
<!-- 							data-target="#myModal${stauts.index+1}">详情</a> <a target="_blank" -->
<!-- 							href="<%=path %>/summary/questionnaire/${summary.id}/qr.htm">分享</a> -->
						</td>
						
						<td align="center">
							<input type="button" value="下载" onclick="download('${summary.temp2}');">
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script type="text/javascript">
		function url_replace(url_add, answerDate) {
			var month = document.getElementById(answerDate).value;
			document.location.href = url_add + '?answerDate=' + month;//不以新窗口打开
		}
		//wjg 2015-6-15 
		function doDelete(isHaveSubmit, id) {
			if (isHaveSubmit == "1") {
				alert("已经有同学提交，不能删除。");
			} else {
				if (window.confirm("确定删除此问卷吗?")) {
					window.location.href = "delete.do?id=" + id;
				}
			}
		}
	</script>
</body>
</html>

