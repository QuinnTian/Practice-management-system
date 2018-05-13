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
<title>学院管理员首页</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<%-- <script type="text/javascript">
	//定义数据jsonData
	var data = eval("(" + "${cm}" + ")");
	$(function() {
		
		var chart = new iChart.Pie2D({
			render : 'canvasDiv',
			data : data,
			title : {
				text : '${college_name}${grade}级实习状态统计',
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
						window.location.href="<%=path%>/leader/toPracticeStateChartDept.do?stateCode="
										+ s.get('text');
							}
						}
					}
				});

		chart.draw();
	});
</script> --%>
<script>
	function showCollegeChart() {
		document.getElementById("canvasDivFather").innerHTML = "<div id='canvasDiv'></div>";
		$.ajax({
			type : "get",
			/* contentType : "application/json", */
			url : "ajaxGetChartStateDate.do?",
			data : getSendData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "json", //返回的类型为json                
			success : function(data) { //成功时执行的方法					
				showChart(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert(status);
				}
			}
		});

	}
	function getSendData(){
	var College_id=$("selectCollege").val();
	var data="college_id="+College_id;
	return data;
	}
	function showChart(){
	var data = eval("(" + "${cm}" + ")");
		var chart = new iChart.Pie2D({
			render : 'canvasDiv',
			data : data,
			title : {
				text : '${college_name}${grade}级实习状态统计',
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
						window.location.href="<%=path%>/leader/toPracticeStateChartDept.do?stateCode="+ s.get('text');
							}
						}
					}
				});

		chart.draw();
	}
	
</script>
</head>
<body>
	<select id="selectCollege">
		<option id="">电子信息学院</option>
	</select>
	<button onclick="showCollegeChart()">查看</button>
	<div id="canvasDivFather"></div>

</body>
</html>
