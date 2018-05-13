<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>任务列表</title>
<style type="text/css">
	h2 {
		width: 100%;
		height: 20px;
		text-align: left;
	}
</style>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript">
	//设置h2和按钮的value值
	$(function() {
	  var type = $("#type").val();
	  if (type == "shixi") {
	   $("h2").text("实习任务列表");
	    $("#add").attr("value","添加实习任务");
	  }else{
	   $("h2").text("实训任务列表");
	   $("#add").attr("value","添加实训任务");
	  }
	 });
	//根据年级ajax得到实践任务
	function ajaxPracticeTask() {
			$.ajax({
				type : "get",
				url : "ajaxPracticeTask.do?",
				data : getSendData(), //设置发送参数，即使参数为空，也需要设置                
				dataType : "text",                
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
			var department_id = $("#department_id").val();	
			var dataSend = "gradeAndDeptid=" + grade+"-"+department_id;			
			return dataSend;
		}
	function showPractice(ajaxData) {
	     $("table[id='praTable'] tr[id!='biaotou']").remove();
	     $("#biaotou").after(ajaxData); 
		};
		
	//添加
	function add() {
		window.location.href = "addPracticeTask.do";
	}
	//编辑
	 function doEdit(id) {
	   window.location.href = "editPracticeTask.do?id=" + id;
	 }
	//查看小组详情
	 function seeGroup(id) {
	   window.location.href = "seeGroup.do?id=" + id;
	 }
	var a;
	//验证是否有小组
	function checkGroups(id) {
		a=id;//记录id
		$.ajax({
			type : "get",
			url : "checkGroups.do?",
			data : getPraid(id), //设置发送参数，即使参数为空，也需要设置                
			dataType : "json", //返回的类型为text                
			success : function(data) { //成功时执行的方法					
				showInfor(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert(status);
				}
			}
		});
	}
	function getPraid(id) {
		var pra_id = id;
		var dataSend = "pra_id=" + pra_id;
		return dataSend;
	}
	function showInfor(ajaxData) {
	   var obj = eval(ajaxData); 
		if(obj=="1"){
				if (window.confirm("确定删除此任务?")) {
				window.location.href = "deletePracticeTask.do?id=" + a;
			} 
		}else{
			alert("此任务已经有小组,删除任务将影响小组，不能删除此任务！");
			/* if (window.confirm("此任务已经有小组,删除任务将影响小组，确定删除此任务?")) {
				window.location.href = "deletePracticeTask.do?id=" + a;
				} */
		}
	}
</script>
</head>
<body>
	<h2 id="title"></h2>
	<br>
	<p align="left">
		<b>条件查询：</b>
		<c:set var="grade" value="${grade}" scope="request"></c:set>
		<%
			String grade = (String) request.getAttribute("grade");
		%>
		年级<select name="grade" id="grade" id="selector">
			<option value="2012" <%="2012".equals(grade) ? "selected" : ""%>>2012</option>
			<option value="2013" <%="2013".equals(grade) ? "selected" : ""%>>2013</option>
			<option value="2014" <%="2014".equals(grade) ? "selected" : ""%>>2014</option>
			<option value="2015" <%="2015".equals(grade) ? "selected" : ""%>>2015</option>
			<option value="2016" <%="2016".equals(grade) ? "selected" : ""%>>2016</option>
			<option value="2017" <%="2017".equals(grade) ? "selected" : ""%>>2017</option>
			<option value="2018" <%="2018".equals(grade) ? "selected" : ""%>>2018</option>
			<option value="2019" <%="2019".equals(grade) ? "selected" : ""%>>2019</option>
		</select> 
		<c:set var="dept_name" value="${dept_name}" scope="request"></c:set>
		<%
			String dept_name = (String) request.getAttribute("dept_name");
		%>
		系部<select name="department_id" id="department_id">
			<c:forEach var="departmentlist" items="${departmentlist}" varStatus="stauts">
				<option value="${departmentlist.id}"<c:if test="${departmentlist.org_name==dept_name}"> selected</c:if>>${departmentlist.org_name}</option>
			</c:forEach>
		</select> 
		<input type="button" value="查询" id="seacher" onclick="ajaxPracticeTask();" />  
		&nbsp;&nbsp;&nbsp;
		<input type="button" onclick="javascript:add();" value="" id="add" />
	</p>
	<input type="hidden" name="type" id="type" value="${type}">
	<table border="1" width="1200" id="praTable" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<!-- <th width="150">任务编码</th> -->
			<th width="300">任务名称</th>
			<th width="100">创建时间</th>
			<th width="100">开始时间</th>
			<th width="100">结束时间</th>
			<th width="300">任务描述</th>
			<th width="100">任务地点</th>
			<th width="100">操作</th>
			<th width="100">操作</th>
		</tr>
		<c:forEach var="s" items="${practicetaskList}" varStatus="stauts">
			<tr>
				<%-- <td>${s.practice_code}</td> --%>
				<td>${s.task_name}</td>
				
				<td><fmt:parseDate value="${s.create_time}" var="create_time" />
					<fmt:formatDate value="${create_time}" pattern="yyyy/MM/dd" /></td>
					
				<td><fmt:parseDate value="${s.begin_time}" var="begin_time" />
					<fmt:formatDate value="${begin_time}" pattern="yyyy/MM/dd" /></td>
				<td><fmt:parseDate value="${s.end_time}" var="end_time" /> <fmt:formatDate
						value="${end_time}" pattern="yyyy/MM/dd" /></td>
				<td>${s.task_desc}</td>
				<td>${s.task_place}</td>	
				<td><input type="button" value="任务小组详情" onclick="seeGroup('${s.id}');"></td>
				<td><input type="button" value="修改" onclick="doEdit('${s.id}');">&nbsp;&nbsp;<input type="button" value="删除" onclick="checkGroups('${s.id}');"></td>
			</tr>
		</c:forEach>
		</table>
</body>
</html>
