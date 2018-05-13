<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>查看小组详情信息</title>
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<script type="text/javascript">
	function back() {
		history.back(-1);
	}
</script>
</head>
<body>
		<h2>查看分组信息</h2>
		<table border="1" width="1000" bgcolor="#F0F0F0">
			<tr>
				<td width="150">分组名称：</td>
				<td width="270">${groups.group_name}</td>
			</tr>
			<tr>
				<td width="150">分组目的：</td>
				<td width="270">${groups.purpose}</td>
			</tr>
			<tr>
				<td width="150">分组成员：<br> <font color="red" size="2">&nbsp;&nbsp;教师（${teaSize}）
						<br>&nbsp;&nbsp;学生（${stusSize}） </font>
				</td>

				<td width="250">
					<div id="div">
						<%
							int i = 1;
						%>
						<c:forEach var="g" items="${groupMember}" varStatus="stauts">
							<c:set var="user_id" value="${g.user_id}" scope="request"></c:set>
							<%
								String user_id = (String) request.getAttribute("user_id");
									if (i % 12 != 0) {
										if (user_id.length() > 16) {
											String turName = DictionaryService.findStudent(user_id)
													.getTrue_name();
											//用于格式话，两个名字的中间空格 方便对齐 此段代码不能提取，
											//提取到最上面会报错，并且，教师如果是两个字无法再次重用此方法，
											//所以教师如果是两个字的名字，可能格式会乱
											int nameLength = turName.length();
											if (nameLength == 3) {
												out.println(turName + "&nbsp;&nbsp;");
											} else {
												String a = turName.substring(0, 1);
												String b = turName.substring(1, 2);
												out.println(a + "&nbsp;&nbsp;" + b + "&nbsp;&nbsp;");
											}

											i = i + 1;
										} else {
											out.println("<font color=#FD0503 >"
													+ DictionaryService.findTeacher(user_id)
															.getTrue_name() + "</font>"
													+ "&nbsp;&nbsp;");
											i = i + 1;
										}
									} else {

										if (user_id.length() > 16) {
											out.println(DictionaryService.findStudent(user_id)
													.getTrue_name() + "<br/>");
											i = i + 1;
										} else {
											out.println("<font color=#FD0503 >"
													+ DictionaryService.findTeacher(user_id)
															.getTrue_name() + "</font> " + "<br/>");
											i = i + 1;
										}
									}
							%>
						</c:forEach>
					</div>
				</td>
			</tr>
			<tr>
				<td width="150">分组描述：</td>
				<td width="900">${groups.description}</td>
			</tr>
		</table>
		<div style="margin-top:20px;">
			<button type="button" onclick="window.location.href ='./backpracticetaskList.do'">返回</button>
		</div>
	
</body>
</html>