<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>通知详情</title>
</head>
<body>
<h2>通知详情</h2>
   <c:set var="oi" value="${n.tea_id}" scope="request"></c:set>
   <% String tea_id=(String)request.getAttribute("ti"); %>
	<input type="hidden" name="id" name="id" value="${notice.id}">
	<table border="1" width="600" class="sjjx-table" cellspacing="0" cellpadding="0">
	<tr>
			<td width="100">发布时间</td>
			<td width="500" ><input type="text" name="create_time"
				disabled="disabled" style="width:99%" value="${notice.create_time}"></td>
		</tr>
		<tr>
			<td width="100">通知编码：</td>
			<td width="500"><input type="text" name="notice_code"
				disabled="disabled" style="width:99%" value="${notice.notice_code}"></td>

		</tr>
		<tr>
			<td width="100">通知范围：</td>
			<td width="500">
			<c:set var="org_id" value="${notice.org_id}" scope="request"></c:set>
			<input type="text" name="notice_code" disabled="disabled" style="width:99%"
			 value="<% String org_id=(String)request.getAttribute("org_id"); 
				out.print(DictionaryService.findOrg(org_id).getOrg_name());
				%>"></td>
		</tr>
		<tr>
			<td width="100">类型</td>
			<td width="500"> 院级通知</td>
		</tr>
		<tr>
			<td width="100">标题</td>
			<td width="500"><input type="text" name="title"
				disabled="disabled" style="width:99%" value="${notice.title}"></td>
		</tr>
		<tr>
			<td width="100">发布者：</td>
			<td width="500">
			<c:set var="tea_id" value="${notice.tea_id}" scope="request"></c:set>
			<% String tid=(String)request.getAttribute("tea_id"); %>
   			<input type="text" value="<%=DictionaryService.findTeacher(tid).getTrue_name()%>" disabled="disabled" style="width:99%"/>
   			</td>
		</tr>
		<tr>
			<td width="100">内容</td>
			<td width="500"><textarea rows="5" cols="19" name="content" disabled="disabled" style="width:99%">${notice.content}</textarea>
			</td>
		</tr>



	</table>

	<div style="margin-top:20px;">
		<button type="button" onclick="window.location='./noticeList.do'">返回</button>
	</div>
</body>
</html>









































