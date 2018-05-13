<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>审阅实训作品</title>
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.min.js" type="text/javascript"></script>
<script>
	//查看
	function download(id) {
		window.location.href = "downloadFile.do?file_id=" + id;
	}
	//返回
	function doBack() {
		window.history.go(-1);
	}
	//编辑保存
	function doEdit() {
		var comment = document.getElementById("comment");
		var score=document.getElementsByName("score");
		if (comment.value ==""||comment.value=="暂无") {
				alert("请填写实训作品评论");
				comment.focus();
				return;
		}
		for(var i=0;i<score.length;i++){
			 if(score[i].checked==true){
			 	temp=1;
				 break;
			 }else{
			 	temp=0;
			 }
		}
		if(temp==0){
			alert("请选择评分");
			return false;
			}
		document.forms[0].submit();
	}
	
</script>
<!-- 字数限制 -->
<script>
	var maxstrlen = 70;
	function Q(s) {
		return document.getElementById(s);
	}

	function checkWord(c) {
		len = maxstrlen;
		var str = c.value;
		myLen = getStrleng(str);
		var wck = Q("wordCheck");

		if (myLen > len * 2) {
			c.value = str.substring(0, i + 1);
		} else {
			wck.innerHTML = Math.floor((len * 2 - myLen) / 2);
		}
	}

	function getStrleng(str) {
		myLen = 0;
		i = 0;
		for (; (i < str.length) && (myLen <= maxstrlen * 2); i++) {
			if (str.charCodeAt(i) > 0 && str.charCodeAt(i) < 128)
				myLen++;
			else
				myLen += 2;
		}
		return myLen;
	}
</script>
</head>
<body>
 <c:set var="pn" value="${gthesis.stu_id}" scope="request"></c:set>
				<%
					String str_stu_id = (String) request.getAttribute("pn");
				%>
				  <c:set var="practice_id" value="${gthesis.practice_id}" scope="request"></c:set>
				<%
					String practice_id = (String) request.getAttribute("practice_id");
				%>
	<form name="Form2" action="doCheckThesis.do" method="post">
		<input type="hidden" name="type" value="${gthesis.type }"> 
		<input type="hidden" name="id" value="${gthesis.id}">
		<h2>审阅实训作品</h2><br>
		<input type="button" value="下载实训作品" onclick="download('${gthesis.file_id}');">
		<input type="hidden" name="file_id" value="${gthesis.file_id}" />
		<table border="0" width="1000">
			<tr>
				<td width="100">任务名称：</td>
				<td width="300">
					<%
						out.println(DictionaryService.findPracticeTask(practice_id).getTask_name());
					%>
				</td>
			</tr>
			<tr>
				<td width="100">学生学号：</td>
				<td width="300">
					<%
						out.println(DictionaryService.findStudent(str_stu_id).getStu_code());
					%>
				</td>
				<td width="100">学生姓名：</td>
				<td width="300">
					<%
						out.println(DictionaryService.findStudent(str_stu_id).getTrue_name());
					%>
				</td>
			</tr>
			<tr>
				<td width="100">作品标题：</td>
				<td width="300">${gthesis.thesis_name}</td>
				<%-- <td width="100">论文进展：</td>
				<td width="300">${gthesis.progress}</td> --%>
			</tr>
			<tr>
			<td width="100">上传时间：</td>
				<td><fmt:parseDate value="${gthesis.create_time}" var="create_time" /> 
				<fmt:formatDate value="${create_time}" pattern="yyyy/MM/dd" />
				</td>
			</tr>
			<tr>
			<td width="100">论文描述：</td>
			<td width="300">${gthesis.thesis_desc}</td>
			</tr>
			<tr>
				<td width="100">评语：</td>
				<td width="300">
	<textarea  style="resize:none" onkeyup="javascript:checkWord(this);" onmousedown="javascript:checkWord(this);" 
  name="comment" id="comment"  cols="60" rows="4" style="overflow-y: scroll">${gthesis.comment}</textarea> 
					 <div> 
						还可以输入<span style="font-family: Georgia; font-size: 26px;"
							id="wordCheck">70</span>个字符
					</div>
			</tr>
			<!-- <tr>
				<td width="80">分数类型：</td>
				<td width="70"><select name="score_type" id="score_type"
					style="font-family: sans-serif">
						<option value="优秀">优秀</option>
						<option value="良好">良好</option>
						<option value="差评">差评</option>
				</select></td>
			</tr> -->
			<tr>
				<td width="70">评分：</td>
				<c:set var="score" value="${gthesis.score}" scope="request"></c:set>
       			<% String score=(String)request.getAttribute("score"); %>
				<td width="300"><%-- <input type="text" name="score"
					value="${gthesis.score}"> --%>
				<input type="radio" name="score" value="90" <%="90".equals(score)?"checked":"" %> >优秀
				<input type="radio" name="score" value="80" <%="80".equals(score)?"checked":"" %> >良好
				<input type="radio" name="score" value="70" <%="70".equals(score)?"checked":"" %> >一般
				<input type="radio" name="score" value="60" <%="60".equals(score)?"checked":"" %> >及格
				<input type="radio" name="score" value="50" <%="50".equals(score)?"checked":"" %> >不及格
				
				
				</td>
			</tr>
		</table>
		<div style="margin-top:20px;">
			<input type="button" value="保存" onclick="doEdit();" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="doBack();">返回</button>
		</div>
	</form>
</body>
</html>
