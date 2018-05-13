<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%--<%@ include file="../titlebar.jsp"%>
--%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
-->
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src='http://www.ichartjs.com/ichart.latest.min.js'></script>
<script type='text/javascript'>
	$(function() {

		"<c:forEach var="q" items="${qn.summaryQuestions}" varStatus="status">";
		//定义数据jsonData
		var data = eval("(" + "${q.chartModel.jsonData}" + ")");
		console.log("data:"+data);
		"<c:if test="${q.type == '2'}">";
		var chart = iChart.create({
			render : "${q.id}",
			data : data,
			width : 1000,
			height : 600,
			background_color : "#f4f4f4",
			gradient : false,
			color_factor : 0.2,
			border : {
				color : "#bcbcbc",
				width : 1
			},
			align : "center",
			offsetx : 0,
			offsety : 0,
			sub_option : {
				border : {
					color : "#6d869f",
					width : 2
				},
				label : {
					fontweight : 500,
					fontsize : 18,
					color : "#4572a7",
					sign : "square",
					sign_size : 20,
					border : {
						color : "#BCBCBC",
						width : 0
					},
					background_color : "rgba(244,244,244,0)"
				}
			},
			shadow : true,
			shadow_color : "#666666",
			shadow_blur : 5,
			showpercent : true,
			column_width : "70%",
			bar_height : "70%",
			radius : "90%",
			title : {
				text : "${q.title}",
				color : "#6d869f",
				fontsize : 20,
				textAlign : "center",
				font : "微软雅黑",
				height : 30,
				offsetx : 0,
				offsety : 0
			},
			subtitle : {
				color : "#111111",
				fontsize : 16,
				textAlign : "center",
				font : "微软雅黑",
				height : 20,
				offsetx : 0,
				offsety : 0
			},
			footnote : {
				color : "#111111",
				fontsize : 12,
				textAlign : "right",
				font : "微软雅黑",
				height : 20,
				offsetx : 0,
				offsety : 0,
				text : "参与人数：${q.temp5}"
			},
			legend : {
				enable : false,
				background_color : "#fefefe",
				color : "#333333",
				fontsize : 12,
				border : {
					color : "#BCBCBC",
					width : 1
				},
				column : 1,
				align : "right",
				valign : "center",
				offsetx : 0,
				offsety : 0
			},
			coordinate : {
				width : "92%",
				height : "80%",
				background_color : "rgba(246,246,246,0.05)",
				axis : {
					color : "#bfbfc3",
					width : [ "", "", 6, "" ]
				},
				grid_color : "#c0c0c0",
				label : {
					fontweight : 500,
					color : "#f5f5f5",
					fontsize : 0
				}
			},
			label : {
				fontweight : 500,
				color : "#666666",
				fontsize : 11
			},
			type : "pie2d",
		});

		var data = eval("(" + "${q.chartModel.jsonData}" + ")");
		chart.load(data);
		chart.draw();
		"</c:if>";

		"<c:if test="${q.type == '1'}">";
		var chart = iChart.create({
			render : "${q.id}",
			data : data,
			width : 1000,
			height : 600,
			background_color : "#f4f4f4",
			gradient : false,
			color_factor : 0.2,
			border : {
				color : "#bcbcbc",
				width : 1
			},
			align : "center",
			offsetx : 0,
			offsety : 0,
			sub_option : {
				border : {
					color : "#6d869f",
					width : 2
				},
				label : {
					fontweight : 500,
					fontsize : 11,
					color : "#4572a7",
					sign : "square",
					sign_size : 12,
					border : {
						color : "#BCBCBC",
						width : 1
					},
					background_color : "#fefefe"
				}
			},
			shadow : false,
			shadow_color : "#666666",
			shadow_blur : 5,
			showpercent : false,
			column_width : "70%",
			bar_height : "70%",
			radius : "90%",
			title : {
				text : "${q.title}",
				color : "#c0c8e7",
				fontsize : 20,
				textAlign : "left",
				font : "微软雅黑",
				height : 30,
				offsetx : 30,
				offsety : 0
			},
			subtitle : {
				text : "",
				color : "#111111",
				fontsize : 16,
				textAlign : "left",
				font : "微软雅黑",
				height : 20,
				offsetx : 30,
				offsety : 0
			},
			footnote : {
				text : "Info Center",
				fontsize : 12,
				color : "#111111",
				textAlign : "right",
				font : "微软雅黑",
				height : 20,
				offsetx : 0,
				offsety : 0,
				text : "参与人数：${q.temp5}"
			},
			legend : {
				enable : false,
				background_color : "#fefefe",
				color : "#333333",
				fontsize : 12,
				border : {
					color : "#BCBCBC",
					width : 1
				},
				column : 1,
				align : "right",
				valign : "center",
				offsetx : 0,
				offsety : 0
			},
			coordinate : {
				width : "82%",
				height : "80%",
				background_color : "rgba(246,246,246,0.05)",
				axis : {
					color : "#bfbfc3",
					width : [ "", "", "", "" ]
				},
				grid_color : "#c0c0c0",
				label : {
					fontweight : 500,
					color : "#f5f5f5",
					fontsize : 11
				}
			},
			label : {
				fontweight : 500,
				color : "#666666",
				fontsize : 11
			},
			type : "bar2d"
		});
		/*var data = eval("(" + "${q.chartModel.jsonData}" + ")");
		console.log("data:"+data);
		chart.load(data);*/
		chart.draw();
		"</c:if>";

		"</c:forEach>";
	});
</script>
</head>

<body>

	<br /><br /><br />
	<c:if test="${!empty result}">
		<font color="red">${result}</font>
	</c:if>


	<h1 align="center">${title}分析图表</h1>
	<br />
	<c:forEach var="q" items="${qn.summaryQuestions}" varStatus="status">
		<div id='${q.id}'></div>
	</c:forEach>


</body>
</html>
