<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<title>智能推送 的通知列表(查看该招聘信息发了几个通知)</title>
<style type="text/css">
	h2{
	    width:100%; 
	    height:20px;
	    text-align:left;
	}
</style>
</head>
<body>
<h3>推送列表</h3>
	<table border="1" width="1300"  id="notTable" class="sjjx-table" cellspacing="0" cellpadding="0">
	<tr  id="biaotou">
			<th width="180">标题</th>
			<!-- <th width="180">类型</th> -->
			<th width="300">内容</th>
			<!-- <th width="70">发布者</th> -->
			<th width="150">通知范围</th>
	</tr>
		<c:forEach var="n" items="${noticeList}" varStatus="stauts">
		<input type="hidden" id="id" name="id" value="${n.id}">
				<tr>
				<td align="center"><a href="detailNotice.do?id=${n.id}">${n.title}</a></td>
				<!-- <td align="center">
				指导教师通知
				</td> -->
				<td align="center" class="content">${n.content}</td>
				<%-- <td align="center">
				<c:set var="bl" value="${n.tea_id}" scope="request"></c:set>
				<% String tea_id=(String)request.getAttribute("bl"); %>
				<% out.println(DictionaryService.findTeacher(tea_id).getTrue_name()); %> 
				</td> --%>
				<td align="center" class="name">
				<c:set var="sts" value="${n.stu_id}" scope="request"></c:set>
				<% 
				   String stuIds=(String)request.getAttribute("sts"); 
				   String[] stu_ids = stuIds.split(",");
				   int showCount=5;
				   if(stu_ids.length<=5){
				   	showCount=stu_ids.length;
				   for(int i=0;i<showCount;i++){
				   	if(DictionaryService.findStudent(stu_ids[i]) !=null){
				   	out.print(DictionaryService.findStudent(stu_ids[i]).getTrue_name()+" ");
				   	}
				   }
				   }else{
				   String students="";
				    for(int i=0;i<showCount;i++){
				    	if(DictionaryService.findStudent(stu_ids[i])==null){
							out.print(" ");
						}else{
							students=students+DictionaryService.findStudent(stu_ids[i]).getTrue_name()+" ";
						 }
				   		
				   	}
				   	out.print(students+".....");
				   }
	             %>
				</td>
				</tr>
			</c:forEach>
	</table>
	<br>
   <button type="button" onClick="window.location='recruitInfoList.do'">返回招聘信息列表</button>
	</body>
</html>
