<%@ page language="java" import="java.util.*" pageEncoding="utf-8" errorPage="errorPage.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <title>就业指导详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
	 //返回
	 function doBack() {
	  window.history.go(-1);
	 }
	</script>
</head>
  
  <body>
  <h2>就业指导详情</h2>
   <table border="1" width="600">
   <tr>
   <td width="100">标题：</td>
   <td width="500"><input type="text" value="${notice.title}" disabled="disabled" style="width:99%"/></td>
   </tr>
     <tr>
   <td width="100">类型：</td>
   <td width="500">
  <input type="text" value="就业指导" disabled="disabled" style="width:100%;"/></td>
   </tr>
     <tr>
   <td width="100">内容：</td>
   <td width="500"><textarea name="description" rows="5" disabled="disabled" style="width:99%">${notice.content}</textarea></td>
   </tr>
     <tr>
   <td width="100">通知范围：</td>
   <td width="500">
   		<textarea name="soid" rows="5" disabled="disabled" style="width:99%"><c:set var="sts" value="${notice.stu_id}" scope="request"></c:set><c:set var="orgs" value="${notice.org_id}" scope="request"></c:set>
<% String stuIds=(String)request.getAttribute("sts");String orgs=(String)request.getAttribute("orgs");
if(stuIds.length()==0){if(DictionaryService.findOrg(orgs) !=null){out.print(DictionaryService.findOrg(orgs).getOrg_name());}else{out.print("");} }else{String[] stu_ids = stuIds.split(",");
for(int i=0;i<stu_ids.length;i++){if(DictionaryService.findStudent(stu_ids[i]) !=null){out.print(DictionaryService.findStudent(stu_ids[i]).getTrue_name()+" ");}else{out.print(" ");}}}%>
		</textarea>
	</td>
   </tr>
     <tr>
   <td width="100">发布时间：</td>
   <td width="500"><input type="text" value="${notice.create_time}" disabled="disabled" style="width:99%"/></td>
   </tr>
     <tr>
   <td width="100">发布人</td>
   <td width="500">
   <c:set var="tea_id" value="${notice.tea_id}" scope="request"></c:set>
	<% String tea_id=(String)request.getAttribute("tea_id"); %>
   <input type="text" value="<%=DictionaryService.findTeacher(tea_id).getTrue_name()%>" disabled="disabled" style="width:99%"/></td>
   </tr>
   </table><br>
   <button type="button" onclick="doBack();">返回</button>
  </body> 
</html>
