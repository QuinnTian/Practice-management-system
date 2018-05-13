<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
   <script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript">

 function download(){
                var fileid=$("#file_id").val();
                console.log(fileid);
               
                if(fileid==""){
                     alert("此任务还没有文件，如果需要请点击浏览上传文件");
                }else{
                     window.location.href = "downloadFile.do?file_id=" + fileid;      
                } 
           }    



</script>
<script type="text/javascript">
function back(){
history.back(); 
}

</script>
<title>教师记录修改</title>
</head>
<body>
<h2 align="left">教师指导记录</h2>
	<button onclick="download()">下载指导任务</button>
	<form name="form1" method="post" action="doEditdirectrecord.do">
		<input type="hidden" id="id" name="id" value="${directrecord.id}">
		<input type="hidden" id="file_id" name="file_id" value="${directrecord.file_id}">
		<table border="1" width="400">
			<tr>
			<c:set var="p_id" value="${directrecord.practice_id}" scope="request"></c:set>
				<%
					String practice_id = (String) request.getAttribute("p_id");
				%>
			
			
			
			
				<td width="100">实习ID：</td>
				<td width="300"><%
						out.println(DictionaryService.findPracticeTask(practice_id)
									.getTask_name());
					%>
				</td>
			</tr>

			<tr>
				<td width="100">标题：</td>
				<td width="300"><input type="text" name="title"
					value="${directrecord.title}">
				</td>
			</tr>
			<tr>
				<td width="100">指导时间：</td>
				<td width="300">
					${directrecord.direct_time}
				</td>
			</tr>
			
			<tr>
				<td width="100">指导地点：</td>
				<td width="300"><input type="text" name="direct_place"
					value="${directrecord.direct_place}" />
				</td>
			</tr>
				<tr>
			<td width="100">文件描述：</td>
			<td width="300">${directrecord.direct_desc} 	 	
			 </td>
		       </tr>
		</table>

		<div style="margin-top:20px;">
			<button type="button" onclick="back()">返回</button>
		</div>
	</form>
</body>
</html>





















