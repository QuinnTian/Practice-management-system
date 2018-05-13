<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript" src="<%=path%>/js/ichart.1.2.min.js"></script>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<title>${deptName}${grade}级校外实习学生签到情况</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript">
	//定义数据jsonData
	console.log("ddd");
	var data = eval("(" + "${cm}" + ")");
	var tea_id="${tea_id}";
	console.log(tea_id);
	$(function() {
		
		var chart = new iChart.Pie2D({
			render : 'canvasDiv',
			data : data,
			title : {
				text : '${deptName}${grade}级校外实习学生签到情况',
				color : '#3e576f',
				fontsize : 30
			},
			footnote : {
				text : '实践教学管理系统',
				color : '#486c8f',
				fontsize : 30,
				padding : '0 38'
			},
			sub_option : {
				label : {
					background_color : null,
					sign : false,//设置禁用label的小图标
					padding : '0 3',
					border : {
						enable : false,
						color : '#666666'
					},
					fontsize : 20,
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
			width  : 800,
			fontsize:30,
			height : 800,
			radius : 400,
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
						alert(s.get('text') ); */
						window.location.href="<%=path%>/weixin/bMapSignState.do?tea_id="+tea_id+"&&stateName="+ s.get('text');
							}
						}
					}
				});

		chart.draw();
	});
</script>
</head>
<body>
	<div id='canvasDiv'></div>
	 
</body>
</html>
