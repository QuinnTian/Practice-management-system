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
<title>教师首页</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript">
	//定义数据jsonData

	function draw(jsonArray,data3, year) {
		var chart = new iChart.Pie2D({
			render : 'canvasDiv',
			data : jsonArray,
			title : {
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
						window.open("<%=path%>/leader/getCollegeStudentCityStatistics.do?stateCode="+ s.get('text')+"&year="+year);
							}
						}
					},
			showpercent : true,
			decimalsnum : 2,
			legend : {
				enable : true,
				background_color : null,
				line_height : 25,
				fontsize : 12,
				font : '微软雅黑',
				fontweight : 600,
				data : data3,
				border : {
					enable : false
				}
			},
			width : 800,
			height : 700,
			radius : 150,
			originx : 50,
			offsetx : -30
		//设置向x轴负方向偏移位置30px

		}).draw();
	}
	function tochart(data2,data3, year) {
		var jsonArray = eval("(" + data2 + ")");
		var data3 = eval("(" + data3 + ")");
		draw(jsonArray,data3, year);
		$("#grade").text(year);
	}
	/*
	*根据各学院的id查询数据
	*/
	function ajaxToChart() {
		var year = $("#year").val();
		var dept_id = $("#department_id").val();
		localStorage.grade =year;
		$.ajax({
			type : "get",
			url : "ajaxCityStatistics2.do?",
			data : "year=" + year + "&dept_id="+dept_id,
			dataType : "text",
			success : function(data) {
				var dataArray=data.split("---");
				var data2=dataArray[0];
				var data3=dataArray[1];
				tochart(data2,data3, year);
			},
			error : function(result, status) {
				if (status == 'error') {
					alert(status);
				}
			}
		});
	}
	
</script>
<script type="text/javascript" src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	<h1>
		<span id="grade">${grade }</span>级实习学生地点分布
	</h1>
	
	
<c:set var="grade" value="${grade}" scope="request"></c:set>
		<%
			String grade = (String) request.getAttribute("grade");//获得默认的年级（这里是2013年）
		%>
	年级：<select name="year" id="year" >
			<option value="2012" <%="2012".equals(grade) ? "selected" : ""%>>2012</option>
			<option value="2013" <%="2013".equals(grade) ? "selected" : ""%>>2013</option>
			<option value="2014" <%="2014".equals(grade) ? "selected" : ""%>>2014</option>
			<option value="2015" <%="2015".equals(grade) ? "selected" : ""%>>2015</option>
			<option value="2016" <%="2016".equals(grade) ? "selected" : ""%>>2016</option>
			<option value="2017" <%="2017".equals(grade) ? "selected" : ""%>>2017</option>
			<option value="2018" <%="2018".equals(grade) ? "selected" : ""%>>2018</option>
			<option value="2019" <%="2019".equals(grade) ? "selected" : ""%>>2019</option>
		</select> 
    &nbsp;&nbsp;&nbsp;学院：
    <select name="department_id" id="department_id">
				<option value="szxy" selected>山东商业职业技术学院</option>
			<c:forEach var="orgList" items="${orgList}" varStatus="stauts">
				<option value="${orgList.id}">${orgList.org_name}</option>
			</c:forEach>
	</select> 
	<input type="button" id="btn" value="查询" onclick="ajaxToChart()">
	
	<div id='canvasDiv'></div>
	<script type="text/javascript" src="<%=path%>/js/localStorage.js"></script>
</body>
</html>
