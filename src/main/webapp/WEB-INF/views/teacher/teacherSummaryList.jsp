<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>教师总结</title>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript">
	//添加
	function add() {
		window.location.href = "addteacherSummary.do";
	}

	//删除
	function doDel(id) {
		if (window.confirm("确定删除此总结吗?")) {
			window.location.href = "deleteTeacherSummary.do?id=" + id;
		}
	}
</script>
</head>
<body>
	<h2 align="left">教师总结管理</h2>
	<div style="margin-top:10px;">
		&nbsp;&nbsp;&nbsp;
		<input type="button" onclick="javascript:add();" value="上传总结" />
	</div>

	<table border="1" width="1000" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr>
			<td width="115">实习任务</td>
			<td width="115">标题</td>
			<td width="80">起始时间</td>
			<td width="80">结束时间</td>
			<td width="100">指导地点</td>
			<!-- <td width="120">指导组织</td> -->
			<td width="250">指导学生</td>
			<!-- <td width="170">描述</td> -->
			<td width="50">操作</td>
		</tr>

		<c:forEach var="d" items="${directRecordList}" varStatus="stauts">
			<tr>
				<c:set var="p_id" value="${d.practice_id}" scope="request"></c:set>
				<%
					String practice_id = (String) request.getAttribute("p_id");
				%>
				<c:set var="group_id" value="${d.org_id}" scope="request"></c:set>
				<%
					String group_id = (String) request.getAttribute("group_id");
				%>
				<c:set var="stuts" value="${d.stu_id}" scope="request"></c:set>
				<%
					String stuts = (String) request.getAttribute("stuts");
				%>
				<td>
					<%
						out.println(DictionaryService.findPracticeTask(practice_id)
									.getTask_name());
					%>
				</td>
				<td><a href="editteacherSummary.do?id=${d.id}">${d.title}</a></td>
				<td><fmt:parseDate value="${d.direct_time}" var="direct_time" />
					<fmt:formatDate value="${direct_time}" pattern="yyyy/MM/dd" />
				</td>
				<td>
				<fmt:parseDate value="${d.temp2}" var="temp2" />
					<fmt:formatDate value="${temp2}" pattern="yyyy/MM/dd" />
				</td>
				<td>${d.direct_place}</td>
				<%-- <td>
					<%
						out.println(DictionaryService.findGroups(group_id).getGroup_name());
					%>
				</td> --%>
				<td>
					<%
							StringBuffer sb = new StringBuffer();
							String[] sts = stuts.split(",");
							for (int i = 0; i < sts.length; i++) {
								String stuName = DictionaryService.findStudent(sts[i])
										.getTrue_name();
								sb.append(stuName + "、");
							}
							sb.deleteCharAt(sb.length() - 1);
					%> 
					<%=sb%></td>
				<%-- <td>${d.direct_desc}</td> --%>

				<td><input type="button" value="删除" onclick="doDel('${d.id}');">
				</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>
