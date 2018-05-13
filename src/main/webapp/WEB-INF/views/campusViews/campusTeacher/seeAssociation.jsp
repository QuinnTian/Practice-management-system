<%@ page language="java" contentType="text/html; charset=UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ page import="com.sict.entity.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>社团信息维护</title>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>

</head>
<body>
	<h1>社团信息维护</h1>
	<br />
	<table id="courseTab" border="1" width="850" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="150">部门编码</th>
			<th width="150">部门名称</th>
			<th width="150">本门级别</th>
			<th width="150">所属学院</th>
			<th width="150">负责老师</th>
			<th width="300">负责学生</th>
			<th width="150">本门描述</th>
			<th width="150">创建人</th>
			<th width="50">上级部门</th>
			<th width="50">最后修改人</th>
			<th width="50">最后修改时间</th>
			<th width="50">操作</th>
		</tr>
		<c:forEach var="association" items="${associationList}" varStatus="status">
			<tr>
				<td>${association.sa_code}</td>
				<td>${association.sa_name}</td>
				<td><c:if test="${association.sa_level==1}">校级</c:if> <c:if test="${association.sa_level==2}">院级</c:if> <c:if
						test="${association.sa_level==3}">系级</c:if></td>
				<td>
					<!-- 将学院id 转化成学生name --> <c:set var="sa_college_id" value="${association.sa_college_id}" scope="request" /> <%
 	String sa_college_id = (String) request.getAttribute("sa_college_id");
 		Org org = DictionaryService.findOrg(sa_college_id);
 		if (org != null)
 			out.println(org.getOrg_name());
 		else
 			 out.println("无"); 
 %>
				</td>
				<td><c:set var="sa_tea_id" value="${association.sa_tea_id}" scope="request" /> <%
 	String sa_tea_id = (String) request.getAttribute("sa_tea_id");
 		Teacher teacher = DictionaryService.findTeacher(sa_tea_id);
 		if (teacher != null)
 			out.println(teacher.getTrue_name());
 		else
 			out.println("无");
 %></td>
				<td><c:set var="sa_stu_id" value="${association.sa_stu_id}" scope="request" /> <%
 	String sa_stu_id = (String) request.getAttribute("sa_stu_id");
 		Student student = DictionaryService.findStudent(sa_stu_id);
 		if (student != null)
 			out.println(student.getTrue_name());
 		else
 			out.println("无");
 %></td>
				<td>
				<c:set var="sa_describe" value="${association.sa_describe}" scope="request" />
				<%
				String sa_describe = (String) request.getAttribute("sa_describe");
				out.println(sa_describe);
				%>
				 </td>
 				<td><c:set var="sa_create_user" value="${association.sa_create_user}" scope="request" /> <%
 	String sa_create_user = (String) request.getAttribute("sa_create_user");
 		Teacher tea = DictionaryService.findTeacher(sa_create_user);
 		if (tea != null)
 			out.println(tea.getTrue_name());
 %></td>

				<td><c:set var="sa_parent_id" value="${association.sa_parent_id}" scope="request" /> <%
 	String sa_parent_id = (String) request.getAttribute("sa_parent_id");
 		Org org1 = DictionaryService.findOrg(sa_parent_id);
 		if (org1 != null)
 			out.println(org1.getOrg_name());
 		else
 			out.println("无");
 %></td>
				<td><c:set var="sa_last_edit_user" value="${association.sa_last_edit_user}" scope="request" /> <%
 	String sa_last_edit_user = (String) request.getAttribute("sa_last_edit_user");
 		Teacher tea2 = DictionaryService.findTeacher(sa_create_user);
 		
 		if (tea2 != null)
 			out.println(tea2.getTrue_name());
 		else{
 			Student stu = DictionaryService.findStudent(sa_create_user);
 			if (stu != null)
 	 			out.println(stu.getTrue_name());
 	 		else
 	 			out.println("无");
 		}
 %></td>
				<td>
				<fmt:parseDate value="${association.sa_last_edit_time}" var="sa_last_edit_time" />
				<fmt:formatDate value="${sa_last_edit_time}" pattern="yyyy/MM/dd " />
				</td>
				<td>
					<c:set var="id" value="${association.id}" scope="request" /> 
				<%
					String id=(String)request.getAttribute("id");
				%>
				<input type="button" value="查看成员" onclick="location.href='./seeAssociationMemberDetail.do?id=<%=id%>'" /></td> 
			</tr>
		</c:forEach>

	</table>

</body>
</html>
