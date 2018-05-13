<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen"
		type="text/css" />
		<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<title>分组管理</title>
<script type="text/javascript">
	//添加
	function add() {
		window.location.href = "addGroups.do";
	}

	//删除，id为小组的id
	function doDel(id) {
		if (window.confirm("确定删除此小组吗?")) {
			window.location.href = "deleteGroups.do?id=" + id;
		}
	}

	//修改小组成员，id为小组的id
	function updateGroupMembers(id) {
		window.location.href = "updateGroupMembers.do?id=" + id;
	}
	//导入小组成员
	function importStudentsId(id) {
		window.location.href = "importStudentIds.do?id=" + id;
	}
</script>
<script type="text/javascript">
	function doSerch() {
		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "ajaxSerchGroups.do?",
			data : getSendData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法
				console.log("ajax返回成功");
				showGroups(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {

				}
			}
		});
	}
	//用来返回前一个页面的数据
	function doSerch2() {
		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "ajaxSerchGroups.do?",
			data : getSendData2(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法
				console.log("ajax返回成功");
				showGroups(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {

				}
			}
		});
	}

	function getSendData() {
		var org_id = $("#org_id").val();
		var grade = $("#grade").val();
		var dataSend = "org_id=" + org_id + "&grade=" + grade;
		console.log("dataSend:" + dataSend);
		return dataSend;
	}
	function getSendData2() {
		var org_id1 = $("#org_id1").val();
		var grade1 = $("#grade1").val();
		var dataSend = "org_id=" + org_id1 + "&grade=" + grade1;
		console.log("dataSend:" + dataSend);
		return dataSend;
	}
	function showGroups(ajaxData) {
		console.log(ajaxData);
		$("table[id='stuTab'] tr[id!='biaotou']").remove();
		$("#biaotou").after(ajaxData);
	}

	window.onload = function() {
		var org_id1 = $("#org_id1").val();
		var grade1 = $("#grade1").val();
		if(org_id1!=null&&grade1!=null){
		$("#hiddenBtn").click();
		}
	}
</script>

</head>
<body>
	<button id="hiddenBtn" style="background-color:#666666; display:none;" onclick="doSerch2()">Hidden
		Button</button>
	<input id="org_id1" value="${org_id1}"style="background-color:#666666; display:none;">
	<input id="grade1" value="${grade1}" style="background-color:#666666; display:none;">
	<h1>分组管理</h1>
	条件查询: 入学年份:
	<select id="grade">
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
		<option value="2016">2016</option>
		<option value="2017">2017</option>
		<option value="2018">2018</option>
		<option value="2019">2019</option>
		<option value="2020">2020</option>
		<option value="2021">2021</option>
		<option value="2022">2022</option>
		<option value="2023">2023</option>
		<option value="2024">2024</option>
		<option value="2025">2025</option>
	</select>
		<button onclick="doSerch();">查询</button>
		&nbsp;&nbsp;
		<input type="button" onclick="javascript:add();" value="添加分组" />
	<table border="1" width="1330" id="stuTab" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="330">分组名称</th>
			<th width="350">分组描述</th>
			<th width="400">所属任务</th>
			<th width="400">分组目的</th>
			<th width="200">创建时间</th>
			<th width="75">创建人</th>
			<th width="55">操作</th>
			<th width="55">操作</th>
			<th width="55">操作</th>
		</tr>
		<c:forEach var="g" items="${result}" varStatus="stauts">
			<tr>
				<td><a href="editGroups.do?id=${g.id}">${g.group_name}</a>
				</td>
				<td>${g.description}</td>
				<td><c:set var="practice_id" value="${g.practice_id}"
						scope="request"></c:set> 
			<%
 				String practice_id = (String) request.getAttribute("practice_id");
 				
 				if (DictionaryService.findPracticeTask(practice_id) != null)
 					out.println(DictionaryService.findPracticeTask(practice_id).getTask_name());
 				else{
 					out.println("无");
 			}
		   
		    %>
				</td>
				<td>${g.purpose}</td>
				<td><fmt:parseDate value="${g.create_time}" var="create_time" />
					<fmt:formatDate value="${create_time}" pattern="yyyy/MM/dd" /></td>
				<td><c:set var="tea_id" value="${g.tea_id}" scope="request"></c:set>
					<%
						String tea_id = (String) request.getAttribute("tea_id");
							if (DictionaryService.findTeacher(tea_id) != null)
								out.println(DictionaryService.findTeacher(tea_id)
										.getTrue_name());
							else
								out.println("无");
					%>
				</td>
				<td><input type="button" value="修改"
					onclick="updateGroupMembers('${g.id}');"></td>
				<td><input type="button" value="删除" onclick="doDel('${g.id}');">
				</td>
				<td><input type="button" value="导入成员" onclick="importStuIds('${g.id}');">
				</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>
