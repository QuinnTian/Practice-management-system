<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>成功导入教室信息</title>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}

.className {
	line-height: 30px;
	height: 30px;
	width: 59px;
	color: #777777;
	background-color: #ededed;
	font-size: 16px;
	font-weight: normal;
	font-family: Arial;
	background: -webkit-gradient(linear, left top, left bottom, color-start(0.05,
		#ededed), color-stop(1, #f5f5f5) );
	background: -moz-linear-gradient(top, #ededed 5%, #f5f5f5 100%);
	background: -o-linear-gradient(top, #ededed 5%, #f5f5f5 100%);
	background: -ms-linear-gradient(top, #ededed 5%, #f5f5f5 100%);
	background: linear-gradient(to bottom, #ededed 5%, #f5f5f5 100%);
	background: -webkit-linear-gradient(top, #ededed 5%, #f5f5f5 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed',
		endColorstr='#f5f5f5', GradientType=0 );
	border: 1px solid #dcdcdc;
	-webkit-border-top-left-radius: 6px;
	-moz-border-radius-topleft: 6px;
	border-top-left-radius: 6px;
	-webkit-border-top-right-radius: 6px;
	-moz-border-radius-topright: 6px;
	border-top-right-radius: 6px;
	-webkit-border-bottom-left-radius: 6px;
	-moz-border-radius-bottomleft: 6px;
	border-bottom-left-radius: 6px;
	-webkit-border-bottom-right-radius: 6px;
	-moz-border-radius-bottomright: 6px;
	border-bottom-right-radius: 6px;
	-moz-box-shadow: inset 0px 0px 0px 0px #ffffff;
	-webkit-box-shadow: inset 0px 0px 0px 0px #ffffff;
	box-shadow: inset 0px 0px 0px 0px #ffffff;
	text-align: center;
	display: inline-block;
	text-decoration: none;
}

.className:hover {
	background-color: #f5f5f5;
	background: -webkit-gradient(linear, left top, left bottom, color-start(0.05,
		#f5f5f5), color-stop(1, #ededed) );
	background: -moz-linear-gradient(top, #f5f5f5 5%, #ededed 100%);
	background: -o-linear-gradient(top, #f5f5f5 5%, #ededed 100%);
	background: -ms-linear-gradient(top, #f5f5f5 5%, #ededed 100%);
	background: linear-gradient(to bottom, #f5f5f5 5%, #ededed 100%);
	background: -webkit-linear-gradient(top, #f5f5f5 5%, #ededed 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f5f5f5',
		endColorstr='#ededed', GradientType=0 );
}
</style>
</head>
<body>
	<h2>导入教师信息表</h2>
	<table border="1" width="1300" id="table1">
		<tr>
			<td width="120" align="center"><b>教室编号</b></td>
			<td width="80" align="center"><b>教室名称</b></td>
			<td width="80" align="center"><b>楼层</b></td>
			<td width="80" align="center"><b>楼号</b></td>
			<td width="120" align="center"><b>可容纳人数</b></td>
			<td width="60" align="center"><b>负责人</b></td>
			<td width="120" align="center"><b>配套描述</b></td>
			<td width="120" align="center"><b>备注</b></td>
			</td>
		</tr>
		<c:forEach var="s" items="${cl}" varStatus="stauts">
			<tr>
				<td align="center">${s.scr_code}</td>
				<td align="center">${s.scr_name}</td>
				<td align="center">${s.scr_floor}</td>
				<td align="center">${s.scr_num}</td>
				<td align="center">${s.scr_capabilit}</td>
				<td align="center"><c:set scope="request" var="scr_contacat"
						value="${s.scr_contacat}" /> <%
 	String scr_contacat = (String) request
 				.getAttribute("scr_contacat");
 		if (scr_contacat != null)
 			out.println(DictionaryService.findTeacher(scr_contacat)
 					.getTrue_name());
 		else
 			out.println("无");
 %>
				</td>
				<td align="center">${s.scr_devices}</td>
				<td align="center">${s.scr_note}</td>
			</tr>
		</c:forEach>
	</table>
	<br />
	<br />
	<button type="button" class='className'
		onClick="window.location='classroomManage.do'">返回</button>
</body>
</html>