<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript" src="<%=path%>/js/ichart.1.2.min.js"></script>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<title>教师首页</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript">
	//定义数据jsonData
	var data = eval("(" + "${cm}" + ")");
	console.log(data);
	var legendData = eval("(" + "${bm}" + ")");
	console.log(legendData);
	$(function() {
		
		var chart = new iChart.Pie2D({
			render : 'canvasDiv',
			data : data,
			title : {
				text : '${tea_name}老师${grade}级学生实习工作地点统计',
				color : '#3e576f'
			},
			footnote : {
				text : '实践教学管理系统',
				color : '#486c8f',
				fontsize : 11,
				padding : '0 38'
			},
			sub_option : {
				
				
				label : {
					background_color : null,
					sign : false,//设置禁用label的小图标
					padding : '0 4',
					border : {
						enable : false,
						color : '#666666'
					},
					fontsize : 11,
					fontweight : 600,
					color : '#4572a7'
				},
				border : {
					width : 2,
					color : '#ffffff'
				}
			},
			shadow : true,
			shadow_blur : 6,
			shadow_color : '#aaaaaa',
			shadow_offsetx : 0,
			shadow_offsety : 0,
			background_color : '#fefefe',
			offsetx : -60,//设置向x轴负方向偏移位置60px
			offset_angle : -120,//逆时针偏移120度
			showpercent : true,
			decimalsnum : 2,
			legend:{
				enable:true,
				background_color : null,
				line_height:25,
				fontsize:12,
				font:'微软雅黑',
				fontweight:600,
				data:legendData,
				border : {
					enable : false
				}
			},
			width : 800,
			height : 600,
			radius : 150,
			originx: 50,
			offsetx: -30//设置向x轴负方向偏移位置30px
		
		});
		
		chart.draw();
	});
</script>
</head>
<body>
	<div id='canvasDiv'></div>
</body>
</html>