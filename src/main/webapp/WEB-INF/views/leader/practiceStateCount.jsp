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
<!-- <script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script> -->
	<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/chart-hidden.js"></script>
<title>学院管理员首页</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript">
	//定义数据jsonData
	
	function draw(jsonArray,year){
		var chart = new iChart.Pie2D({
			render : 'canvasDiv',
			data : jsonArray,
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
			width : 1024,
			height : 800,
			radius : 150,
			originx: 50,
			offsetx: -30,//设置向x轴负方向偏移位置30px
			sub_option : {
				listeners : {
					beforedraw : function(s) {
						if (s.abc) {
							return false;
						}
						return true;
					},
					/**
					 * r:iChart.Sector2D对象
					 * e:eventObject对象
					 * m:额外参数
					 */
					click : function(s, e, m) {
						 /* alert(s.get('name') );
						alert(s.get('text') );  */
						var collegeId=$("#collegeId").val();
						window.open("<%=path%>/leader/toPracticeStateDept.do?stateCode="+ s.get('text')+"&year="+year+"&collegeId="+collegeId);
							}
						}
					}
		}).draw();
	}

	function tochart(data,year,collegeName) {
		var jsonArray = eval("(" + data + ")");
		draw(jsonArray,year);
		$("#grade").text(year);
		$("#college_name").text(collegeName);
	}
	function ajaxToChart(){
		var year=$("#year").val();
		var collegeId=$("#collegeId").val();
		var collegeName=$("#collegeId").find("option:selected").text(); 
		$.ajax({
			type : "get",
			url : "ajaxPracticeStateCount.do?",
			data : "year="+year+"&&collegeId="+collegeId,
			dataType : "text",
			success : function(data) {
			if(data==0){
			alert("此学院"+year+"级无数据，请重新选择。");
			}
			else{
			tochart(data,year,collegeName);
			}
			},
			error : function(result, status) {
				if (status == 'error') {
					alert(status);
				}
			}
		});
	}
	//页面加载完自动执行
	$(function(){
		$("#btn").click();
	});
</script>
</head>
<body>
	<h1><span id=college_name>${college_name}</span><span id="grade">${grade}</span>级学生实习状态统计</h1>
	选择年级：
	<select id="year" name="year" class="year">
		<option value="2012">2012</option>
		<option value="2013" selected="selected">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
		<option value="2016">2016</option>
	</select>
	选择学院：
	<select id="collegeId">
	<c:forEach var="o" items="${orgList}" varStatus="stauts">
	<option value="${o.id}">${o.org_name}</option>
	</c:forEach>
	</select>
	<input type="button" id="btn" value="查询" onclick="ajaxToChart()">
	<div id='canvasDiv'></div>
</body>
</html>
