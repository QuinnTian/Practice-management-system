<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>信息核对任务列表</title>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript">
	//添加
	function add() {
		window.location.href = "addCheckInfo.do";
	}
	//删除
	function doDel(id) {
		if (window.confirm("确定删除此任务?")) {
			window.location.href = "deleteCheckInfo.do?id=" + id;
		}
	}
	//编辑
	function doEdit(id) {
			window.location.href = "editCheckInfo.do?id=" + id;
	}
	//查看
	function doSee(id) {
			window.location.href = "checkInfoStudent.do?id=" + id;
	}	
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
    //根据年级和实习任务得到信息核对任务
    function check(){
    	var grade = $("#grade").val();
		var praticeTaskId = $("#praticeTaskId").val();
		if(grade=="请选择"){
			alert("请选择入学年份！");
		}else if(praticeTaskId=="请选择实习任务"){
			alert("请选择实习任务！");
		}else{
			ajaxgetCheckInfo();
		}
    }
    
	function ajaxgetCheckInfo() {
		$.ajax({
			type : "get",
			url : "ajaxgetCheckInfo.do?",
			data : getSendData(),          
			dataType : "text",              
			success : function(data) {				
				showPractice(data);
			},
			error : function(result, status) {                 
				if (status == 'error') {
					alert(status);
				}
			}
		});
	}
	function getSendData() {
		var grade = $("#grade").val();
		var praticeTaskId = $("#praticeTaskId").val();
		var dataSend = "grade=" +grade+"&&"+"praticeTaskId="+praticeTaskId;
		return dataSend;
	}
	function showPractice(ajaxData) {
		$("table[id='praTable'] tr[id!='biaotou']").remove();
		$("#biaotou").after(ajaxData);
	};
</script>
</head>
<body>
	<h2>信息核对任务列表</h2>
	<br>
	<p>
		<b>条件查询：</b>
		<c:set var="grade" value="${checkinfo_Grade}" scope="request"></c:set>
		<%
			String grade = (String) request.getAttribute("grade");
		%>
		入学年份 <select name="grade" id="grade" id="selector" onChange="changeGrade()">
			<option value="入学年份" <%="入学年份".equals(grade) ? "selected" : ""%>>入学年份</option>
			<option value="2012" <%="2012".equals(grade) ? "selected" : ""%>>2012</option>
			<option value="2013" <%="2013".equals(grade) ? "selected" : ""%>>2013</option>
			<option value="2014" <%="2014".equals(grade) ? "selected" : ""%>>2014</option>
			<option value="2015" <%="2015".equals(grade) ? "selected" : ""%>>2015</option>
		</select> &nbsp;&nbsp;
		<c:set var="defaultTaskName" value="${checkinfo_pullTaskName}" scope="request"></c:set>
		<%
			String defaultTaskName = (String) request.getAttribute("defaultTaskName");
		%>
		实习任务<select name="praticeTaskId" id="praticeTaskId" style="width:260px">
			<option value="请选择实习任务" <%="请选择实习任务".equals(defaultTaskName) ? "selected" : ""%> selected="selected">请选择实习任务</option>
			<c:forEach var="taskList" items="${checkinfo_pulltaskList}" varStatus="stauts">
				<option value="${taskList.id}"
					<c:if test="${taskList.task_name==defaultTaskName}"> selected</c:if>>
					${taskList.task_name}</option>
			</c:forEach>
		</select> 
		<input type="button" value="查询" id="seacher" onclick="check();" /> 
		&nbsp;&nbsp; 
     	<input type="button" onclick="javascript:add();" value="新增信息核对任务" id="add" />
		
	</p>
	<table border="1" width="1300" id="praTable" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<!-- <th width="50">任务编码</th> -->
			<th width="50">序号</th>
			<th width="150">任务名称</th>
			<th width="100">创建时间</th>
			<th width="100">开始时间</th>
			<th width="100">结束时间</th>
			<th width="200">任务描述</th><!-- 
			<th width="100">所属任务名称</th> -->
			<th width="50">操作</th>
			<th width="50">操作</th>
			<th width="50">操作</th>
		</tr>
		<!-- 定义一个序号变量 -->
		 <% int i=1; %>
		<c:forEach var="checkTask" items="${checkInfo_taskList}" varStatus="stauts">
			<tr>
				<%-- <td>${checkTask.practice_code}</td>  --%>
				
				<!-- 序号自动增加1 -->
				<td><%=i++ %></td>
				
				 
				<td>${checkTask.task_name}</td>
				
				
				<!-- 添加一个创建时间的列 -->
				<td><fmt:parseDate value="${checkTask.create_time}" var="create_time" />
					<fmt:formatDate value="${create_time}" pattern="yyyy/MM/dd" />
				</td>
				
				
				<td><fmt:parseDate value="${checkTask.begin_time}" var="begin_time" /> 
					<fmt:formatDate value="${begin_time}" pattern="yyyy/MM/dd" /></td>
				<td><fmt:parseDate value="${checkTask.end_time}" var="end_time" />
					<fmt:formatDate value="${end_time}" pattern="yyyy/MM/dd" />
				</td>
				<td>${checkTask.task_desc}</td>
				<%-- <td><c:set var="sc" value="${checkTask.parent_id}" scope="request"></c:set> 
					<%
					 	String parent_id = (String) request.getAttribute("sc");
					 	out.println(DictionaryService.findPracticeTask(parent_id).getTask_name());
				 	%>
				</td> --%>
				<td><input type="button" value="查看核对情况"onclick="doSee('${checkTask.id}');"></td>
				<td><input type="button" value="修改"onclick="doEdit('${checkTask.id}');"></td>
				<td><input type="button" value="删除"onclick="doDel('${checkTask.id}');"></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>
