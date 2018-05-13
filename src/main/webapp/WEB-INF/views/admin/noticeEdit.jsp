<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/fileUploadCheck.js"></script>
<title>通知修改</title>
	<script type="text/javascript">
		function doEdit(){
		var obj_file = document.getElementById("fileuploade");
			if (obj_file.value != "") {
			var filesize = 0;
			if (browserCfg.firefox || browserCfg.chrome || browserCfg.opera
					|| browserCfg.qq) {
				filesize = obj_file.files[0].size; //单位为字节
				filesizemb = filesize / 1024; //转换为kb
			} else if (browserCfg.ie) {
				var obj_img = document.getElementById('tempimg');
				obj_img.dynsrc = obj_file.value;
				filesize = obj_img.fileSize;
			} else {
				alert(tipMsg);
				return;
			}
			if (filesize == -1) {
				alert(tipMsg);
				return;
			} else if (filesize > maxsize) {
				alert(errMsg);
				return;
			}
		}
			var content=$("#content").val();
			if(content.length>200){
		 		alert("内容不能超过200个字");
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
	</script>
</head>
<body>
<h2>通知修改</h2>
	<form method="post" name="form1" id="form1" action="doEditNotice.do" enctype="multipart/form-data">
   <c:set var="oi" value="${n.tea_id}" scope="request"></c:set>
   <% String tea_id=(String)request.getAttribute("ti"); %>
	<input type="hidden" name="id" name="id" value="${notice.id}">
	<img id="tempimg" dynsrc="" src="" style="display:none" /> 
		上传附件：&nbsp;&nbsp;&nbsp;<input type="file" name="file" id="fileuploade" size="30" title="文件大小不能超过10M" onchange="fileChange(this);"/> 
	<table border="1" width="600">
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
			<td width="100">发布者：</td>
			<td width="500">
			<c:set var="tea_id" value="${notice.tea_id}" scope="request"></c:set>
			<% String tid=(String)request.getAttribute("tea_id"); %>
   			<input type="text" value="<%=DictionaryService.findTeacher(tid).getTrue_name()%>" disabled="disabled" style="width:99%"/>
   			</td>
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
			<td width="500">院级通知</td>
		</tr>
		<tr>
			<td width="100">标题</td>
			<td width="500"><input type="text" name="title" id="title"
				 style="width:99%" value="${notice.title}"></td>
		</tr>
		<tr>
			<td width="100">内容</td>
			<td width="500">
			
			<textarea rows="5" cols="19" name="content" id="content" style="width:99%">${notice.content}</textarea>
			</td>
		</tr>



	</table>

	<div style="margin-top:20px;">
		<button type="button" onclick="doEdit()">保存</button>
		<button type="button" onclick="window.location='./noticeList.do'">返回</button>
	</div>
	</form>
</body>
</html>









































