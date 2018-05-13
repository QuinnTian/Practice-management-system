<%@ page language="java" import="java.util.*" pageEncoding="utf-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>奖惩管理</title>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript">
	function add() {
		window.location.href = "evaluateAdd.do";
	}
	//删除奖惩
	function doDel(id) {
		if (window.confirm("确定删除此记录?")) {
			window.location.href = "deleteEvaluate.do?id=" + id;
		}
	}
	//查看奖惩详情
	function doCheck(id) {
		window.location.href = "evaluateDetail.do?id=" + id;
	}
	function getPracticeTask() {// 向服务器发送搜索请求
		$.ajax({
			type : "get",
			/* contentType : "application/json", */
			url : "getPracticeTask.do?",
			data : getSendData(), //设置发送参数，即使参数为空，也需要设置                
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
	function getSendData() {
		var grade = $("#year").val();
		var dataSend = "grade=" + grade;
		return dataSend;
	}
	function showPractice(ajaxData) {//根据返回数据显示搜索结果
		$("#practice_id").html(ajaxData);
	};
	function ajaxEvaluate() {// 向服务器发送搜索请求
		var pi = $("#practice_id").val();
		if (pi == "0") {
			alert("请选择任务");
			return null;
		}
		$.ajax({
			type : "get",
			url : "ajaxEvaluate.do?",
			data : getData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法					
				getEvaluate(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert(status);
				}
			}
		});
	}
	function getData() {
		var practice_id = $("#practice_id").val();
		var dataSend = "practice_id=" + practice_id;
		return dataSend;
	}

	function getEvaluate(ajaxData) {//根据返回数据显示搜索结果
		$("table[id='teaTable'] tr[id!='biaotou']").remove();
		$("#biaotou").after(ajaxData);
	};
	//用来返回前一个页面的数据
	function ajaxEvaluate2() {// 向服务器发送搜索请求
		$.ajax({
			type : "get",
			url : "ajaxEvaluate.do?",
			data : getData2(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法					
				getEvaluate2(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert(status);
				}
			}
		});
	}
	function getData2() {
		var practice_id = $("#practiceId1").val();
		var dataSend = "practice_id=" + practice_id;
		return dataSend;
	}

	function getEvaluate2(ajaxData) {//根据返回数据显示搜索结果
		$("table[id='teaTable'] tr[id!='biaotou']").remove();
		$("#biaotou").after(ajaxData);
	};
	window.onload = function() {
		var grade1 = $("#grade1").val();
		var practiceId1 = $("#practiceId1").val();
		if ((grade1 != null && grade1 != "")
				&& (practiceId1 != null && practiceId1 != "")) {
			getPracticeTask();
			$("#hiddenBtn").click();
		}
	};
</script>
</head>
<body>
	<h2>奖惩信息列表</h2>
	<p>
		<input id="grade1" value="${evaluate_grade}" style="display:none;">
		<input id="practiceId1" value="${evaluate_practiceId}" style="display:none;">
		<button id="hiddenBtn" style="background-color:#666666; display:none;" onclick="ajaxEvaluate2();">Hidden</button>
		<c:set var="grade1" value="${evaluate_grade}" scope="request"></c:set>
		<c:set var="practiceId1" value="${evaluate_practiceId}" scope="request"></c:set>
		<%
			String grade1 = (String) request.getAttribute("grade1");
			String practiceId1 = (String) request.getAttribute("practiceId1");
		%>
		入学年份：
		<select name="year" id="year" onChange=getPracticeTask() style="width:100px">
			<c:forEach var="grade" items="${Grade}" varStatus="stauts">
				<option value="${grade.grade}" <c:if test="${grade.grade==grade1}">selected</c:if>>${grade.grade}</option>
			</c:forEach>
		</select>
		实习任务：
		<select name="practice_id" id="practice_id" style="width:220px">
			<c:forEach var="pt" items="${pts}" varStatus="stauts">
				<option value="${pt.id}">${pt.task_name}</option>
			</c:forEach>
		</select>
		&nbsp; &nbsp;
		<input type="button" value="查询" id="seacher" onclick="ajaxEvaluate();" />
		&nbsp; &nbsp; &nbsp; &nbsp;
		<input type="button" value="新增奖惩" onclick="javascript:add();">
	</p>
	<table border="1" width="1090" id="teaTable" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr align="center" id="biaotou">
			<th width="100">发生时间</th>
			<th width="100">学号</th>
			<th width="100">姓名</th>
			<th width="90">班级</th>
			<th width="200">任务名称</th>
			<th width="100">指标名称</th>
			<th width="300">描述</th>
			<th width="50">分数</th>
			<th width="50">操作</th>
		</tr>
		<c:forEach var="e" items="${result}" varStatus="stauts">
			<tr align="center">
				<c:set var="si" value="${e.stu_id}" scope="request"></c:set>
				<c:set var="pi" value="${e.practice_id}" scope="request"></c:set>
				<c:set var="ii" value="${e.index_id}" scope="request"></c:set>
				<%
					String stu_id = (String) request.getAttribute("si");
						String pra_id = (String) request.getAttribute("pi");
						String ind_id = (String) request.getAttribute("ii");
				%>
				<td>
					<fmt:parseDate value="${e.time}" var="create_time" />
					<fmt:formatDate value="${create_time}" pattern="yyyy/MM/dd" />
				</td>
				<td>
					<%
						if (DictionaryService.findStudent(stu_id) == null) {
								out.print("无信息");
							} else {
								out.println(DictionaryService.findStudent(stu_id)
										.getStu_code());
							}
					%>
				</td>
				<td>
					<%
						if (DictionaryService.findStudent(stu_id) == null) {
								out.print("无信息");
							} else {
								out.println(DictionaryService.findStudent(stu_id)
										.getTrue_name());
							}
					%>
				</td>
				<td>
					<%
						if (DictionaryService.findStudent(stu_id) != null
									&& DictionaryService.findOrg(DictionaryService
											.findStudent(stu_id).getClass_id()) != null) {
								out.println(DictionaryService
										.findOrg(
												DictionaryService.findStudent(stu_id)
														.getClass_id()).getOrg_name());
							} else {
								out.print("<font color='red'>无信息</font>");
							}
					%>
				</td>
				<td>
					<%
						if (DictionaryService.findPracticeTask(pra_id) == null) {
								out.print("<font color='red'>无信息</font>");
							} else {
								out.println(DictionaryService.findPracticeTask(pra_id)
										.getTask_name());
							}
					%>
				</td>
				<td>
					<%
						if (DictionaryService.findEvalsIndex(ind_id) == null) {
								out.print("<font color='red'>无信息</font>");
							} else {
								out.print(DictionaryService.findEvalsIndex(ind_id)
										.getIndex_name());
							}
					%>
				</td>
				<td>${e.description}</td>
				<td>${e.score}</td>
				<td>
					<input type="button" value="删除" onclick="doDel('${e.id}');">
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
