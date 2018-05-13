<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>通知列表</title>  
<style type="text/css">
    h2 {
	   width: 100%;
	   height: 20px;
	   text-align: left;
        }
</style>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<!-- <script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script> -->
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript">
	// 下载
	function download(file_id) {
		if(file_id == ""){
		alert("该通知没有资料下载！");}
		else{
			window.location.href = "downloadFile.do?file_id="+file_id;
		}
		}
</script>
</head>
<body>
<h2>通知列表</h2>
<br>
	<input type="hidden" name="check_state" id="check_state" value="${check_state}">
	<table border="1" width="990"  style="overflow-x:hidden;overflow-y:hidden;" id="notTable" class="sjjx-table" cellspacing="0" cellpadding="0">
	<tr id="biaotou">
			<th width="180">标题</th>
		    <th width="180">类型</th> 
			<th width="180" >内容</th>
			<th width="70">发布者</th>
			<th width="100">发布时间</th>
			<!-- <th width="150">通知范围</th> -->
			<th width="100">操作</th>
		</tr>
		<c:forEach var="n" items="${myNoticeList}" varStatus="stauts">
		<input type="hidden" id="id" name="id" value="${n.id}">
				<tr>
				<td align="center"><a href="detailNotice.do?id=${n.id}">${n.title}</a></td>
				<td align="center">
				<c:if test="${n.notice_type=='1'}">
				院级通知
				</c:if>
				<c:if test="${n.notice_type=='2'}">
				指导教师通知
				</c:if>
				<c:if test="${n.notice_type=='3'}">
				信息核对通知
				</c:if>
				<c:if test="${n.notice_type=='4'}">
				已阅卷通知
				</c:if>
				<c:if test="${n.notice_type=='5'}">
				招聘信息通知
				</c:if>
				<c:if test="${n.notice_type=='6'}">
				就业指导通知
				</c:if>
				<c:if test="${n.notice_type=='8'}">
				审阅审批通知
				</c:if>
				</td>
				<td align="center" class="content">${n.content}</td>
				<td align="center">
				<c:set var="bl" value="${n.tea_id}" scope="request"></c:set>
				<% String tea_id=(String)request.getAttribute("bl"); %>
				<% out.println(DictionaryService.findTeacher(tea_id).getTrue_name()); %> 
				</td>
				<td align="center">
				<fmt:parseDate value="${n.create_time}" var="create_time" />
					<fmt:formatDate value="${create_time}" pattern="yyyy/MM/dd" />
				</td>
				<td align="center">
				<input type="button" value="下载附件" onclick="download('${n.temp2}');">
				</td>
			</c:forEach>
	</table>
	
</body>
</html>
