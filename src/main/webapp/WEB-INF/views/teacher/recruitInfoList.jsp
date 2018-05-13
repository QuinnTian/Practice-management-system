<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<title></title>
<style type="text/css">
	h2{
	    width:100%; 
	    height:20px;
	    text-align:left;
	}
</style>
	<script type="text/javascript">
	function send(id){
	window.location.href="sendToStudents.do?id="+id;
	}
	function see(id){
	window.location.href="sendDetails.do?recruitInfo_id="+id;
	}
	</script>
</head>
<body>
<h2>招聘信息列表</h2><br>
	<table border="1" width="1300"  class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr>
			<th width="120">企业名称</th>
			<th width="60">生效时间</th>
			<th width="60">失效时间</th>
			<th width="120">岗位名称</th>
			<th width="80">招聘专业</th>
			<th width="200">招聘描述</th>
			<th width="80">招聘人数</th>
			<th width="50">操作</th>
			<th width="50">操作</th> 
		</tr>
		<c:forEach var="r" items="${result}" varStatus="stauts">
			<tr>
				<td align="center">
				<c:set var="com_id" value="${r.com_id}" scope="request"></c:set>
				<%String com_id=(String)request.getAttribute("com_id"); 
				 out.print(DictionaryService.findCompany(com_id).getCom_name());%>
				</td>
				<td align="center">
				<fmt:parseDate value="${r.effect_time}" var="effect_time" />
					<fmt:formatDate value="${effect_time}" pattern="yyyy/MM/dd" />
				</td>
				<td align="center">
				<fmt:parseDate value="${r.end_time}" var="end_time" />
				<fmt:formatDate value="${end_time}" pattern="yyyy/MM/dd" />
				</td>
				<td align="center">
				${r.post_id}
				</td>
				<td align="center">
				${r.recruit_prof}
				</td>
				<td align="center">
				${r.recruit_desc}
				</td>	
				<td align="center">
				${r.recruit_num}
				</td>
				<td align="center">
				<input type="button" value="推送信息" onClick="send('${r.id}');">
				</td>
				<td align="center">
				<input type="button" value="查看推送详情" onClick="see('${r.id}');">
				</td> 
				</tr>
		</c:forEach>
	</table>
</body>
</html>
