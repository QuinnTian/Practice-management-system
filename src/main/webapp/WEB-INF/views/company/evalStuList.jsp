<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>企业老师评价</title>
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<link rel="stylesheet" type="text/css"href="<%=path%>/css/BMapUnSin.css">
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css"media="screen" type="text/css" />
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.reveal.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/checkWordLength.js"></script>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script>
function change(stu_id) {
//前台js向后台传值
	var stu_id = $("#stu_id").val();
	location.href="historyEval.do?stu_id=" + stu_id;
	
	}
//提示保存是否成功	
$(function() {
		var infor=$("#infor").val();
		if(infor=="success"){
			alert("评价成功，可以点击历史评价查看！");
		}
	});
	
	
	function check(){
	var evaltitle=$("#evaltitle").val();
	  if(evaltitle==""){
	   	alert("标题不能为空！");
	   	return null;
	}
	var content=$("#content").val();
	  if(content==""){
	   	alert("评语不能为空！");
	   	return null;
	   	}
	   	
	   	else{
	   	
	   	document.saveForm.submit();
	   	}
	}
</script>

</head>
<body>
	<h2>实习员工列表</h2>
	&nbsp;
	<input type="hidden" id="infor" name="infor" value="${infor}"> 
<table border="1" width="1000" id="praTable" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr>
			<th width="80">员工姓名</th>
			<th width="50">性别</th>
			<th width="100">联系电话</th>
		   <th width="180">岗位名称</th>
		   	   <th width="100">入职时间</th>
		      <th width="100">学校指导老师电话</th>
			<th width="30">操作</th>
			<th width="80">操作</th>
		</tr>
	   <c:forEach var="s" items="${stu}" varStatus="stu">
		<tr>
			<td><c:set var="ss" value="${s.STU_ID}" scope="request">
				</c:set>
				<%
					String STU_ID = (String) request.getAttribute("ss");
				%>
				<%
					out.println(DictionaryService.findStudent(STU_ID).getTrue_name());
				%></td>
			<td>
				<%
					out.println(DictionaryService.findStudent(STU_ID).getSex());
				%></td>
			<td>
				<%
					out.println(DictionaryService.findStudent(STU_ID).getPhone());
				%></td>
				<td>${s.POST_ID}</td>
			    <td><fmt:parseDate value="${s.WORK_TIME}" var="WORK_TIME"/>
					<fmt:formatDate value="${WORK_TIME}" pattern="yyyy/MM/dd"/></td>
			<td><c:set var="ss" value="${s.TEA_ID}" scope="request">
				</c:set><%
					String TEA_ID = (String) request.getAttribute("ss");
				%>
				<%
					out.println(DictionaryService.findTeacher(TEA_ID).getPhone());
				%></td>
			<td><button id="abcd" data-reveal-id="myModal">评价</button></td>
			<td><button id="history" name="history" onclick="change()">查看历史评价记录</button></td>
		</tr>
	 </c:forEach>
</table>

	<!-- 评价的弹框设计   begin-->
<div id="myModal" class="reveal-modal">
<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;评价此员工</h2>
		&nbsp;
	<form  id="saveForm" name="saveForm" method="post" action="submitForm.do">
<table id="table" class="table" width="490"  align="center"  border="0">
	
		<tr>
			<td width="75" height="50px">&nbsp;&nbsp;标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题：</td>
				<td width="85" height="50px">
				<input style="width:350" type="text" name="evaltitle" id="evaltitle" placeholder="此项不能为空"/> 
				</td>
		</tr>
		
		<tr>
			<td width="85" height="50px">&nbsp;&nbsp;评价类型：</td>
			<td width="85" height="50px" id="evaltype" name="evaltype">&nbsp;&nbsp;<label>企业评价</label></td>
		</tr>
		<tr>
			<td width="85" height="50px">&nbsp;&nbsp;员工姓名：</td>
			  <c:forEach var="s" items="${stu}" varStatus="stu">
			  <td>&nbsp;&nbsp;<c:set var="ss" value="${s.STU_ID}" scope="request">
				</c:set>
				<%
					String STU_ID = (String) request.getAttribute("ss");
				%>
				<%
					out.println(DictionaryService.findStudent(STU_ID).getTrue_name());
				%>
				<input type="hidden" name="stu_id" id="stu_id" value="${s.STU_ID}">
				</td>
			  </c:forEach>
		</tr>
		<tr>
			<td width="85" height="50px">&nbsp;&nbsp;岗位名称：</td>
			  <c:forEach var="s" items="${stu}" varStatus="stu">
			  <td>&nbsp;&nbsp;${s.POST_ID}
				</td>
			  </c:forEach>
		</tr>
		<tr>
				<td width="85" height="50px">&nbsp;&nbsp;综合打分：</td>
			<td>
			    <input type="radio" name="score" id="score" value="1" checked="checked"> 1分
			 	<input type="radio" name="score" id="score" value="2"> 2分
				<input type="radio" name="score" id="score" value="3"> 3分
			    <input type="radio" name="score" id="score" value="4"> 4分
			 	<input type="radio" name="score" id="score" value="5"> 5分
			</td>
		</tr>
		<tr>
			<td width="75"  height="50px"  valign="top">&nbsp;&nbsp;简&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;评：</td>
			<td width="250">
			<textarea  style="resize:none"  onkeyup="javascript:checkWord(this);" onmousedown="javascript:checkWord(this);"
			name="task_Desc" id="content" cols="45" rows="7" style="overflow-y: scroll"></textarea> 
		 <div> 
				还可以输入<span style="font-family: Georgia; font-size: 26px;"
			    id="wordCheck">140</span>个字符
		</div>
		   </td>
		</tr>
		<tr>
		   <td>
		   </td>
	   	   <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		   	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		   	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		   	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		   	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		   	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		   	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		   	 &nbsp;&nbsp;&nbsp;&nbsp;
		   <input type="button" value="保存" onclick="check()"/>
	   	  </td>
	</tr>
</table>
</form>
<a class="close-reveal-modal">&#215;</a>
</div>
	<!-- 评价的弹框设计   end-->
	

</body>
</html>
