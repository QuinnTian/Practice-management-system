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
     <title>修改通知公告</title>
    <script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
    <script type="text/javascript">
     	function doEdit(){
     		var content=$("#content").val();
		 	if(content.length>100){
		 		alert("内容不能超过100个字");
		 		return null;
		 	}else if(content==""){
		 		alert("内容不能为空");
		 		return null;
		 	}else if($("#title").val()==""){
		 		alert("标题不能为空");
		 		return null;
		 	}else{
		 		document.form1.submit();
		 	
		 	}
		 }
	 //返回到上一个界面
	 function doBack() {
	  window.history.go(-1);
	 }
    </script>
</head>
  
  <body>
  <h2>修改通知公告</h2>
  <form name="form1" id="form1" method="post" action="doEditInstruction.do">
  <input type="hidden" name="id" name="id" value="${notice.id}">
   <table border="1" width="630">
   <tr>
   <th width="130">发布时间：</th>
   <td width="500"><input type="text" value="${notice.create_time}" disabled="disabled" style="width:100%;height:100%;"/></td>
   </tr>
     <tr>
   <th width="130">发布人</th>
   <td width="500">
   <c:set var="tea_id" value="${notice.tea_id}" scope="request"></c:set>
	<% String tea_id=(String)request.getAttribute("tea_id"); %>
   <input type="text" value="<%=DictionaryService.findTeacher(tea_id).getTrue_name()%>" disabled="disabled" style="width:100%;height:100%;"/></td>
   </tr>
    <tr>
   <th width="130">类型：</th>
   <td width="500">
   <input type="text" value="就业指导" disabled="disabled" style="width:100%;height:100%;"/>
   </td>
   </tr>
       <tr>
   <th width="130">标题：</th>
   <td width="500"><input type="text" name="title" id="title" value="${notice.title}" style="width:100%;height:100%;"/></td>
   </tr>
   <tr>
   <th width="130">内容：</th>
   <td width="500"><textarea name="content" id="content" rows="5"  style="width:100%;height:100%;">${notice.content}</textarea></td>
   </tr>
  
     <tr>
   <th width="130">通知范围：</th>
   <td width="500">
   		<textarea name="soid" rows="5" style="width:100%;height:100%;" disabled="disabled"><c:set var="sts" value="${notice.stu_id}" scope="request"></c:set><c:set var="orgs" value="${notice.org_id}" scope="request"></c:set>
<% String[] stu_ids=null;String stuIds=(String)request.getAttribute("sts");String orgs=(String)request.getAttribute("orgs");
if(stuIds.length()==0){if(DictionaryService.findOrg(orgs)==null){out.print(DictionaryService.findOrg(orgs).getOrg_name());}else{out.print("");} }else{stu_ids = stuIds.split(",");
for(int i=0;i<stu_ids.length;i++){if(DictionaryService.findStudent(stu_ids[i]) !=null){out.print(DictionaryService.findStudent(stu_ids[i]).getTrue_name()+" ");}else{out.print(" ");}}}%>
		</textarea>
	</td>
   </tr>
   </table>
   		<div >

   		</div>
   <br><input type="button" onClick="doEdit()" value="修改指导"/>&nbsp;&nbsp;
   <button type="button" onClick="doBack();">返回</button>
  </form>
  </body> 
</html>
