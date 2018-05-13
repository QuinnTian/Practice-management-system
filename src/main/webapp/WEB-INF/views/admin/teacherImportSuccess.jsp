<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<title>成功导入教师列表</title>
	<script type="text/javascript">
		function backList(){
			window.location.href="teacherList.do?type="+"1";
		}
	</script>
</head>
<body>
  <h2 align='center'>成功导入教师列表</h2>
  <input type="button" value="返回首页" onclick="backList()">
  <table border="1" width="1300" id="teaTable" style="overflow-x:hidden;overflow-y:hidden;" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="40">序号</th>
			<th width="150" align="center">教工号</th>
			<th width="150" align="center">姓名</th>
			<th width="150" align="center">性别</th>
			<th width="150" align="center">电话</th>
			<th width="150" align="center">部门名称</th>
			<th width="150" align="center">职务</th>
			<th width="150" align="center">专长</th>
			<th width="150" align="center">所教课程</th>
			<th width="150" align="center">状态</th>
		</tr>
			
		<c:forEach var="t" items="${teaSuccessList}" varStatus="stauts">
			<tr>
				<td align="center">${stauts.index+1}</td>
				<td align="center">${t.tea_code}</td>
				<td align="center">${t.true_name}</td>
				<td align="center">${t.sex}</td>
				<td align="center">
				<c:choose>
				<c:when test="${empty t.phone}">
				<%="无" %>
				</c:when>
				<c:otherwise>
			    ${t.phone}
				</c:otherwise>
				</c:choose></td>
				<td align="center">
				<c:set var="dept_id" value="${t.dept_id}" scope="request"></c:set>
				<% 
					String dept_id=(String)request.getAttribute("dept_id");
				 %>
				<%
				if(DictionaryService.findOrg(dept_id) !=null){
					out.print(DictionaryService.findOrg(dept_id).getOrg_name());
				}else{
					
				}
				%>
				</td>
				<td align="center">${t.duties}</td>
				<td align="center">
				<c:choose>
				<c:when test="${empty t.expertise}">
				<%="无" %>
				</c:when>
				<c:otherwise>
			    ${t.expertise}
				</c:otherwise>
				</c:choose></td>
				<td align="center">
				<c:set var="ci" value="${t.course_id}" scope="request"></c:set>
				<% 
				   String ci=(String)request.getAttribute("ci"); 
				   if(ci !=null){
				   	if(ci.length()>0){
				   		 String[] course_id = ci.split(",");
				   		 for(int i=0;i<course_id.length;i++){
				   	     if(DictionaryService.findCourses(course_id[i]) !=null){
				   	     out.print(DictionaryService.findCourses(course_id[i]).getCourse_name()+" ");
				  	 }
				     }
				   	}
				   }
				  
				 %>
				</td>
				<td align="center">
				<c:set var="state" value="${t.state}" scope="request"></c:set>
				<%
					String state=(String)request.getAttribute("state");
					String stateName="有效";
					if(state.equals("0")){
						stateName="无效";
						}
					out.print(stateName);
				 %>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
