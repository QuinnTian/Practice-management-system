<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%
	String path = request.getContextPath();
	String basePath = request.getServerName() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>审批实习申请</title>
<style type="text/css">
a {text-decoration:underline;cursor:hand;}
a:link {color:#000000;text-decoration:none;}   
</style>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.reveal.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/UnCommitPra.css">
<script type="text/javascript">
	function showCount(){
	 	$("#check_count").show(); 
	 }
	function Select(state) {
		window.location.href = "checkPracticeList.do?check_state=" + state;
	}
	//根据年级得到实习任务
	function changeGrade() {
		$.ajax({
			type : "get",
			url : "ajaxGetPraByChangeGrade.do?",
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
		var grade = $("#grade").val();
		var dataSend = "grade=" + grade;
		return dataSend;
	}
	function showPractice(ajaxData) {
		$("#praticeTaskId").html(ajaxData);
	};
	//根据实习任务id得到下面的所有信息
	function getPracticeRecode() {
		var grade = $("#grade").val();
		var praticeTaskId = $("#praticeTaskId").val();
		if(grade!="请选择入学年份"){
			if (praticeTaskId == "请选择实习任务") {
				alert("请选择实习任务");
			} else {
				window.location.href = "getPracticeRecode.do?praticeTaskId="+ praticeTaskId;
				showCount();
			}
		}else{
			alert("请选择入学年份");
		}
	}
	function getPR(check_state) {
		var grade = $("#grade").val();
		var praticeTaskId = $("#praticeTaskId").val();
		if(grade!="请选择入学年份"){
			if (praticeTaskId == "请选择实习任务") {
				alert("请选择实习任务");
			} else {
				window.location.href = "getPracticeRecode.do?check_state="+ check_state;
			}
		}else{
			alert("请选择入学年份");
		}
	};
	
	
	function getUnCommitStus(){
			$.ajax({
				type : "get",
				/* contentType : "application/json", */
				url : "ajaxGetUnCommitStus.do?",
				data : getUnCommitDate(), //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法					
				setUnSinStus(data);
				console.log("ajaxDataUnSin:"+data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
		}
	function getUnCommitDate() {
			var praticeTaskId = $("#praticeTaskId").val();
			var dataSend = "praticeTaskId="+praticeTaskId;		
			console.log(dataSend);
			return dataSend;
		}
	function setUnSinStus(ajaxData){
		$("table[id='table'] tr[id!='tr']").remove();
		$("#tr").after(ajaxData);
		console.log("ajax返回成功！");
		
		
		}
</script>
</head>

<body>
	<h2>审批实习申请</h2>
	<p>
		<b>条件查询：</b>
		<c:set var="defaultyear" value="${checkPraTask_grade}" scope="request"></c:set>
		<%
			String defaultyear = (String) request.getAttribute("defaultyear");
		%>
		入学年份 <select name="grade" id="grade" id="selector" onChange="changeGrade()">
			<option value="请选择入学年份" <%="请选择入学年份".equals(defaultyear) ? "selected" : ""%>>请选择入学年份</option>
			<option value="2012" <%="2012".equals(defaultyear) ? "selected" : ""%>>2012</option>
			<option value="2013" <%="2013".equals(defaultyear) ? "selected" : ""%>>2013</option>
			<option value="2014" <%="2014".equals(defaultyear) ? "selected" : ""%>>2014</option>
			<option value="2015" <%="2015".equals(defaultyear) ? "selected" : ""%>>2015</option>
		</select> &nbsp;&nbsp;
		<c:set var="defaultTaskName" value="${default_TaskName}" scope="request"></c:set>
		<%
			String defaultTaskName = (String) request.getAttribute("defaultTaskName");
		%>
		实习任务<select name="praticeTaskId" id="praticeTaskId" style="width:280px">
			<option value="请选择实习任务" <%="请选择实习任务".equals(defaultTaskName) ? "selected" : ""%>>请选择实习任务</option>
			<c:forEach var="checkPraTaskList" items="${checkPraTaskList}" varStatus="stauts">
				<option value="${checkPraTaskList.id}"
					<c:if test="${checkPraTaskList.task_name==defaultTaskName}"> selected</c:if>>
					${checkPraTaskList.task_name}</option>
			</c:forEach>
		</select> &nbsp;&nbsp;<input type="button" value="查询" id="seacher" onclick="getPracticeRecode();"  />
	</p>
	<p align="left" id="check_count" ><!-- style="display: none" -->
		<%-- <div style="float:left; margin-left:10px;"  onmouseout="this.style.backgroundColor='#4169E1'"><a onclick="getPR('0');">未审核:${check_count_0}</a></div>
		<div style="float:left; margin-left:10px;"  onmouseout="this.style.backgroundColor='#4169E1'"><a onclick="getPR('1');">已通过:${check_count_1}</a></div>
		<div style="float:left; margin-left:10px;"  onmouseout="this.style.backgroundColor='#4169E1'"><a onclick="getPR('2');">未通过:${check_count_2}</a></div> --%>
		&nbsp;&nbsp;<button onclick="getPR('0');">未审核:${check_count_0}</button>
		&nbsp;&nbsp;<button onclick="getPR('1');">已通过:${check_count_1}</button>
		&nbsp;&nbsp;<button onclick="getPR('2');">未通过:${check_count_2}</button>
		<%-- &nbsp;&nbsp;<button onclick="getPR('3');">未提交:${check_count_3}</button> --%>
		&nbsp;&nbsp;<button id="abcd" data-reveal-id="myModal" onclick="getUnCommitStus()">从未提交学生 : ${unCommitNum}</button>
	</p> 
	<table border="1" width="1300" id="praTable" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="120">学号</th>
			<th width="120">学生姓名</th>
			<th width="120">申请时间</th>
			<th width="120">企业名称</th>
			<th width="120">岗位名称</th>
			<th width="120">公司地区</th>
			<th width="120">工作地区</th>
			<th width="120">申请状态</th>
			<th width="120">备注</th>
			<th width="150">操作</th>
		</tr>
		<c:forEach var="p" items="${modelList}" varStatus="stauts">
			<tr>
				<td><c:set var="si" value="${p.stu_id}" scope="request"></c:set>
					<%
						String stu_id = (String) request.getAttribute("si");
					%> 
					<%
 						out.println(DictionaryService.findStudent(stu_id).getStu_code());
 					%>
				</td>
				<td>
					<%
						out.println(DictionaryService.findStudent(stu_id).getTrue_name());
					%>
				</td>
				<td><fmt:parseDate value="${p.apply_time}" var="apply_time" />
					<fmt:formatDate value="${apply_time}" pattern="yyyy/MM/dd" /></td>
				<td><c:set var="ci" value="${p.company_id}" scope="request"></c:set>
					<%
						String company_id = (String) request.getAttribute("ci");
					%> 
					<%
						if(DictionaryService.findCompany(company_id)==null){
							out.println("学生没有申请公司，应该不能通过。");
						}else{
						out.println(DictionaryService.findCompany(company_id).getCom_name());
						}
 					%><br>
				<td>${p.post_id}</td>
				<td>${p.com_orgion}</td>
				<td>${p.work_orgion}</td>
				<td>
				<c:if test="${p.check_state==1}">
				已通过
				</c:if> 
				<c:if test="${p.check_state==2}">
					<font color="red">未通过</font>
				</c:if> 
				<c:if test="${p.check_state==0}">
				未审核
				</c:if></td>
				<td>
				<c:if test="${p.note==null}">
				无
				</c:if> 
				<c:if test="${p.note==''}">
				无
				</c:if> 
				<c:if test="${p.check_state==2}">
					<font color="red">${p.note}</font>
				</c:if> 
				<c:if test="${p.check_state==1}">
			    ${p.note}
				</c:if></td>
				<td><input type="button" value="审批申请" onclick="location.href='checkPracticeRecord.do?id=${p.id}'"></td>
			</tr>
		</c:forEach>
	</table>
	<div id="myModal" class="reveal-modal" style="width: 590px; " align="center">
		<h2>未提交申请学生</h2>
		<table id="table" class="table" width="580" border="1">
			<tr id="tr" class="tr">
				<td width="50">序号</td>
				<td width="75">姓名</td>
				<td width="100">学号</td>
				<td width="115">班级</td>
				<td width="120">联系方式</td>
			</tr>
		</table>
		<a class="close-reveal-modal">&#215;</a> 
	</div>
</body>
</html>
