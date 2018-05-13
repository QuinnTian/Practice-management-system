<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>该学生的就业材料</title>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
	<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
//修改学生
	function doEdit(id) {
		window.location.href = "checkMaterialsedit.do?id=" + id;
	}
</script>
</head>
<body>
	<h3><c:set var="true_name" value="${true_name}" scope="request"></c:set>
					<%
						String true_name = (String) request.getAttribute("true_name");
					%>
		<%out.println(true_name); %>同学的就业材料
	</h3>
	<table border="1" width="1300" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr>
			<td width="100">实习任务：</td>
			<td width="100">材料名称：</td>
			<td width="100">材料类型：</td>
			<td width="100">上传时间：</td>
			<td width="100">审阅时间：</td>
			<td width="100">申请状态：</td>
			<td width="100">审核备注：</td>
			<td width="50">操作</td>
		</tr>
		<c:forEach var="m" items="${gs}" varStatus="stauts">
			<tr>
				<td><c:set var="pn" value="${m.practice_id}" scope="request"></c:set>
					<%
						String practice_id = (String) request.getAttribute("pn");
					%> <%
 			out.println(DictionaryService.findPracticeTask(practice_id).getTask_name());
 					%>
				</td>
				<td>${m.materials_name}</td>
				<td>${m.materials_type}</td>
				<td><fmt:parseDate value="${m.create_time}" var="create_time" />
					<fmt:formatDate value="${create_time}" pattern="yyyy/MM/dd" />
				</td>
				<td><fmt:parseDate value="${m.check_time}" var="check_time" />
					<fmt:formatDate value="${check_time}" pattern="yyyy/MM/dd" />
				</td>
				<td>
				 <c:if test="${m.check_state=='0'}">
    				未审核
   				 </c:if>
   				 <c:if test="${m.check_state=='1'}">
    				已通过
   				 </c:if>
   				 <c:if test="${m.check_state=='2'}">
    				未通过
   				 </c:if>
				</td>
				<td>
				<c:if test="${m.note==''}">
    				无审核备注
   				</c:if>
				<c:if test="${m.note!=''}">
    				${m.note}
   				</c:if>
				</td>
				<td><input type="button" value="审核"onclick="doEdit('${m.id}');"></td>
			</tr>
		</c:forEach>
	</table>
	<div>
	<input type="button" value="返回" onclick="window.location='./studentList.do'"></div>
</body>
</html>
