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
<title>学生列表</title>
	<script type="text/javascript">
	    //添加
		function add(){
		  window.location.href="addTeacher.do";
		}
		
		//删除
		function doDel(id){
		  if(window.confirm("确定删除此学生?")){
           window.location.href="deleteTeacher.do?id="+id;
		  }
		}
		 //修改
		function doEdit(id){
		  window.location.href="editTeacher.do?id="+id;
		}
		//重置密码
		function rePass(tea_id){
		  if(window.confirm("确定重置此学生密码?")){
           window.location.href="resetPassword.do?tea_id="+tea_id;
		  }
		}
		
	</script>
</head>
<body>
  <h2 align='left'>学生列表</h2>
  <p>
  	 <input type="button" onclick="javascript:add();" value="新增学生用户"/>
  </p>
  	<table border="1" width="1300" id="teaTable" style="overflow-x:hidden;overflow-y:hidden;" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="150" align="center">学号</th>
			<th width="150" align="center">姓名</th>
			<th width="150" align="center">性别</th>
			<th width="150" align="center">电话</th>
			<!-- <th width="150" align="center">部门名称</th> -->
			<th width="100" align="center">重置密码</th>
			<th width="50" 	align="center">修改</th>
			<th width="50" 	align="center">操作</th>
		</tr>
			
		<c:forEach var="s" items="${stuList}" varStatus="stauts">
			<tr>
				<td align="center">${s.stu_code}</td>
				<td align="center">${s.true_name}</td>
				<td align="center">${s.sex}</td>
				<td align="center">
				<c:choose>
				<c:when test="${empty s.phone}">
				<%="无" %>
				</c:when>
				<c:otherwise>
			    ${s.phone}
				</c:otherwise>
				</c:choose></td>
				<td align="center"><input type="button" value="重置密码" onclick="rePass('${s.id}');"></td>
				<td align="center"><input type="button" value="修改" onclick="doEdit('${s.id}');"></td>
				<td align="center"><input type="button" value="删除" onclick="doDel('${s.id}');"></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
