<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<base href="<%=basePath%>">

<title>学生实习总结主页</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="css/bootstrap.min.css" rel="stylesheet">
<meta name="viewport" content="width=device-width" />

<style type="text/css">
</style>

</head>

<body>
	<div class="container-fluid">

		<c:if test="${!empty result}">
			<font size="5" color="red">${result}</font>
		</c:if>
		<br />

		<%-- 当前的实习状态为: <select name="state" id="state">
					<c:forEach var="statelist" items="${statelist}" varStatus="stauts">
						<option value="${statelist.stateCode}"<c:if test="${statelist.stateCode==nowpractice_state}"> selected</c:if>>${statelist.stateDesc}</option>
					</c:forEach>
			</select>  --%>
		<div class="row">
			<div class="col-md-6">
				<font color="red" size="3px" id="font1">&lt;你当前的实习状态为:${nowpractice_state}</font><br />
				<font color="red" size="3px" id="font1">&lt;月总结提交时间为每月20号到月底，请按时提交</font><br />
				<font color="black" size="3px" id="font1">&lt;不同状态对应的问题是不同的,所以请确保你的状态是正确的,否则会影响到你的总结成绩。如果不正确，请先在微信端输入sxzt修改你的状态再做总结。</font>
				<input type="hidden" name="practice_state" id="practice_state"
					value="${practice_state}">
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>总结标题</th>
							<th>适用年级</th>
							<th>起始日期</th>
							<th>结束日期</th>
							<!-- <th>预览</th> -->
							<!-- <th>修改</th> -->
							<th>操作</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="summary" items="${summarys}" varStatus="stauts">
							<tr>
								<td>${stauts.index+1}</td>
								<td>${summary.title}</td>
								<td>${summary.year}</td>
								<td>${summary.startDate}</td>
								<td>${summary.endDate}</td>
								<%-- <td><a href="<%=path %>/summary/${summary.id}/summaryPreview.htm">预览总结</a></td> --%>
								<%-- <td><a onclick="editSelectSummary('${summary.id}')">修改总结</a></td> --%>
								<td><a onclick="showSelectSummary('${stauts.index+1}')">答题或修改</a></td>
								<td><a
									onclick="seeMySummary('${summary.id}','${summary.startDate}')">查看总结</a></td>
							</tr>
							<tr>
								<!-- 弹出对话框 -->
								<div class="modal fade" id="myModal${stauts.index+1}"
									tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
									aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<h4 class="modal-title" id="myModalLabel">提示</h4>
											</div>
											<div class="modal-body">
												<c:set var="nowData">
													<fmt:formatDate value="${nowDate}" pattern="yyyy-MM"
														type="date" />
												</c:set>
												选择实习任务<select id="practiceTasks" name="practiceTasks"
													class="form-control">
													<c:forEach var="pt" items="${practiceTasks}"
														varStatus="pt_status">
														<option value="${pt.id}">${pt.task_name }</option>
													</c:forEach>
												</select> 选择总结月份<select id="answerDate${stauts.index+1}"
													name="answerDate${stauts.index+1}" class="form-control">
													<c:forEach var="data" items="${dateList[stauts.count-1]}"
														varStatus="ym_status">
														<c:set var="tempData">
															<fmt:formatDate value="${data}" pattern="yyyy-MM"
																type="date" />
														</c:set>
														<option <c:if test="${tempData > nowData}">disabled</c:if>
															value="<fmt:formatDate value="${data}" pattern="yyyy-MM" type="date"/>">
															<fmt:formatDate value="${data}" pattern="yyyy-MM"
																type="date" />
														</option>
													</c:forEach>
												</select>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">取消</button>
												<a type="button" onclick="enter()" class="btn btn-primary">确定</a>
												<input type="hidden" id="summary_id" value="${summary.id}" />
												<input type="hidden" id="index1" value="${stauts.index+1}" />
											</div>
										</div>
									</div>
								</div>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	
		function showSelectSummary(index){
		
			var name = '#myModal' + index;
			$(name).modal('show');
			
		}
	
		function url_replace(url_add, answerDate) {
			var month = document.getElementById(answerDate).value;
			var practiceTasksID = document.getElementById('practiceTasks').value;
			var StuState = document.getElementById('practice_state').value; 
			document.location.href = url_add + '?answerDate=' + month +'&practiceTasksID=' +practiceTasksID +'&StuState=' +StuState;//不以新窗口打开
		}
		function seeMySummary(summaryId,startDate) {
			var data = {
				summaryId : summaryId
			};

			$.ajax({
				type : "post",
				/* contentType : "application/json", */
				url : "<%=path%>/summary/isAnswerSummary.do",
				data : data, //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法		
					if(data==0){
						alert("请先答题再查看");
					}else{
						window.location.href = "<%=path%>/summary/queryUserSummary/seeMySumbitSummary.htm?summaryId=" + summaryId+"&startDate="+startDate;
					}
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
			
		}
		function enter(){
		var summary_id=$("#summary_id").val();
		var index1=$("#index1").val();
		var answerDate=$("#answerDate"+index1).val();
		var practiceTasks=$("#practiceTasks").val();
		var StuState=$("#practice_state").val();
		if(practiceTasks==null){
		alert("请选择实习任务。");
		}
		else if(practiceTasks!=null){
		window.location.href = "<%=path%>/summary/" + summary_id+ "/summary.htm?answerDate=" + answerDate+ "&&practiceTasksID=" + practiceTasks + "&&StuState="+StuState;
			}
		}
	</script>
</body>
</html>

