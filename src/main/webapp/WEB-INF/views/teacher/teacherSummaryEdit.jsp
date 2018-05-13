<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/checkTextArea.js"></script>
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
<title>教师工作总结修改</title>
</head>
<body>
<h2 align="left">教师工作总结修改</h2>
	<button onclick="download()">下载工作总结</button>
	<form name="form1" method="post" action="doEditTeacehrSummary.do">
		<input type="hidden" id="id" name="id" value="${directrecord.id}">
		<input type="hidden" id="file_id" name="file_id" value="${directrecord.file_id}">
		<table border="0" width="1000">
			<tr>
			<c:set var="p_id" value="${directrecord.practice_id}" scope="request"></c:set>
				<%
					String practice_id = (String) request.getAttribute("p_id");
				%>
			<td width="100">实习名称 ：</td>
				<td width="300"><%
						out.println(DictionaryService.findPracticeTask(practice_id).getTask_name());
					%>
				</td>
			</tr>

			<tr>
				<td width="100">标题：</td>
				<td width="500"><input type="text" name="title"
					value="${directrecord.title}" style="width:230px;">
				</td>
			</tr>
			<tr>
				<td width="100">起始时间：</td>
				<td width="300">
				    <fmt:parseDate value="${directrecord.direct_time}" var="direct_time" />
					<fmt:formatDate value="${direct_time}" pattern="yyyy-MM-dd" />
				</td>
			</tr>
			<tr>
				<td width="100">结束时间：</td>
				<td width="300">
					${directrecord.temp2}
				</td>
			</tr>
			<tr>
				<td width="100">指导地点：</td>
				<td width="300"><input type="text" name="direct_place"
					value="${directrecord.direct_place}"  style="width:230px;"/>
				</td>
			</tr>	
				<tr>
			<td width="100">描述：</td>
			<td width="300">
			<%-- <textarea name="direct_desc" id="content" style="resize:none" onkeyup="javascript:checkWord(this);" onmousedown="javascript:checkWord(this);" 
  				 cols="60" rows="4" style="overflow-y: scroll">${directrecord.direct_desc}</textarea> 
					 <div> 
						还可以输入<span style="font-family: Georgia; font-size: 26px;"
							id="wordCheck">70</span>个字符
					</div> --%>
					<div class="wordCount" id="wordCount">
					      <textarea name="direct_desc" rows="7"  style="width:100%;height:100%;"
					       id="content">${directrecord.direct_desc}</textarea>
					      <span class="wordwrap"><var class="word">500</var>/500</span>
					</div>
				</td>
		       </tr>
		</table>
		<div style="margin-top:20px;">
			<input type="submit" value="保存" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="window.location='./teacherSummaryList.do'">返回</button>
		</div>
	</form>
</body>
</html>





















