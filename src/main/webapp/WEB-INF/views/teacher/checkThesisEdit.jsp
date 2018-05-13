<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>审阅毕业论文</title>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"
	type="text/javascript"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.min.js"
	type="text/javascript"></script>
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
	  //	var progress = document.getElementsByName("progress");
		if (comment.value ==""||comment.value=="暂无") {
				alert("请填写论文评论");
				comment.focus();
				return;
		}
   			document.Form2.submit();			
 		
		}
	$(function() {
		/* var progress = $("#progress").val(); */
		var progress = $('input:radio[name="progress"]:checked').val();
		/* alert(progress); */
		if (progress == "继续修改") {
			$("#grade").hide();
		} else if (progress == undefined) {
			$("#grade").hide();
		}
	});

	function showGrade() {
		var progress = $('input:radio[name="progress"]:checked').val();
		/* var progress = $("#progress").val(); */
		/* 	alert(progress); */
		if (progress == "继续修改") {
			$("#grade").hide();
		} else if (progress == undefined) {
			$("#grade").hide();
		} else {
			$("#grade").show();
		}

	}
</script>
<!-- 字数限制 -->
<script>
	function textCounter(field,counter,maxlimit,linecounter) {
 // text width//
 var fieldWidth =  parseInt(field.offsetWidth);
 var charcnt = field.value.length;
 // trim the extra text
 if (charcnt > maxlimit) {
  field.value = field.value.substring(0, maxlimit);
 }
 else {
 // progress bar percentage
 var percentage = parseInt(100 - (( maxlimit - charcnt) * 100)/maxlimit) ;
 document.getElementById(counter).style.width =  parseInt((fieldWidth*percentage)/100)+"px";
 document.getElementById(counter).innerHTML="已输: "+percentage+"%"
 // color correction on style from CCFFF -> CC0000
 setcolor(document.getElementById(counter),percentage,"background-color");
 }
}
function setcolor(obj,percentage,prop){
 obj.style[prop] = "rgb(80%,"+(100-percentage)+"%,"+(100-percentage)+"%)";
}

textCounter(document.getElementById("answer"),"progressbar1",400)
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
		<h1>审阅毕业论文</h1>
		<input type="button" value="下载论文" onclick="download('${gthesis.file_id}');">
		<input type="hidden" name="file_id" value="${gthesis.file_id}" />
		<table border="0" width="1000">
			<tr>
				<td width="100">版本号：</td>
				<td width="300">${gthesis.version}</td>
				
				<td width="100">任务名称：</td>
				<td width="300">
					<%
						out.println(DictionaryService.findPracticeTask(practice_id).getTask_name());
					%>
				</td>
			</tr>
			<tr>
				<td width="100">学号：</td>
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
				<td width="100">标题：</td>
				<td width="300">${gthesis.thesis_name}</td>
				<td width="100">论文进展：</td>
				<td width="300">${gthesis.progress}</td>
			</tr>
			<tr>
				<td width="100">上传时间：</td>
				<td><fmt:parseDate value="${gthesis.create_time}" var="create_time" /> 
				<fmt:formatDate value="${create_time}" pattern="yyyy/MM/dd" />
				</td>
			</tr>
			<tr>
				<td width="100">评语：</td>
				<td width="300">
			<div> 最多输入400字 <div id="progressbar1" class="progress">	</div> </div>
		<!-- <textarea id="answer" name="answer" style="width:900px; height: 100;  border: 0;"></textarea> -->
		
		<textarea rows="5" cols="40" name="comment" id="comment" 
        onKeyDown="textCounter(this,'progressbar1',400)" 
        onKeyUp="textCounter(this,'progressbar1',400)" 
        onPaste="textCounter(this,'progressbar1',400)" 
        onFocus="textCounter(this,'progressbar1',400)" >${gthesis.comment}</textarea>
			</tr>
			<tr>
				<td width="100">审阅意见：</td>
				<td width="70">
				<c:set var="progress" value="${gthesis.progress}" scope="request"></c:set>
       			<% String progress=(String)request.getAttribute("progress"); %>
				<%-- <select name="progress" id="progress" style="font-family: sans-serif" onchange="showGrade();">
						<option value="继续修改" <%="继续修改".equals(progress)?"selected":"" %>>继续修改</option>
						<option value="论文定稿" <%="论文定稿".equals(progress)?"selected":"" %>>论文定稿</option>
				</select> --%>
				<input type="radio" name="progress" value="继续修改" <%="继续修改".equals(progress)?"checked":"" %> onchange="showGrade();">继续修改 
				<br>
				<input type="radio" name="progress" value="论文定稿" <%="论文定稿".equals(progress)?"checked":"" %> onchange="showGrade();"> 论文定稿
				</td>
			</tr>
			<tr id="grade">
				<td width="100">评分：</td>
				<td width="70">
				<c:set var="score" value="${gthesis.score}" scope="request"></c:set>
       			<% String score=(String)request.getAttribute("score"); %>
				<%-- <select name="score" id="score" name="score" style="font-family: sans-serif">
						<option value="95" <%="95".equals(score)?"selected":"" %>>优秀</option>
						<option value="80" <%="80".equals(score)?"selected":"" %>>良好</option>
						<option value="60" <%="60".equals(score)?"selected":"" %>>及格</option>
						<option value="50" <%="50".equals(score)?"selected":"" %>>不及格</option>
				</select> --%>
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
