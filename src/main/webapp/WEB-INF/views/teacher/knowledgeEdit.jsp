<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page import="com.sict.service.DictionaryService" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>常见问题修改</title>
<style>
	h2{
		text-align:left;
	}
</style>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
	<script type="text/javascript">
	
		//修改
		function doEdit(){
		var tea_id=$("#tea_id").val();
		var messenger_id=$("#messenger_id").val();
		if($("#scope").val()=="请选择")
		{
			alert("请选择适应范围！");
			return null;
		}
		if(tea_id!=messenger_id)
			{
				alert("只能修改本人发布的常见问题！");
				return null;//document.form1.action = "editKnowledge.do";
				
			}
			else
			{
				document.form1.action = "doEditKnowledge.do";
				document.form1.submit();
			}
		}
	</script>
</head>
<body>
<h2>常见问题修改</h2>
	<form name="form1" method="post" action="">
		<input type="hidden" id="id" name="id" value="${knowledge.id}">
		<input type="hidden" id=tea_id name="tea_id" value="${tea.id}">
		<input type="hidden" id="messenger_id" name="messenger_id" value="${knowledge.messenger_id}">
		<table border="1" width="450">
			<tr>
				<th width="100">问题：</th>
				<td width="350"><input type="text" name="question"
					value="${knowledge.question}" style="width:100%;">
				</td>
			</tr>
			<tr>
				<th width="100">答案：</th>
				<td width="350"><textarea name="answer" rows="8" cols="30" style="width:100%;">${knowledge.answer}</textarea>
				</td>
			</tr>
			
			<tr>
				<th width="100">适用范围：</th>
				<td width="350">
					<select id="scope" name="scope" style="width:130px">
					<c:forEach var="o" items="${orgs}" varStatus="stauts">
					<option value="${o.id}">${o.org_name}</option>
					</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th width="100">发布时间：</th>
				<td width="350"><input type="text" name="time"
					value=<fmt:parseDate value="${knowledge.create_time}" var="create_time" />
					<fmt:formatDate value="${create_time}" pattern="yyyy/MM/dd"/> disabled='disabled'>
				</td>
			</tr>
			<tr>
				<th width="100">发布人：</th>
				<td width="350">
				<c:set var="messenger_id" value="${knowledge.messenger_id}" scope="request"></c:set>
			<%
				String messenger_id = (String) request.getAttribute("messenger_id");
			%>
				<input type="text" name="question" disabled="disabled"
					value="<%=DictionaryService.findTeacher(messenger_id).getTrue_name() %>">
				</td>
			</tr>
		</table>

		<div style="margin-top:20px;">
			<input type="button" onclick="doEdit();" value="保存" />
			<button type="button" onclick="window.location='./knowledgeList.do'">返回</button>
		</div>
	</form>
</body>
</html>


