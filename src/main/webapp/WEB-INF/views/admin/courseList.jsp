<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>组织列表</title>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css"
	media="screen" type="text/css" />
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() { //这个就是传说的ready   
		$(".sjjx-table tr").mouseover(function() {
			console.log("隔行颜色处理");
			//如果鼠标移到class为stripe的表格的tr上时，执行函数   
			$(this).addClass("over");
		}).mouseout(function() {
			//给这行添加class值为over，并且当鼠标一出该行时执行函数   
			$(this).removeClass("over");
		}) //移除该行的class   
		$(".sjjx-table tr:even").addClass("alt");
		//给class为stripe的表格的偶数行添加class值为alt
	});

	//添加
	function add() {
		window.location.href = "addCourses.do";
	}
	//导入课程
	function importCourse() {
		window.location.href = "importCourse.do";
	}
	//修改
	function doEdit(id) {
		window.location.href = "editCourses.do?id=" + id;
	}
	//删除
	function doDel(id) {
		if (window.confirm("确定删除此条吗?")) {
			window.location.href = "deleteCourses.do?id=" + id;
		}
	}
	//ajax的数据
	function getCourseByOrg() {
		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "ajaxCourseByOrg.do?",
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
		function getSendData() {
			var org_id = $("#partId").val();
			var dataSend = "org_id=" + org_id;
			console.log("dataSend:" + dataSend);
			return dataSend;
		}
		function showGroups(ajaxData) {
			console.log(ajaxData);
			$("table[id='courseTab'] tr[id!='biaotou']").remove();
			$("#biaotou").after(ajaxData);
		}
	}
</script>
</head>
<body>
	<h2 align='left'>课程信息</h2>
	<b>条件查询:</b>&nbsp;&nbsp;
	&nbsp;&nbsp;
	<select id="partId" name="partId" style="width:110px">
		<option value="0">请选择范围</option>
		<c:forEach var="o" items="${orgs}" varStatus="stauts">
			<option value="${o.id}">${o.org_name}</option>
		</c:forEach>
	</select>
	<input type="button" value="查询" onclick="getCourseByOrg()">
	&nbsp;&nbsp;
	<input type="button" onclick="javascript:add();" value="添加课程" />
	<input type="button" onclick="javascript:importCourse();" value="导入课程" />
	<table id="courseTab" border="1" width="850" class="sjjx-table"
		cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="150">课程编码</th>
			<th width="150">课程名称</th>
			<th width="150">所属院系</th>
			<th width="150">授课对象</th>
			<th width="150">课时</th>
			<th width="300">描述</th>
			<th width="150">创建时间</th>
			<th width="150">状态</th>
			<th width="50">修改</th>
			<th width="50">操作</th>
		</tr>

		<c:forEach var="c" items="${courseList}" varStatus="stauts">
			<tr>
				<td align="center">${c.course_code}</td>
				<td align="center">
				<a href="editCourses.do?id=${c.id}">${c.course_name}</a></td>
				<c:set var="org_id" value="${c.org_id}" scope="request"></c:set>
				<%
					String org_id = (String) request.getAttribute("org_id");
				%>
				<td align="center">
					<%
						out.println(DictionaryService.findOrg(org_id).getOrg_name());
					%>
				</td>
				<td align="center">${c.class_object}</td>
				<td align="center">${c.class_hour}</td>
				<td align="center">${c.description}</td>
				<td align="center"><fmt:parseDate value="${c.create_time}"
						var="create_time" /> <fmt:formatDate value="${create_time}"
						pattern="yyyy/MM/dd" /></td>
				<%--  <td align="center">${c.state}</td>  --%>
				<td align="center"><c:set var="state" value="${c.state}"
						scope="request"></c:set>
				<%
				 	String state = (String) request.getAttribute("state");
				 		String stateName = "有效";
				 		if (state.equals("2"))
				 			stateName = "无效";
				 %> <%=stateName%>
				<td align="center"><input type="button" value="修改"
					onclick="doEdit('${c.id}')"></td>
				<td align="center"><input type="button" value="删除"
					onclick="doDel('${c.id}')"></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>
