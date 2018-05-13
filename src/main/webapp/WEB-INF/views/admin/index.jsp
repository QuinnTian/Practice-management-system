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
			showpercent : true,
			decimalsnum : 2,
			width : 800,
			height : 800,
			radius : 150,
			originx: 100,
			offsetx: -10,//设置向x轴负方向偏移位置30px
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
						window.location.href="<%=path%>/admin/toPracticeStateChartDept.do?stateCode="
										+ s.get('text');
							}
						}
					}
				});

		chart.draw();
	};
	function tochart(data, year) {
		var jsonArray = eval("(" + data + ")");
		draw(jsonArray, year);
		$("#grade").text(year);
	}
	function ajaxToChart() {
		var year = $("#year").val();
		$.ajax({
			type : "get",
			url : "ajaxIndex.do?",
			data : "year=" + year,
			dataType : "text",
			success : function(data) {
				tochart(data, year);
			},
			error : function(result, status) {
				if (status == 'error') {
					//角色记忆——教师身份与管理员身份Bug
						//alert(status);
				}
			}
		});
	}
	//页面加载完自动执行
	$(function() {
		$("#btn").click();
	});
	
	$(function() {
	$(".menuByUserClose2").click(function(){
			$("div .menuByUser").hide();});
	
	
		$("div .menuByUser").hide();
		
		$(".getCustomMenu").click(function(){
				$.ajax({
				type : "get",
				contentType : "application/json",
				url : "menuByUserAjax.do?",
				data : "", //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为text                
				success : function(data) { //成功时执行的方法
					$("div .menuByUserAjax").html(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
					
						//角色记忆——教师身份与管理员身份Bug
						//alert(status);
					}
				}
			});
			$("div .menuByUser").show();	
		});
		
		$(".menuByUserClose").click(function(){
			$("div .menuByUser").hide();
			var customMenu = $("input[name='CsysMenu']:checked").serialize();
			$.ajax({
				url: "updateCustomMenuAjax.do",
				type: "post",
				data: customMenu,
				success: function (result) {
					updateCustomMenuShow();
				},
				error : function() { //出错时会执行这里的回调函数                     
					alert("保存失败");
				}
			});
		});
		
		updateCustomMenuShow();
	});
	
	function updateCustomMenuShow(){
		$.ajax({
				type : "get",
				url : "updateCustomMenuShow.do?",
				data : "", //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为text                
				success : function(data) { //成功时执行的方法
					$("div .customMenuDivAjax").html(data);
				},
				error : function() { 
				}
		});
	}; 
</script>
<style type="text/css">
#customMenuDiv {
	position: absolute;
	top: 32.5%;
	right: 10%;
	width: 282px;
	height: 400px;
	background-color: #fefefe;
	border: 3px solid #a5caf7;
	
}
#getCustomMenu {
	position: relative;
	
	
	
}

a:hover {
	position: relative;
	color: #5c93d7;
}
#customMenuDivAjax {
	position: relative;
	top: 2%;
	left: 2%;
	width:98%;
	height:85%;
	line-height: 1em;
	font-size: 19px;
	font-weight: bold;
	font-family: sans-serif;
	overflow-y:scroll;
	overflow-x: hidden;
	::-webkit-scrollbar{width:14px;}
	::-webkit-scrollbar-track{background-color:#bee1eb;}
	::-webkit-scrollbar-thumb{background-color:#00aff0;}
	::-webkit-scrollbar-thumb:hover {background-color:#9c3}
	::-webkit-scrollbar-thumb:active {background-color:#00aff0}
}

#menuByUser {
	position: absolute;
	z-index: 20px;
	top: 15%;
	left: 0.5%;
	width: 60%;
	background-color: #fefefe;
	border: 3px solid #a5caf7;
	font-size: 18px;
	color: #b1cdf0;
}

#menuByUserClose {
	position: relative;
	right: 0px;
	display: block;
	height: 30px;
	width: 100%;
	font-size: 20px;
	font-weight: bold;
	color: #ffffff;
	background-color: #a5caf7;
}
a {
	text-decoration: none;
	color: #b1cdf0;
	display: inline-block;
	/* width: 80px;
	height: 40px; */
} 

#menuByUserClose:hover {
	cursor: pointer;
}
</style>
</head>
<body>
<h2><font color=red>${warnPassword}</font></h2>
	<h1>
		${college_name}<span id="grade">${grade}</span>级学生实习状态统计
	</h1>
	<%String task_grade = (String) request.getAttribute("task_grade"); %>
	选择年级：
	<select id="year" name="year" class="year">
		<option value="2012" <%="2012".equals(task_grade) ? "selected" : ""%>>2012</option>
		<option value="2013" <%="2013".equals(task_grade) ? "selected" : ""%>>2013</option>
		<option value="2014" <%="2014".equals(task_grade) ? "selected" : ""%>>2014</option>
		<option value="2015" <%="2015".equals(task_grade) ? "selected" : ""%>>2015</option>
		<option value="2016" <%="2016".equals(task_grade) ? "selected" : ""%>>2016</option>
	</select>

	<input type="button" id="btn" value="查询" onclick="ajaxToChart()">
	<div id='canvasDiv'></div>

	<div id="customMenuDiv" class="customMenuDiv">
		<span id="getCustomMenu" class="getCustomMenu"><img src="<%=path %>/images/addHead.png"/></span>
		<div id="customMenuDivAjax" class="customMenuDivAjax"></div>
	</div>

	
	<!--<div id="customMenuDiv" class="customMenuDiv">
		<span id="getCustomMenu" class="getCustomMenu">自定义菜单</span>
		<div id="customMenuDivAjax" class="customMenuDivAjax"></div>
	</div>-->

	<div id="menuByUser" class="menuByUser">
		<div id="menuByUserClose"><span class="menuByUserClose">保存</span>
		<span id="menuByUserClose2" class="menuByUserClose2">退出</span></div>
		<div id="menuByUserAjax" class="menuByUserAjax"></div>
	</div>
</body>
</html>
