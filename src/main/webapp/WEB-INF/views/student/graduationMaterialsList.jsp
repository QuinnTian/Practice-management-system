<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	errorPage="errorPage.jsp"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>就业材料</title>
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<!-- <script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script> -->
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript">
	$(function() {
		var pra_id = $("#pra_id").val();
		if (pra_id == "") {
			$("#show").hide();
		} else {
			$("#show").show();
		}
	});
	//删除
	function doDel(id, check_state) {
		if (check_state == "0") {
			if (window.confirm("确定删除吗?")) {
				window.location.href = "deleteGraduationMaterials.do?id=" + id;
			}
		} else {
			alert("您的此就业材料已经审核，不能删除！");
		}
	}
	//添加
	function add() {
		window.location.href = "addGraduationMaterials.do";
	}
	//编辑
	function doEdit(id, check_state) {
		if (check_state == "0") {
			window.location.href = "editGraduationMaterials.do?id=" + id;
		} else {
			alert("您的此就业材料已经审核，不能做修改操作！");
		}
	}
</script>
</head>
<body>
	<h2>就业材料列表</h2>
	<table border="1" width="1300" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr>
			<th width="90">实习任务</th>
			<th width="100">材料名称</th>
			<th width="100">材料类型</th>
			<th width="100">上传时间</th>
			<th width="100">审核时间</th>
			<th width="100">审核状态</th>
			<th width="100">审批备注</th>
			<th width="50">操作</th>
			<th width="50">操作</th>
		</tr>
		<c:forEach var="s" items="${gm}" varStatus="stauts">
			<input type="hidden" name="pra_id" id="pra_id" value="${s.practice_id}">
			<tr id="show">
				<td><c:set var="pn" value="${s.practice_id}" scope="request"></c:set> <%
 	String practice_id = (String) request.getAttribute("pn");
 %> <%
 	out.println(DictionaryService.findPracticeTask(practice_id)
 				.getTask_name());
 %></td>
				<td>${s.materials_name}</td>
				<td>${s.materials_type}</td>
				<td><fmt:parseDate value="${s.create_time}" var="create_time" /> <fmt:formatDate
						value="${create_time}" pattern="yyyy/MM/dd" /></td>
				<td><c:if test="${s.check_time==null}">
				还未审阅
				</c:if> <c:if test="${s.check_time!=null}">
						<fmt:parseDate value="${s.check_time}" var="check_time" />
						<fmt:formatDate value="${check_time}" pattern="yyyy/MM/dd" />
					</c:if></td>
				<td><c:if test="${s.check_state=='0'}">
				未审核
				</c:if> <c:if test="${s.check_state=='1'}">
				已通过
				</c:if> <c:if test="${s.check_state=='2'}">
				未通过
				</c:if></td>
				<td><c:if test="${s.note==''}">
				无
				</c:if> <c:if test="${s.note!=''}">
				${s.note}
				</c:if></td>
				<td><input type="button" value="修改" onclick="doEdit('${s.id}','${s.check_state}');"></td>
				<td><input type="button" value="删除" onclick="doDel('${s.id}','${s.check_state}');"></td>
			</tr>
		</c:forEach>
	</table>
	<div style="margin-top:10px;margin-left:100px;">
		<input type="button" onclick="javascript:add();" value="上传就业材料" />
	</div>
</body>
</html>