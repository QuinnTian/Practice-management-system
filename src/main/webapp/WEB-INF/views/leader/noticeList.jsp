<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>通知管理</title>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<!-- <script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script> -->
	<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript">
	    //添加
		function add(){
		  window.location.href="addNotice.do";
		}
		//查看详细通知公告
		function doCheck(id){
		 
           window.location.href="checkNotice.do?id="+id;
		
		}
		function download(file_id) {
		if(file_id == ""){
		alert("该通知没有资料下载！");}
		else{
			window.location.href = "downloadFile.do?file_id="+file_id;
		}
		}
		//修改通知公告
		function doEdit(id){
		 
           window.location.href="editNotice.do?id="+id;
		
		}
		//删除通知公告
		function doDelete(id){
		 if(window.confirm("确定删除此条吗?")){
           window.location.href="deleteNotice.do?id="+id;
		}
		}
		$(function(){
    //限制内容字符个数
    $('.content').each(function(){
        var maxwidth=10;
        if($(this).text().length>maxwidth){
        $(this).text($(this).text().substring(0,maxwidth));
            $(this).html($(this).html()+'.....');
        }
    });
});
	</script>
</head>
<body>
<h2>通知列表 
&nbsp;&nbsp;&nbsp;<input type="button" onclick="javascript:add();" value="发布通知"/> </h2>
	<table border="1" width="1040" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr>
			<th width="80">时间</th>
			<th width="80">类型</th>
			<th width="140">标题</th>
			<th width="400">内容</th>
			<th width="200">通知范围</th>
			<th width="140">操作</th>
		
		</tr>
		<c:forEach var="n" items="${result}" varStatus="stauts">
			<tr>
				<td  align="center">
				<fmt:parseDate value="${n.create_time}" var="create_time" />
				<fmt:formatDate value="${create_time}" pattern="yyyy/MM/dd" />
				</td>
				<td  align="center">
				院级通知
				</td>
				<td  align="center"><a href="checkNotice.do?id=${n.id}">${n.title}</a></td>
				<td  align="center" class="content">${n.content}</td>
				<td  align="center">
				<c:set var="org_id" value="${n.org_id}" scope="request"></c:set>
				<% String org_id=(String)request.getAttribute("org_id"); %>
				<%
				if(org_id==null){
				 out.print("范围");
				}else{
				out.print(DictionaryService.findOrg(org_id).getOrg_name());
				}
				
				 %>
				</td>
				<td align="center">
				<input type="button" value="下载" onclick="download('${n.temp2}');">
				<input type="button" value="修改" onclick="doEdit('${n.id}');">
				<input type="button" value="删除" onClick="doDelete('${n.id}');">
				</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>
